require 'Date'

class Person
	attr_accessor :dob, :first_name, :surname
	def initialize(name,surname,dob)
		@dob = Date.parse(dob)
		@first_name = name.capitalize
		@surname = surname.capitalize
	end

	def fullname
		"#{@first_name} #{@surname}"
	end
end