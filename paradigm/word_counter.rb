class WordCounter
  attr_accessor :counts

  def initialize
    @counts = Hash.new
  end

  def count file_name
    File.new(file_name, "r").each_line { |line|
      split_line = line.split(Regexp.compile "[\s|\t|\n]")

      split_line.each { |word|
        if @counts.has_key? word then
          @counts[word] += 1
        else
          @counts = @counts.merge({word => 1})
        end
      }
    }
    @counts
  end

  def printAll
    @counts.each { |wordValuePair|
      print "key : ", wordValuePair[0], ", count : ", wordValuePair[1], "\n"
    }
  end
end

# test code
wordCounter = WordCounter.new
puts wordCounter.count "test.txt"
wordCounter.printAll
