require 'spec_helper'

  describe "AddressBook" do

    #let(symbol) {variable = class instance}
    let(:book) {book = AddressBook.new}
    let(:person) {person = Person.new "joe", "bloggs", "1 Jan 1990"}
    let(:data) {data = YAML.load(File.open('phonebook.yaml'))}
    let(:personentry1) {data["people"][0] ["fname"]}
    let(:personentry2) {data["people"][1] ["fname"]}
    let(:emailsentry1) {data["people"][0] ["emails"]}
    let(:emailsentry2) {data["people"][1] ["emails"]}
    let(:phonesentry1) {data["people"][0] ["phones"]}
    let(:phonesentry2) {data["people"][1] ["phones"]}

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
        expect(book.file('phonebook.yaml')).to be_a(File)
      end
      it "Should load people from the file into the addressbook" do
        book.file('phonebook.yaml')
        book.load
        expect(book.addressbook[0].first_name).to eq(personentry1)
        expect(book.addressbook[1].first_name).to eq(personentry2)
      end
      it "Should load emails into person entries from file" do
        book.file('phonebook.yaml')
        book.load
        expect(book.addressbook[0].emails).to eq(emailsentry1)
        expect(book.addressbook[1].emails).to eq(emailsentry2)        
      end
      it "Should load phones into person entries from file" do
        book.file('phonebook.yaml')
        book.load
        expect(book.addressbook[0].phone_numbers).to eq(phonesentry1)
        expect(book.addressbook[1].phone_numbers).to eq(phonesentry2)        
      end
    end
  end