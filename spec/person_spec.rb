require 'spec_helper'

	describe "Person" do 
		let(:person) {person = Person.new "joe", "bloggs", "1 Jan 1990"}
		let(:email1) {"joe@foo.com"}
		let(:email2) {"joe.bloggs@work.com"}
		let(:phone1) {"07712345678"}
		let(:phone2) {"02012345678"}

		describe "The person is an addressbook entry" do
			it "Should have a variable called dob which is Date class" do
				expect(person.dob).to be_a(Date)
			end
			it "Should have the dob.to_s be in the form of year-month-day" do
				expect(person.dob.to_s).to eq("1990-01-01")
			end
			it "Should have first_name and surname capitilized" do
				expect(person.first_name).to eq('Joe')
				expect(person.surname).to eq('Bloggs')
			end
			it "Should have first_name and surname together" do
				expect(person.fullname).to eq('Joe Bloggs')
			end
		end

		describe "The person will have one or more emails" do
			it "Should store emails in an array" do
				expect(person.emails).to eq([])
			end
			it "Should place email into the array" do
				person.add_emails email1
				person.add_emails email2
				expect(person.emails).to eq([email1, email2])
			end
			it "Should remove an email from the array" do
				person.add_emails email1
				person.add_emails email2
				person.remove_email(0)
				expect(person.emails).to eq([email2])
			end
		end

		describe "The person will have one or more phone numbers" do
			it "Should store phone numbers in an array" do
				expect(person.phone_numbers).to eq([])
			end
			it "Should place phone number into the array" do
				person.add_phone phone1
				person.add_phone phone2
				expect(person.phone_numbers).to eq([phone1, phone2])
			end
			it "Should remove a phone number from the array" do
				person.add_phone phone1
				person.add_phone phone2
				person.remove_phone(0)
				expect(person.phone_numbers).to eq([phone2])
			end
		end

		describe "The person should give a description using to_s" do
			it "Should give a description" do
				person.add_emails email1
				person.add_emails email2
				person.remove_email(0)
				person.add_phone phone1
				person.add_phone phone2
				expect(person.to_s).to eq("Joe Bloggs was born on 1990-01-01.\n Their email address are: [\"joe.bloggs@work.com\"]. \n Their phone numbers are [\"07712345678\", \"02012345678\"]")
			end
		end

		# describe "The person can print details" do
		# 	it "Should print details in a certain format" do 
		# 		expect(person.print_details).to eq("Joe Bloggs\n#{'-'*'Joe Bloggs'.length}\nDate of Birth: 01 January 1990\n")
		# 	end
		# end
	end

