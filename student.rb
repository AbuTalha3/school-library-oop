require_relative 'person'

# for students
class Student < Person
  attr_reader :classroom

  def initialize(age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
    # attr_reader :classroom

    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

def classroom(classroom)
  @classroom = classroom
  classroom.students.push(self) unless classroom.students.include?(self)
end
