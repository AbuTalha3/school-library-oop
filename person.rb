require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'nameable'

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

  def add_rentals(_person, date)
    Rental.new(date, book, self)
  end

  has_many :rentals
end
