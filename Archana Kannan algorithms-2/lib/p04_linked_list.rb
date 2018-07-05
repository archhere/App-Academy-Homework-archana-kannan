class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next =  self.next if self.prev
    self.next.prev = self.prev if self.prev
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    if empty?
      nil
    else
      @head.next
    end
  end

  def last
    if empty?
      nil
    else
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each {|node| return node.val if node.key == key}
  end

  def include?(key)
    self.each do |node|
      if node.key == key
        return true
      end
    end
    false
  end

  def append(key, val)
    node = Node.new(key,val)
    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
    node
  end

  def update(key, val)
    self.each {|node| node.val = val if node.key == key}

  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end
  end

  def each(&proc)
    return nil if empty?
    current = @head.next
    while current != @tail
      proc.call(current)
      current = current.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
