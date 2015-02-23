require 'yaml'

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