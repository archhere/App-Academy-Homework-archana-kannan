class BSTNode

  attr_reader :value
  attr_accessor :left,:right,:parent

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def value= (value)
    @value = value
  end

  def delete
    self.value = nil
  end

  def leaf_node?
    left.nil? && right.nil?
  end
end
