require 'pry'

class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def time_to_minutes
    @hour * 60 + @minute
  end

  def minutes_to_time(minutes)
    @hour = minutes / 60
    @hour += 24 if @hour < 0
    @hour -= 24 if @hour >= 24 
    @minute = minutes % 60
    self
  end

  def +(minutes)
    mins = time_to_minutes + minutes
    minutes_to_time(mins)
  end

  def -(minutes)
    mins = time_to_minutes - minutes
    minutes_to_time(mins)
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

  def ==(other_clock)
    to_s == other_clock.to_s
  end
end
