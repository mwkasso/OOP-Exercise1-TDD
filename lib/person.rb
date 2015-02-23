require 'Date'

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
    raise 'Incorrect format of email' unless email.match(/^(\w+(\.\w+)?\@\w+\.((com)|(co\.uk))$)/)
    @emails << email
  end

  def remove_email(position)
    @emails.delete_at(position)
  end
	
	def add_phone(phone)
    raise 'Incorrect format of phone number' unless phone.match(/((020[\d]{8})|(07[\d]{9}))/) 
		@phone_numbers << phone
	end

  def remove_phone(position)
    @phone_numbers.delete_at(position)
  end

  def to_s
    return "#{fullname} was born on #{@dob}.\n Their email address are: #{@emails}. \n Their phone numbers are #{@phone_numbers}"
  end
end