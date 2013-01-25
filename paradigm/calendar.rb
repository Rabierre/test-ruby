class Calendar
  attr_accessor :year

  def initialize(year)
    @year = CalendarFactory.new.create(year)
  end

  def print_year
    @year.print_all
  end
end

# Year class
class Year
  attr_accessor :year, :months, :is_leap

  def initialize(year, months, is_leap)
    @year = year
    @months = months
    @is_leap = is_leap
  end

  def print_all
    puts @year
    months.each { |month| month.print_month }
  end
end

# Month class
class Month
  attr_accessor :month, :start_date, :length

  def initialize(month, length, start_date)
    @month = month
    @length = length
    @start_date = start_date
  end

  def print_month
    days = ""

    @start_date.times do
      days += "\t"
    end

    (1..@length).to_a.each { |day|
      days += day.to_s
      days += ((day + @start_date) % 7 == 0 ? "\n" : "\t")
    }

    puts month.to_s + "월", days, "\n"
  end
end

# Calendar Factory class
class CalendarFactory
  def initialize
  end

  def create(year)
    Year.new(year, months_of_year(year), is_leap(year))
  end

  def months_of_year(year)
    months = [];
    (1..12).to_a.each { |month|
      months << Month.new(month, length_of_month(year, month), start_date(year, month))
    }
    months
  end

  def length_of_month(year, month)
    case month
      when 1, 3, 5, 7, 8, 10, 12
        return 31
      when 4, 6, 9, 11
        return 30
      when 2
        return (is_leap(year) ? 29 : 28)
    end
  end

  def start_date(year, month)
    total = 0;

    (1..year - 1).to_a.each { |x|
      total += (is_leap(x) ? 366 : 365)
    }
    (1..month - 1).to_a.each { |x|
      total += length_of_month(year, x)
    }

    (total + 1) % 7
  end

  def is_leap(year)
    (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
  end
end


## test code
#Calendar.new(2012).print_all # leap year

puts CalendarFactory.new.is_leap(2012) # true
puts CalendarFactory.new.is_leap(2013) # false
puts CalendarFactory.new.length_of_month(2012, 2) # 29
puts CalendarFactory.new.length_of_month(2013, 2) # 28
puts CalendarFactory.new.create(2012).year # 2012
puts CalendarFactory.new.create(2013).months.class # Array
puts CalendarFactory.new.create(2013).months.size # 12
months_of_2013 = CalendarFactory.new.create(2013).months
months_of_2013.each { |month| print(month.month, "월 : ", month.length, "일, 시작일 : ", month.start_date, "\n") }
CalendarFactory.new.create(2013).print_all