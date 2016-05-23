require 'byebug'
require 'pry'
#byebug

class ToDo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class ToDoList
  attr_accessor :title
  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == ToDo
      @todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    @todos[index].done!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    puts "---- #{title} ----\n"
    @todos.each do |todo|
      puts todo.to_s
    end
  end

  def each
    counter = 0
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
    self
  end

  def select
    array = []
    each do |todo|
      array << todo if yield(todo)
    end
    list = ToDoList.new('')
    array.each do |item|
      list.add(item)
    end
    list
  end
end

todo1 = ToDo.new("Buy milk")
todo2 = ToDo.new("Clean room")
todo3 = ToDo.new("Go to gym")

list = ToDoList.new("Today's Todos")

list.add(todo1) # adds todo1 to end of list, returns list
list.add(todo2) # adds todo2 to end of list, returns list
list.add(todo3) # adds todo3 to end of list, returns list

todo1.done!

results = list.select { |todo| todo.done? }

puts '---------------'
puts results.inspect


