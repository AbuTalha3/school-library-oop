require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'nameable'

# for person
class Person

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
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

