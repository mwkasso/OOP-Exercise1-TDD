require 'spec_helper'

  describe "AddressBook" do

    #let(symbol) {variable = class instance}
    let(:book) {book = AddressBook.new}
    let(:person) {person = Person.new "joe", "bloggs", "1 Jan 1990"}

    describe "Address book should contain person entries" do

      it "Should store Person in an array" do
        expect(book.addressbook).to eq([])
      end

      it "Should add person into the address book" do
				
        book.add person
        expect(book.addressbook).to eq([person])
      end

      it "Should give an error if a class is not a Person or its subclasses" do
        expect{book.add"Not a person"}.to raise_error
      end
			
      it "Should remove a person based on first name entered" do
        book.add person
        book.remove "joe"
        expect(book.addressbook).not_to include person
      end
    end

    describe "Load yaml file" do
      it "file variable must a File class" do
        expect(book.file).to be_a(File)
      end
      
    end
  end