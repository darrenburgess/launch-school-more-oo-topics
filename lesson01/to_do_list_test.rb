require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
system 'clear'
require 'pry'
require 'simplecov'
SimpleCov.start

require_relative 'to_do_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = ToDo.new 'Buy milk'
    @todo2 = ToDo.new 'Clean room'
    @todo3 = ToDo.new 'Go to gym'
    @todos = [@todo1, @todo2, @todo3]

    @list = ToDoList.new "Today's Todos"
    @list.add @todo1
    @list.add @todo2
    @list.add @todo3
  end

  def test_to_a
    assert_equal @todos, @list.to_a
  end

  def test_size
    assert_equal @todos.size, 3
  end

  def test_first
    assert_equal @list.first, @todo1
  end

  def test_last
    assert_equal @list.last, @todo3
  end

  def test_shift
    first = @list.shift 
    assert_equal @list.size, 2
    assert_equal first, @todo1
  end

  def test_pop
    last = @list.pop
    assert_equal @list.size, 2
    assert_equal last, @todo3
  end

  def test_done?
    assert_equal false, @list.done?
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("hi") }
  end

  def test_add
    @list.add @todo3
    assert_equal @list.last, @todo3
    @list << @todo2
    assert_equal @list.last, @todo2
  end

  def test_item_at
    assert_equal @list.item_at(0), @todo1
    assert_raises(IndexError) { @list.item_at(100)}
  end
  
  def test_mark_done_at
    assert_equal @list.mark_done_at(0), @list.item_at(0).done?
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal true, @list.done?
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal true, @todos.all? {|todo| todo.undone?}
  end

  def test_remove_at
    @list.remove_at 0
    assert_equal 2, @list.size
    assert_raises(IndexError) { @list.remove_at 100 }
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
      
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at 0
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_all_done
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    count = 0
    @list.each { count += 1 }
    assert_equal 3, count
  end
  
  def test_each_return_value
    return_value = @list.each { nil }
    assert_equal @list, return_value
  end

  def test_todo_title
    assert_equal @todo1.title, "Buy milk"
  end

  def test_todo_description
    todo = ToDo.new 'title', 'description'
    assert_equal todo.description, 'description'
  end
end
