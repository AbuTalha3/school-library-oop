require_relative 'app'

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

def process_option(choice, app)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals_for_person
  else
    puts 'Invalid option. Please select a valid option.'
  end
end

def main
  puts 'School Library App!'
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.to_i

    if choice == 7
      puts 'Thanks for using Library!'
      break
    end

    process_option(choice, app)
  end
end

main
