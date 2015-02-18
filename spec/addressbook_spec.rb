require 'spec_helper'

	describe "AddressBook" do
		describe "Address book should contain person entries" do
			it "Should store Person in an array" do
				book = AddressBook.new
				expect(book.addressbook).to eq([])
			end
			it "Should add person into the address book" do
				book = AddressBook.new
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				book.add person
				expect(book.addressbook).to eq([person])
			end
			it "Should give an error if a class is not a Person or its subclasses" do
				book = AddressBook.new
				expect{book.add"Not a person"}.to raise_error
			end
			it "Should remove a person based on first name entered" do
				book = AddressBook.new
				person = Person.new "joe", "bloggs", "1 Jan 1990"
				book.add person
				book.remove "joe"
				expect(book.addressbook).not_to include person
			end
  	end
	end