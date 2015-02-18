require 'spec_helper'

	describe "Person" do 
		describe "The person is an addressbook entry" do
			it "Should have a variable called dob which is Date class" do
				#Expected outcomes
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				expect(person.dob).to be_a(Date)
			end
			it "Should have the dob.to_s be in the form of year-month-day" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				expect(person.dob.to_s).to eq("1990-01-01")
			end
			it "Should have first_name and surname capitilized" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				expect(person.first_name).to eq('Joe')
				expect(person.surname).to eq('Bloggs')
			end
			it "Should have first_name and surname together" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				expect(person.fullname).to eq('Joe Bloggs')
			end
		end

		describe "The person will have one or more emails" do
			it "Should store emails in an array" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				expect(person.emails).to eq([])
			end
			it "Should place email into the array" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				person.add_emails "joe@foo.com"
				person.add_emails "joe.bloggs@work.com"
				expect(person.emails).to eq(["joe@foo.com", "joe.bloggs@work.com"])
			end
			it "Should remove an email from the array" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				person.add_emails "joe@foo.com"
				person.add_emails "joe.bloggs@work.com"
				person.remove_email(0)
				expect(person.emails).to eq(["joe.bloggs@work.com"])
			end
		end

		describe "The person will have one or more phone numbers" do
			it "Should store phone numbers in an array" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				expect(person.phone_numbers).to eq([])
			end
			it "Should place phone number into the array" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				person.add_phone "07712345678"
				person.add_phone "02012345678"
				expect(person.phone_numbers).to eq(["07712345678", "02012345678"])
			end
			it "Should remove a phone number from the array" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				person.add_phone "07712345678"
				person.add_phone "02012345678"
				person.remove_phone(0)
				expect(person.phone_numbers).to eq(["02012345678"])
			end
		end

		describe "The person should give a description using to_s" do
			it "Should give a description" do
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				person.add_emails "joe@foo.com"
				person.add_emails "joe.bloggs@work.com"
				person.remove_email(0)
				person.add_phone "07712345678"
				person.add_phone "02012345678"
				expect(person.to_s).to eq("Joe Bloggs was born on 1990-01-01.\n Their email address are: [\"joe.bloggs@work.com\"]. \n Their phone numbers are [\"07712345678\", \"02012345678\"]")
			end
		end

		# describe "The person can print details" do
		# 	it "Should print details in a certain format" do 
		# 		expect(person.print_details).to eq("Joe Bloggs\n#{'-'*'Joe Bloggs'.length}\nDate of Birth: 01 January 1990\n")
		# 	end
		# end
	end

	describe "FamilyMember" do
		describe "Family member should inherit from person" do
			it "FamilyMember inherits from person" do
				familymember = FamilyMember.new "single" "joe", "bloggs", "1 Jan 1990"
				expect(familymember.class < Person).to be true
			end
		end
		describe "Family member should have a relationship status" do
			it "FamilyMember should have an instance variable" do 
				familymember = FamilyMember.new "single", "joe", "bloggs", "1 Jan 1990"
				expect(familymember.relationship).to eq("single")
			end
		end
	end