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
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == ToDo
      todos << todo
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    todos[index].done!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    puts "---- #{title} ----\n"
    todos.each do |todo|
      puts todo.to_s
    end
  end
end

#todo1 = ToDo.new("Buy milk")
#todo2 = ToDo.new("Clean room")
#todo3 = ToDo.new("Go to gym")

#list = ToDoList.new("Today's Todos")

#list.add(todo1) # adds todo1 to end of list, returns list
#list.add(todo2) # adds todo2 to end of list, returns list
#list.add(todo3) # adds todo3 to end of list, returns list
##list.add(1)     # raises TypeError with message "Can only add Todo objects"

#p list.size
#p list.first
#p list.last

#p list.item_at
#p list.item_at 1

#list.mark_done_at
#list.mark_done_at(1)
#list.to_s


