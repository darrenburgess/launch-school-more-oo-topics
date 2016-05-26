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

  def undone?
    done == false
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
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
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
    list = ToDoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? ToDo
    @todos << todo
  end
  alias_method :add, :<<

  def find_by_title(title)
    select {|todo| todo.title == title}.first
  end

  def all_done
    select {|todo| todo.done? }
  end

  def all_not_done
    select {|todo| todo.undone? }
  end

  def mark_done(title)
    find_by_title(title).done!
  end

  def mark_all_done
    each {|todo| todo.done! }
  end

  def mark_all_undone
    each {|todo| todo.undone! }
  end
end
