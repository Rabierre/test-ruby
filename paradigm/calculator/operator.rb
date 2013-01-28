# Constant variable container class
class Operator
  CATEGORIES = /\*\*|[\+|\-|\*|\/|\^|\%]/
  PRIORITIES = {"+" => 1, "-" => 1, "*" => 2, "/" => 2, "%" => 2, "**" => 3}
end

# test code
puts "Operator class test code"
puts "**".match Operator::CATEGORIES
puts Operator::PRIORITIES["+"]
puts Operator::PRIORITIES["-"]
puts Operator::PRIORITIES["*"]
puts Operator::PRIORITIES["/"]
puts Operator::PRIORITIES["%"]
puts Operator::PRIORITIES["**"]
puts 2**3
puts "===================================="
