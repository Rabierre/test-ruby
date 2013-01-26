class WordCounter
  attr_accessor :wordCounts

  def initialize
    @wordCounts = Hash.new
  end

  def count file_name
    File.new(file_name, "r").each_line { |line|
      split_line = line.split(Regexp.compile "[\s|\t|\n]")

      split_line.each { |word|
        if @wordCounts.has_key? word then
          @wordCounts[word] += 1
        else
          @wordCounts = @wordCounts.merge({word => 1})
        end
      }
    }
    @wordCounts
  end

  def printAll
    @wordCounts.each { |wordValuePair|
      print "key : ", wordValuePair[0], ", count : ", wordValuePair[1], "\n"
    }
  end
end

# test code
wordCounter = WordCounter.new
puts wordCounter.count "test.txt"
wordCounter.printAll
