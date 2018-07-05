class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num]
      true
    else false
    end
  end

  private

  def is_valid?(num)
    if num <= @max && num > 0
      return true
    else
      return false
    end
  end

  def validate!(num)
    num.is_a? Numeric
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if @store[num]
      @store[num]<< num
    else
      @store[num] = [num]
    end
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
    @store[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num % @num_buckets
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @store[num]
      @store[num] << num
      @count += 1
    else
      @store[num] = [num]
      @count += 1
    end
    resize! if @count == @store.length
  end

  def remove(num)
    if self.include?(num)
      @store[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num % @num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_store = Array.new(@num_buckets * 2) {Array.new}
      @store.flatten.each do |num|
        new_store.insert(num)
      end
      @store = new_store
  end
end
