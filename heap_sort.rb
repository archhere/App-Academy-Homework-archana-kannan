require_relative "heap"

class Array

  def heap_sort!

    # if BinaryMinHeap.heapify_down(self,0) == self
    #   return self
    # end
    parent_idx = 0
    child_idx = self.length-1
    prc = Proc.new do |el1, el2|
      (el2 <=> el1)
    end
    result = self
    # result = BinaryMinHeap.heapify_down(self, parent_idx, len = self.length, &prc)
    (1..self.length).each do |len|
    result = BinaryMinHeap.heapify_up(self, len,&prc)
    end
    last_idx = result.length-1
    pointer = self.length - 1

    until pointer == 0
      result[pointer], result[0] = result[0] , result[pointer]
      result = BinaryMinHeap.heapify_down(result,0,pointer,&prc)
      pointer -= 1

    end

    return result
  end



end



# arr = [5,3,7,1,8]
#
#
# [7,3,5,1,8]
# [7,8,5,1,3]
# [8,7,5,1,3]
#
# [3,7,5,1,   8]
#
#
# [7,3,5,1     8]
#
#
# [1,3,5   7 8]
#
#
# [5,3,1     7,8]
#
# [1,3     5,7,8]
#
#
# [3,1   5,7,8]
#
# [3,5,7,8]
#
# [1,3,5,7,8]





# 500 files
#
#
#
# def five_hundren_files(arr_of_arrs)
#   prc = Proc.new { |el1, el2|  el1[0] <=> el2[0]}
#   heap = BinaryMinHeap.new(&prc)
#   result = []
#
#   arr_of_arrs.length.times do |i|
#     heap.push([arr_of_arrs[i][0], i, 0])
# end
#
# while heap.count > 0
#   min = heap.extract
#   result << min[0]
#   next_arr_i = min[1]
#   next_idx = min[2] + 1
#   next_el = arr_of_arrs[next_arr_i][next_idx]
#   heap.push([next_el,next_arr_i])



def almost_sorted(arr,k)
  heap = BinaryMinHeap.new
  (k+1).times do
    heap.push(Arr.shift)
  end


  while heap.count > 0
    print heap.extract
    heap.push(arr.shift) if arr[0]
  end
end
