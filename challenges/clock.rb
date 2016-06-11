require 'pry'

class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(minutes)
    @minute += minutes 
    @hour += @minute/60
    @minute = @minute % 60
    @hour = @hour % 24 if @hour >= 24
    self
  end

  def to_minutes
    @hour * 60 + @minute
  end

  def to_time(minutes)
    @hour = minutes / 60
    @hour += 24 if @hour < 0
    @minute = minutes % 60
    self
  end

  def -(minutes)
    mins = to_minutes - minutes
    to_time(mins)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def convert_hour
    return "0#{@hour}" if @hour < 10
    @hour
  end

  def convert_minute
    return "0#{@minute}" if @minute < 10
    @minute
  end

  def to_s
    "#{convert_hour}:#{convert_minute}"
  end

end
