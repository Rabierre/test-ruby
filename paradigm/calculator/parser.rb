module Parser
  def is_operator token
    Regexp.compile(Operator::CATEGORIES).match(token.to_s)
  end

  def is_lower_than source, target
    Operator::PRIORITIES[source] < Operator::PRIORITIES[target]
  end

  def trans_reverse_polish_notation tokens
    reverse_polished = []
    operator_stack = []

    tokens.each { |token|
      if token == nil
        return
      end

      if is_operator token
        stack_top = operator_stack.reverse[0]

        if stack_top != nil && is_lower_than(token, stack_top)
          operator_stack.pop
          operator_stack << token
          reverse_polished << stack_top
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

  def parse args
    tokens = [], operand = ""

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
end
