require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    # return false if include?(key)
    # return false if include?(key)
    self[key.hash] << key
    @count += 1
    resize! if num_buckets < @count

    key

  end

  def include?(key)
    # if @store[key.hash]
    #   @store[key.hash].include?(key)
    # else
    #   return false
    # end
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # num % @num_buckets
    @store[num % num_buckets]
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
