require 'yaml'

file = File.open('phonebook.yaml')

data = YAML.load(file)