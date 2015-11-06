require_relative 'entry'

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
 end