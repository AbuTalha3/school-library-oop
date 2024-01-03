require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :people, :book, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_teacher
    puts 'Age'
    age = gets.chomp
    puts 'Name'
    name = gets.chomp
    puts 'Specialization'
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  def create_student
    puts 'Age'
    age = gets.chomp
    puts 'Name'
    name = gets.chomp
    puts 'Have Parent permission?[Y/N]'
    parent_permission = gets.chomp.downcase == 'y'
    @people << Student.new(age, name, parent_permission: parent_permission)
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to add a student (1) or a teacher (2)? [select number 1 or 2]:'
    person_type = gets.chomp.to_i

    if person_type == 2
      create_teacher
    else
      create_student
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the list by number (not by id):"
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Created rental successfully'
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def display_menu
    puts "\nPlease choose an option by serial number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person teacher or student'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Quit'
  end

  def process_option(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    else
      puts 'Invalid option. Please select a valid option.'
    end
  end

  def run
    loop do
      display_menu
      option = gets.chomp.to_i

      if option == 7
        puts 'Thanks for using Library!'
        break
      end
      process_option(option)
    end
  end
end
