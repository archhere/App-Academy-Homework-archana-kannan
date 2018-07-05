require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(store = [],&prc)
    @store = store
  end

  def count
    @store.length
  end

  def extract
    root_node = @store[0]

    if count > 1
      @store[0] = @store.pop
      self.class.heapify_down(@store,0,count,&prc)
    else
      return @store.pop
    end
    root_node
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store,count-1,&prc)
  end

  public
  def self.child_indices(len, parent_index)
    child_1 = (2 * parent_index) + 1
    child_2 = (2 * parent_index) + 2
    ret = []
    ret.push(child_1) if child_1 < len
    ret.push(child_2) if child_2 < len
    ret
  end

  def self.parent_index(child_index)
    if child_index == 0
      raise "root has no parent"
    else
      return (child_index-1)/2
    end
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    # result = self.child_indices(len,parent_idx)
    # return array if result.all? {|child| prc.call(array[parent_idx],child) <= 0}
    #
    #
    # child_1 = result[0]
    # value = nil
    # if result.length == 1
    #   value = child_1
    # else
    #   child_2 = result[1]
    #   if prc.call(array[child_1],array[child_2]) == -1
    #      value = child_1
    #   else
    #     value = child_2
    #   end
    # end
    #
    #     array[parent_idx],array[value] = array[value],array[parent_idx]
    #     self.heapify_down(array,value,len,&prc)
    #
    l_child_idx,r_child_idx = self.child_indices(len,parent_idx)
    parent_val = array[parent_idx]
    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    if children.all? {|child| prc.call(parent_val,child) <= 0}
      return array
    end

    swap_idx = nil
    if children.length == 1
      swap_idx = l_child_idx
    else
      if prc.call(children[0],children[1]) == -1
        swap_idx = l_child_idx
      else
        swap_idx = r_child_idx
      end
    end
    array[parent_idx],array[swap_idx] = array[swap_idx],array[parent_idx]
    self.heapify_down(array,swap_idx,len,&prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    # child_idx = len + child_idx if child_idx < 0
    prc = prc || Proc.new do |el1, el2|
      (el1 <=> el2)
    end
    return array if child_idx == 0
    # debugger
    parent_index = self.parent_index(child_idx)
    # p array
    # p array[child_idx]
    # p array[parent_index]
      # p prc.call(array[parent_index],array[child_idx])
      if prc.call(array[parent_index],array[child_idx]) == 1
        array[parent_index],array[child_idx] = array[child_idx],array[parent_index]
        child_idx = parent_index

        # p array
        # p child_idx
        self.heapify_up(array,child_idx,&prc)
      else
        return array
      end
  end
end
