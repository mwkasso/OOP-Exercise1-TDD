require 'Date'
require 'yaml'
#require_relative
class Person
  attr_accessor :dob, :first_name, :surname
  attr_reader :emails, :phone_numbers

  def initialize(name,surname,dob = nil)
    @dob = Date.parse(dob) if dob !=nil
    @first_name = name.capitalize
    @surname = surname.capitalize
    @emails = []
    @phone_numbers = []
  end

  def fullname
    "#{@first_name} #{@surname}"
  end

  def add_emails(email)
    if email
    @emails << email
  end

  def remove_email(position)
    @emails.delete_at(position)
  end

  def add_phone(phone)
    @phone_numbers << phone
  end

	def remove_email(position)
		@emails.delete_at(position)
	end
	
	def add_phone(phone)
		@phone_numbers << phone
	end

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

  def remove(name)
    @addressbook.each_with_index {|value, index| @addressbook.delete_at(index) if value.first_name == name.capitalize}
  end

	def remove(name)
		@addressbook.each_with_index {|value, index| @addressbook.delete_at(index) if value.first_name == name.capitalize}
	end

  def file(file)
    @file = File.open(file)
  end

  def load
    if @file != nil
    data = YAML.load(@file)
    data["people"].each_with_index do |x,i|
      person = Person.new(data["people"][i] ["fname"], data["people"][i] ["surname"], data["people"][i] ["dob"])
      data["people"][i] ["emails"].each do |x| 
        person.add_emails(x)
      end
      data["people"][i] ["phones"].each do |x| 
        person.add_phone(x)
      end
      addressbook << person
    end
    end
  end
end
