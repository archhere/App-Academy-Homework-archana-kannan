require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require "byebug"
class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key,val)
    else
      bucket(key).append(key,val)
      @count += 1
    end
    resize! if @count == @store.length
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    # @store.each do |list|
    #   list.each {|node| yield[node.key,node.val]}
    # end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) {LinkedList.new}
    old_store = @store
    @store = new_store
    @count = 0
    old_store.each do |bucket|
      bucket.each {|link| set(link.key,link.val)}
    end

  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % @store.length]
  end
end
