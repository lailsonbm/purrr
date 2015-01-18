require "virtus"

class Purrr::User
  include Virtus.model

  attribute :name, String
  attribute :age, Integer
  attribute :birthday, DateTime

  def self.all
  	@@users ||= [
  	  new(name: 'John', age: 21),
  	  new(name: 'Mary', age: 17)
  	]
  end
end