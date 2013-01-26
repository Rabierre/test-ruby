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