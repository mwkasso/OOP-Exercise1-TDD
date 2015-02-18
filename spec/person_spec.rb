require 'spec_helper'

	describe "Person" do 
		describe "The person is an addressbook entry" do
			it "should store and return personal information" do

				person = Person.new "joe", "bloggs", "1 Jan 1990"

				#Expected outcomes
				expect(person.dob).to be_a(Date)
				expect(person.dob.to_s).to eq("1990-01-01")
				expect(person.first_name).to eq('Joe')
				expect(person.surname).to eq('Bloggs')
				expect(person.fullname).to eq('Joe Bloggs')
			end
		end
	end