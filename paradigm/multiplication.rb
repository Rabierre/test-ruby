class Multiplication
  attr_accessor :elements; # 1~9 numbers

  def initialize
    @elements = Array[1, 2, 3, 4, 5, 6, 7, 8, 9];
  end

  def printAll
    @elements.each { |x|
      for y in @elements
        print x * y, "\t";
      end
      print "\n" }
  end
end

multiplication = Multiplication.new;
multiplication.printAll;

