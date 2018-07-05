require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_node!(@map[key])
      @map[key].val
    else
      calc!(key)
      @map[key].val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = @prc.call(key)
    insert_node = @store.append(key,value)
    @map[key] = insert_node
    eject! if count > @max
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    if @store.include?(node.key)
      node.remove
      @map[node.key] = @store.append(node.key, node.val)
    end
  end

  def eject!
    node_removed = @store.first
    key = node_removed.key
    node_removed.remove
    @map.delete(key)
  end
end
