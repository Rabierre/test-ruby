load "operator.rb"

class Calculus
  def calculate tokens
    stack = []
    tokens.each { |token|
      if stack.length >= 2 && is_operator(token)
        last_value = stack.pop  # todo value order is wicked
        first_value = stack.pop
        stack << operate(first_value, last_value, token)
      else
        stack << token
      end
    }
    stack.pop
  end

  def operate first_value, second_value, operator
    case (operator)
      when "+"
        return first_value.to_i + second_value.to_i
      when "-"
        return first_value.to_i - second_value.to_i
      when "*"
        return first_value.to_i * second_value.to_i
      when "/"
        return first_value.to_i / second_value.to_i
      when "%"
        return first_value.to_i % second_value.to_i
    end
  end

  def is_operator token
    Regexp.compile(Operator::CATEGORIES).match(token.to_s)
  end
end

# test code
puts "Calculus class test code"
puts Calculus.new.calculate [1, 2, "+"]
puts Calculus.new.operate 1, 2, "+"
print "4 / 2 = ",  Calculus.new.operate(4, 2, "/"), "\n"
puts Calculus.new.is_operator "+"
puts "===================================="

