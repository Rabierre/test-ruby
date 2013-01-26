load "calendar/year.rb"
load "calendar/month.rb"

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