require_relative 'heap'
require_relative 'heap_sort'

# def k_largest_elements(array, k)
#     array.heap_sort!.drop(array.length-k)
# end

def k_largest_elements(array, k)
    result = BinaryMinHeap.new
    k.times do
      result.push(array.pop)
    end

    until array.empty?
      result.push(array.pop)
      result.extract
    end
    result.store
end


# def k_largest_elements(array,k)
#   parent_idx = 0
#   child_idx = self.length-1
#   result = array
#
# end
