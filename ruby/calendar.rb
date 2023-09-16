require 'date'
require 'optparse'

class Calendar
  attr_reader :selected_month, :year

  def initialize(year: Date.today.year)
    @selected_month = option_parser || Date.today.month
    @year = year
    option_error_message
  end

  def display 
    display_month_year
    display_weekdays
    display_days
  end

  private

  def option_parser
    opt = OptionParser.new
    opt_month = nil
    opt.on('-m VAL') do |m|
      opt_month = m.to_i
    end
    opt.parse!(ARGV)
    opt_month
  end

  def option_error_message
    unless (1..12).include?(@selected_month)
      puts "error #{@selected_month} is neither a month number (1..12) nor a name "
      exit
    end
  end

  def display_month_year
    puts "#{@selected_month}月 #{year}".center(20)
  end

  def display_weekdays
    puts " 月 火 水 木 金 土 日"
  end
  
  def display_days
    first_date_of_month = Date.new(year, selected_month, 1)
    last_date_of_month = Date.new(year, selected_month, -1)

    first_weekday = first_date_of_month.wday

    days_in_month = (first_date_of_month.day..last_date_of_month.day).to_a

    days_with_weekdays = []
    current_weekday = first_weekday
    (days_in_month).map do |day|
      days_with_weekdays << {day: day, weekday: current_weekday}
      current_weekday = (current_weekday + 1) % 7  
    end

    space = "   "
    if first_weekday == 0
      print first_space = space * 6
    else
      print first_space = space * (first_weekday - 1)
    end

    days_with_weekdays.each do |date|
      print "#{date[:day]}".rjust(3)
      puts "" if date[:weekday] == 0
    end
    puts ""
  end
end

calendar = Calendar.new
calendar.display
