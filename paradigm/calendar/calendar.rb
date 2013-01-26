load "calendar/calendar_factory.rb"

class Calendar
  attr_accessor :thisYear

  def initialize(year)
    @thisYear = CalendarFactory.new.create(year)
  end

  def print_year
    @thisYear.print_all
  end
end


# test code
puts CalendarFactory.new.is_leap(2012) # true
puts CalendarFactory.new.is_leap(2013) # false
puts CalendarFactory.new.length_of_month(2012, 2) # 29
puts CalendarFactory.new.length_of_month(2013, 2) # 28
puts CalendarFactory.new.create(2012).thisYear # 2012
puts CalendarFactory.new.create(2013).months.class # Array
puts CalendarFactory.new.create(2013).months.size # 12

months_of_2013 = CalendarFactory.new.create(2013).months
months_of_2013.each { |month| print(month.month, "월 : ", month.length, "일, 시작일 : ", month.start_date, "\n") }

CalendarFactory.new.create(2013).print_all