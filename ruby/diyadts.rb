class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end


end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key)
      @map.each_with_index { |pair, i| @map[i] = [key, value] if pair.first == key }
    else
      @map.push([key, value])
    end
  end

  def lookup(key)
    @map. each { |pair| return pair.last if pair.first == key }
    nil
  end

  def remove(key)
    @map.delete_if { |pair| pair.first == key }
    nil
  end

  def show
    @map
  end


end
