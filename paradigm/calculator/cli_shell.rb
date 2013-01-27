# terminal user interface
class CliShell
  attr_accessor :operators, :priorities

  def initialize
    @operators = /[\+|\-|\*|\/|\^]/
    @priorities = {"+" => 1, "-" => 1, "*" => 2, "/" => 2, "^" => 3}
  end

  def run
    while true do
      execution = gets
      preprocessed_tokens = trans_reverse_polish_notation parse execution
      # todo calculate
    end
  end

  def parse args
    tokens=[], operand=""

    args.each_char do |value|
      if is_operator value
        tokens << operand
        tokens << value
        operand = ""
      else
        operand += value
      end
    end
    tokens << operand

    tokens
  end

  def trans_reverse_polish_notation tokens
    reverse_polished = []
    operator_stack = []

    tokens.each { |token|
      if is_operator token
        peek = operator_stack.reverse[0]
        if peek != nil && priorities[token] < priorities[peek]
          index = operator_stack.index(peek)
          operator_stack[index] = token
          reverse_polished << peek
        end
        operator_stack << token
      else
        reverse_polished << token
      end
    }

    operator_stack.reverse.each { |token|
      reverse_polished << token
    }

    reverse_polished
  end

  def is_operator token
    Regexp.compile(@operators).match(token.to_s)
  end
end


puts CliShell.new.parse "10+20"
puts CliShell.new.trans_reverse_polish_notation [10, "+", 20, "/", 2]
#"hello".each_char { |char| puts char }
