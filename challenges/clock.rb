require 'pry'

class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
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

  def normalize(digits)
    return "0#{digits}" if digits < 10
    digits 
  end

  def to_s
    "#{normalize(@hour)}:#{normalize(@minute)}"
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end
end
