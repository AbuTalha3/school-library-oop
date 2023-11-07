# frozen_string_literal: true

# for person

# for person
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person1 = Person.new(1, 17, name: 'Abutalha', parent_permission: false)
person2 = Person.new(2, 16, name: 'Rex')
person3 = Person.new(3, 35, name: 'Unknown', parent_permission: true)

puts person1.can_use_services? # false
puts person2.can_use_services? # true
puts person3.can_use_services? # true
