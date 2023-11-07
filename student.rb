# frozen_string_literal: true

# for students

require_relative 'person'

# for students
class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(id, age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

student1 = Student.new(1, 17, name: 'Abutalha', parent_permission: false, classroom: 'Computer')
student2 = Student.new(2, 16, name: 'Rex', classroom: 'Physics')

puts student1.name # Abutalha
puts student1.classroom # Computer
puts student1.can_use_services? # false

puts student2.age # 16
puts student2.classroom # Physics
puts student2.can_use_services? # true
