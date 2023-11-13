require_relative 'app'

def main
  app = App.new
  puts '*' * 50
  puts "|\tWelcome to the School Library App!\t\t |"
  puts '*' * 50
  app.run
end

main
