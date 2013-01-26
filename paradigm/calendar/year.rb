class Year
  attr_accessor :thisYear, :months, :is_leap

  def initialize(year, months, is_leap)
    @thisYear = year
    @months = months
    @is_leap = is_leap
  end

  def print_all
    puts @thisYear
    months.each { |month| month.print_month }
  end
end