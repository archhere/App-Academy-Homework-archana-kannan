class Stack
  attr_accessor :stack

    def initialize
      # create ivar to store stack here!
      @stack=[]
    end

    def add(el)
      # adds an element to the stack
      @stack << el
    end

    def remove
      # removes one element from the stack
      @stack.pop
    end

    def show
      # return a copy of the stack
      @stack.dup
    end
end

class Queue
  def initialize
    @stack=[]
  end

  def enqueue(el)
    @stack.unshift(el)
  end

   def dequeue
    @stack.pop
  end

  def show
    @stack.dup
  end
end


class Map

  def initialize
    @set=[]
  end

  def keys
    result = []
    @set.each {|arr| result << arr.first}
    result
  end

  def lookup(key)
    @set.each {|value| return value[1] if value[0] == key}
    nil
  end

  def assign(key,value)
    if keys.include?(key)
      remove(key)
      @set << [key,value]
    else
      @set << [key,value]
    end
  end

  def remove(key)
    @set.reject! {|value| value[0] == key}
  end

  def show
    deep_copy(@set)
  end

  def deep_copy(array)
    result=[]
    array.each do |row|
      row.each {|i| i.class == Array ? result << deep_copy(i) : result << i}
    end
    result
  end

end




  if __FILE__ == $PROGRAM_NAME
    # lifo = Stack.new
    # lifo.add(5)
    # lifo.add(6)
    # lifo.add(7)
    # lifo.add(8)
    # lifo.remove
    # lifo.remove
    # p lifo

    # fifo = Stack.new
    # fifo.add(5)
    # fifo.add(6)
    # fifo.add(7)
    # fifo.add(8)
    # p fifo.show
    # fifo.remove
    # fifo.remove
    # p fifo

     map = Map.new
     map.assign(1,2)
     map.assign(1,4)
     p new=map.show
     p map


  end
