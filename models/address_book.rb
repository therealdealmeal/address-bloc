require_relative 'entry'
require "csv"


 class AddressBook
   attr_accessor :entries

   def initialize
     @entries = []
   end
   
   def remove_entry(name, phone, email)
    delete_entry = nil
    
    @entries.each do |entry|
        if name == entry.name && phone == entry.phone_number && email == entry.email
            delete_entry = entry
     end
    end
    
    @entries.delete(delete_entry) 
  end 
   
   def add_entry(name, phone, email)
 # #9
     index = 0
     @entries.each do |entry|
 # #10
       if name < entry.name
         break
       end
       index += 1
     end
 # #11
     @entries.insert(index, Entry.new(name, phone, email))
   end
   
   def import_from_csv(file_name)
    csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
 # #8
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
    end
    
   def iterative_search(name)
     @entries.each do |entry|
      if entry.name == name
       return entry
     end
   end
   
   return nil
  end
    
    def binary_search(name)
      # #1
     lower = 0
     upper = entries.length - 1

 # #2
     while lower <= upper
 # #3
       mid = (lower + upper) / 2
       mid_name = entries[mid].name
 
 # #4
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
     
     return nil
   end
   
 end