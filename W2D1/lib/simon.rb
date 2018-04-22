require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over!=true
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.8
      system("clear")
      sleep 0.3
    end
  end

  def to_s
    value.to_s.colorize(color)
  end

  def require_sequence
    puts "Select the sequence that you just saw"
    puts "Enter the first letter of each color and enter"
    @seq.each do |system_color|
      user_color = gets.chomp
      if system_color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.3
  end

  def add_random_color
    seq << COLORS.sample

  end

  def round_success_message
    puts "Awesome! You cleared this round.Enter #{sequence_length}th round"
  end

  def game_over_message
    puts "Game over! You made it to  #{sequence_length-1} rounds "
    sleep 1.0
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play
