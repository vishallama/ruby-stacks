# lib/stack.rb

class Stack

  def initialize
    @top = nil
  end

  def pop
    raise RuntimeError, "empty stack" if empty?

    popped_node = top
    @top = top.next
    popped_node
  end

  def push(some_node)
    if empty?
      @top = some_node
    else
      @top = top.append(some_node)
    end
    self
  end

  def empty?
    top.nil?
  end

  private

  def top
    @top
  end

end

