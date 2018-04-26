#sluggish octopus
#Find the longest fish in O(n^2) time

def sluggish_octopus(arr)
  arr.each_with_index do |i, idx|
    switch = true
    arr[i+1..-1].each_with_index do |j, idx|
      switch = false if j.length > i.length
    end
    return i if switch
  end
end



#Dominant Octopus
#O(n log n) time

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end
end

def dominant_octopus(arr)
  prc = Proc.new { |fish_1,fish_2| fish_2.length <=> fish_1.length }
  arr.merge_sort(&prc).first
end


#Clever Octopus
#O(n) time

def clever_octopus(arr)
  biggest_fish = arr[0]
  arr[1..-1].each do |i|
    if i.length > biggest_fish.length
      biggest_fish = i
    end
  end
  biggest_fish
end

#Slow Dance

def slow_dance(tile_dir, arr)
  arr.each_with_index do |dir, idx|
    return idx if dir == tile_dir
  end
end

#Constant Dance!

def constant_dance((tile_dir, arr)
  tile_hash = Hash.new
  arr.each_with_index {|el,idx| tile_hash[el] = idx }
  tile_hash[tile_dir]
end
