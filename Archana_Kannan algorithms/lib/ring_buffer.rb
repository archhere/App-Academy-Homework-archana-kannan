require_relative "static_array"
require 'byebug'

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    @start_idx = 0

  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + @start_idx) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[index] = val
  end


# pop and push dont change
  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    popped = @store[(@length - 1 +@start_idx) % capacity]
    @store[(@length + start_idx) % @capacity] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == capacity
    @store[(@length + start_idx) % @capacity] = val
    @length += 1
  end

  # O(1)
  def shift
    if @length == 0
      raise "index out of bounds"
    else
      shifted = @store[@start_idx]
      @length -= 1
      @store[@start_idx] = nil

      @start_idx += 1
      return shifted
    end
  end

    # @length -= 1
  # val, @store[0] = @store[0],nil
  # @start_idx = (@start_idx + 1) % capacity
  # val

  # O(1) ammortized
  def unshift(val)
    resize! if @length + 1 > @capacity
    if @start_idx > 0
      @start_idx = @start_idx - 1
      @store[@start_idx] = val
      @length += 1
    else
      @start_idx = @capacity - 1
      @store[@start_idx % @capacity] = val
      @length += 1
    end
  end

  # @length += 1
  # @start_idx = (@start_idx - 1) % capacity

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if (index >= @length || @length == 0)
  end

  def resize!
    new_arr = StaticArray.new(2 * @length)
    idx = @start_idx + @capacity
    count = 0
    until count == @length
      new_arr[idx % (@capacity * 2)] = @store[(idx - @capacity) % @capacity]
      idx += 1
      count += 1
    end

    @store = new_arr
    @start_idx = @start_idx + @capacity
    @capacity = @capacity * 2
  end

end
