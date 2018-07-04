# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store,:max

  def initialize
    @store = RingBuffer.new
    @max = nil
    # @store,@max = [],[]
  end

  def enqueue(val)
    # @store.push(val)
    # enqueue_max(val)
    @max = val if @max == nil || val > @max
    @store.push(val)
  end

  # def enqueue_max(val)
  #   # while @max[0] && @max[@max.length - 1] < val
  #   #   @max.pop
  #   # end
  #   #
  #   # @max.push(val)
  # end

  def dequeue
    # val = @store.shift
    # @max.shift if @max[0] == val
    value_taken_out = @store.shift
    if @max == value_taken_out
      @max = max
    end
    value_taken_out
  end

  def max
    # @max[0]
    return nil if @store.length == 0
    val = @store[0]
    i = 0
    while i < @store.length
      val = @store[i] if val == nil || @store[i] > val
      i += 1
    end
    val
    @max = val
  end

  def length
    @store.length
  end

end
