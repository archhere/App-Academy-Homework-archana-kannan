class Board
  attr_accessor :cups ,:name1 , :name2

  def initialize(name1, name2)
    @cups = Array.new(14)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = @cups.map.with_index do |cup,idx|
      if idx == 6 || idx == 13
        []
      else
        [:stone,:stone,:stone,:stone]
      end
    end

  end

  def valid_move?(start_pos)
    if start_pos.between?(1,12)
      return true
    else
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    if current_player_name == @name1
      opp_place = 7
    else opp_place = 13
    end
    ending = nil
    length = @cups[start_pos].length
    length.times do |time|
      @cups[start_pos+time+1] << :stone unless start_pos+time+1 >7
    ending = start_pos+time+1
    end
    @cups[start_pos] = []
    render
    next_turn(ending)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns

    if @cups[ending_cup_idx] == nil
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      p @name1
    else p @name2
    end
  end
end
