require 'Date'

class Person
  attr_accessor :dob, :first_name, :surname
  attr_reader :emails, :phone_numbers
  def initialize(name,surname,dob = nil)
    @dob = Date.parse(dob) if dob !=nil
    @first_name = name.capitalize
    @surname = surname.capitalize
    @emails = []
    @phone_numbers = [1]
  end

  def fullname
    "#{@first_name} #{@surname}"
  end

  def add_emails(email)
    @emails << email
  end

<<<<<<< HEAD
  def remove_email(position)
    @emails.delete_at(position)
  end

  def add_phone(phone)
    @phone_numbers << phone
  end
=======
	def remove_email(position)
		@emails.delete_at(position)
	end
	
	def add_phone(phone)
		@phone_numbers << phone
	end
>>>>>>> 7177c99680cf6aee008401177099f492b71d26b2

  def remove_phone(position)
    @phone_numbers.delete_at(position)
  end

  def to_s
    return "#{fullname} was born on #{@dob}.\n Their email address are: #{@emails}. \n Their phone numbers are #{@phone_numbers}"
  end

end

# FamilyMember class

class FamilyMember < Person
  attr_accessor :relationship
  # *args splat parse as many args as you want
  def initialize(relationship = "relative" ,*args)
    @relationship = relationship
    super
  end
end

class AddressBook
  attr_reader :addressbook

  def initialize
    @addressbook = []
  end

  def add(person)
    if person.class <= Person
      @addressbook << person
    else
      # raise "error message" can also work
      raise 'Input is not a person'
    end
  end

<<<<<<< HEAD
  def remove(name)
    @addressbook.each_with_index {|value, index| @addressbook.delete_at(index) if value.first_name == name.capitalize}
  end
end
=======
	def remove(name)
		@addressbook.each_with_index {|value, index| @addressbook.delete_at(index) if value.first_name == name.capitalize}
	end
end
>>>>>>> 7177c99680cf6aee008401177099f492b71d26b2
