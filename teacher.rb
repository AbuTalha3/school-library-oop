require_relative 'Person'

# for teacher
class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age, name: 'Unknown', parent_permission: true, specialization: 'Unknown')
    super(id, age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(1, 33, name: 'Stephen', specialization: 'English')
teacher2 = Teacher.new(2, 25, name: 'Mark', specialization: 'Physics')

puts teacher1.name # Stephen
puts teacher1.age # 33
puts teacher1.specialization # English
puts teacher1.can_use_services? # true

puts teacher2.name # Mark
puts teacher2.age # 25
puts teacher2.specialization # Physics
puts teacher2.can_use_services? # true
