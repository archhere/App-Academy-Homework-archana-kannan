# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'
class BinarySearchTree

  attr_reader :root

  def initialize(root = nil)
    @root = root
    @left = nil
    @right = nil
  end

  def insert(value)
    current_node = @root
    return @root = BSTNode.new(value) if !@root
    new_node = BSTNode.new(value)
    while current_node
      if value <= current_node.value
        if !current_node.left
          current_node.left = new_node
          current_node.left.parent = current_node
          return
        else
          current_node = current_node.left
        end
      else
        if !current_node.right
          current_node.right = new_node
          current_node.right.parent = current_node
          return
        else
          current_node = current_node.right
        end
      end
    end
  end

  def find(value, tree_node = @root)
    return tree_node if value == tree_node.value
    current_node = tree_node
    while current_node
      if value == current_node.value
        return current_node
      elsif value <= current_node.value
        if !current_node.left
          return nil
        else
          current_node = current_node.left
        end
      else
        if !current_node.right
          return nil
        else
          current_node = current_node.right
        end
      end
    end
  end

  def delete(value)
    result = find(value)
    parent = result.parent
    return nil if result == nil
    return @root = nil if result == @root

    left_child = result.left
    right_child = result.right
    if !left_child && !right_child
      if parent.left == result
        parent.left = nil
      elsif parent.right == result
        parent.right = nil
      end
    elsif !left_child || !right_child
      if !left_child
        found_child = right_child
      else
        found_child = left_child
      end
      result.value = found_child.value
      found_child.value = nil
    elsif (left_child && right_child)
      max = maximum(left_child)
      if parent.left == result
        parent.left.value = max.value
      elsif parent.right == result
        parent.right.value = max.value
      end
      if max.left
        max.value = max.left.value
        max.left = max.left.left
      end
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return 0 if !tree_node
    return maximum(tree_node.right) if tree_node.right
    tree_node
  end

  def depth(tree_node = @root)
    return 0 if !tree_node || tree_node.leaf_node?
    left_depth = depth(tree_node.left) + 1
    right_depth = depth(tree_node.right) + 1
    max_depth = [left_depth,right_depth].max
    return max_depth
  end

  def is_balanced?(tree_node = @root)
    return true if !tree_node || tree_node.leaf_node?
    left_child = tree_node.left
    right_child = tree_node.right
    difference = depth(left_child) - depth(right_child)
    return true if (difference == 0 || difference == 1) && (is_balanced?(left_child) && is_balanced?(right_child))
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    in_order_traversal(tree_node.left,arr) unless tree_node.left.nil?
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right,arr) unless tree_node.right.nil?
    arr
  end



  private
  # optional helper methods go here:

end
