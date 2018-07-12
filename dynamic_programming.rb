require 'byebug'

class DynamicProgramming

  def initialize
    @cache = {1 => 1 , 2 => 2}
    @frog_cache = {1 => [[1]],
                  2 => [[1,1], [2]],
                  3 => [[1,1,1], [1,2], [2,1], [3]]
                  }
                  # @frog_cache = { 1 => [[1]],
                  #   2 => [[1, 1], [2]],
                  #   3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
                  # }


    @super_cache = {1 => [[1]],
                    2 => [[1,1],[2]],
                    3 => [[1,1,1],[1,2],[2,1],[3]]
                    }

    @maze_cache = []

  end

  def blair_nums(n)
    return @cache[n] if @cache[n]
    prev_num = blair_nums(n-1)
    last = blair_nums(n-2)
    odd = (2 * (n-1))-1
    result =  prev_num + last + odd
    @cache[n] = result
  end

  def frog_hops_bottom_up(n)
    result = frog_cache_builder(n)
    return result[n]
  end

  def frog_cache_builder(n)
    frog_builder = {1 => [[1]],
                    2 => [[1,1],[2]],
                    3 => [[1,1,1],[1,2],[2,1],[3]]
                    }

    (4..n).each do |current|
      current_case =
      frog_builder[current - 1].map {|el| el += [1]} +
      frog_builder[current - 2].map {|el| el += [2]} +
      frog_builder[current - 3].map {|el| el += [3]}
      frog_builder[current] = current_case
    end
    frog_builder
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    # return @frog_cache[n] unless @frog_cache[n].nil?
    # cur_cache =
    # (frog_hops_top_down_helper(n - 1).map{ |el| el + [1] }) +
    # (frog_hops_top_down_helper(n - 2).map{ |el| el + [2]  }) +
    # (frog_hops_top_down_helper(n - 3).map{ |el| (el + [3]) })
    # @frog_cache[n] = cur_cache unless cur_cache.nil?
    # @frog_cache
    return @frog_cache[n] if @frog_cache[n]

    @frog_cache[n] = []

    (1..3).each do |diff|
      @frog_cache[n].concat(frog_hops_top_down_helper(n - diff).map {|arr| arr + [diff]})
    end

    @frog_cache[n]
  end

  def super_frog_hops(n, k)
    if k == 1
      return [[1 ] * n]
    end

    return @super_cache[n] if @super_cache[n]
    result = []
    n.downto(1) do |idx|
      if k >= (n - idx + 1)
        result += super_frog_hops(idx-1,k).map{|el| [n-idx+1] + el}

      end

    end

    @super_cache[n] = result
    @super_cache[n]
  end


  # def at_max(n)
  #   prev = 1
  #   (n-1).times do
  #     prev = prev * 2
  #   end
  #   prev
  # end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
    @maze_cache << start_pos unless @maze_cache.last == start_pos
    return end_pos if start_pos == end_pos
    row = start_pos[0]
    col = start_pos[1]
    if [" ","F"].include?(maze[row][col+1])
      maze[row][col+1] = "V"
      maze_solver(maze,[row,col+1],end_pos)

    elsif [" ","F"].include?(maze[row+1][col])
      maze[row+1][col] = "V"
      maze_solver(maze, [row+1,col],end_pos)

    elsif [" ","F"].include?(maze[row][col-1])
      maze[row][col-1] = "V"
      maze_solver(maze, [row,col-1],end_pos)

    elsif [" ","F"].include?(maze[row-1][col])
      maze[row-1][col] = "V"
      maze_solver(maze, [row-1,col],end_pos)
    else
      @maze_cache.pop
      maze_solver(maze,@maze_cache.last,end_pos)
    end
    @maze_cache
  end
end
