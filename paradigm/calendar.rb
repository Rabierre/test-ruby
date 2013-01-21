class Calendar
  attr_accessor :year, :months, :start_day, :is_leap_year

  def initialize year
    @year = year
    @months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @start_day = 1 # todo calculate need
    @is_leap_year = is_leap_year
  end

  def print_all
    @months.each { |x|
      print x, "월\n"

      case x
        when 1, 3, 5, 7, 8, 10, 12
          print_days 31
        when 4, 6, 9, 11
          print_days 30
        when 2
          print_days (is_leap_year ? 29 : 28)
      end
      puts
    }
  end

  # @param [int] date_count
  def print_days date_count
    (1..date_count).to_a.each { |x| print x, (x % 7 == 0 ? "\n" :"\t") }
    puts
  end

  def is_leap_year
    (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
  end
end

## test code
Calendar.new(2012).print_all # leap year

puts Calendar.new(2013).is_leap_year # false
puts Calendar.new(2012).is_leap_year # true