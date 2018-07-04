require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length === 0
    @store[@length-1] = nil
    @length -= 1

  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length + 1 > @capacity
    @length += 1
    @store[@length-1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    if @length == 0
      raise "index out of bounds"
    else
      shifted = @store[0]
      @length -= 1
      new_arr = StaticArray.new(@capacity)
      @length.times do |idx|
        new_arr[idx] = @store[idx+1]
      end
      @store = new_arr
      return shifted
    end
  end

  # (1...length).each {|i| @store[i-1] = @store[i]}
  # @length -= 1

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length + 1 > @capacity
    unshifted_arr = StaticArray.new(@capacity)
    unshifted_arr[0] = val
    @length.times do |idx|
      unshifted_arr[idx+1] = @store[idx]
    end
    @length += 1
    @store = unshifted_arr
  end

  # @length += 1
  # (@length - 2).downto(0).each {|i| @store[i+1] = @store[i]}
  # @store[0] = val

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length || @length == 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
     new_arr = StaticArray.new(2 * @length)

     @capacity = 2 * @length
     @length.times do |idx|
       new_arr[idx] = @store[idx]
     end
     @store = new_arr
   end

end
