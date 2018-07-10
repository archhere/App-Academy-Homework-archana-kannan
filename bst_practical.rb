
require_relative 'bst_node'
require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  result = in_order_traversal(tree_node)
  result[result.length-k]
end


def in_order_traversal(tree_node = @root, arr = [])
  in_order_traversal(tree_node.left,arr) unless tree_node.left.nil?
  arr.push(tree_node)
  in_order_traversal(tree_node.right,arr) unless tree_node.right.nil?
  arr
end
