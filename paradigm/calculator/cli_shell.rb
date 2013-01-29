require File.expand_path(File.dirname(__FILE__) + '/parser.rb')
load "calculus.rb"

# terminal user interface
class CliShell
  include Parser

  def initialize
  end

  def run
    while true do
      puts "input execution >>"
      execution = gets.chomp
      if execution.eql? "exit"
        exit
      end
      preprocessed_tokens = trans_reverse_polish_notation parse execution
      print ">> ", Calculus.new.calculate(preprocessed_tokens)
      puts
    end
  end
end

# test code
puts "CliShell class test code"
puts CliShell.new.parse "10+20"
puts "-----------------------------------------------"
puts CliShell.new.trans_reverse_polish_notation [10, "+", 20, "/", 2]
puts "-----------------------------------------------"
puts CliShell.new.is_operator "+"
puts "-----------------------------------------------"
puts

# run code
CliShell.new.run
puts "===================================="
