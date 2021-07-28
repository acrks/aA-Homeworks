class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !game_over
      round_success_message
      @sequence_length += 1
    end
      
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      system("clear")
      puts color
      sleep 0.6
      system("clear")
      puts "."
      sleep 0.2
      system("clear")
    end
  end

  def require_sequence
    puts "Enter the first letter of the color on a new line in the order they appeared, ie: \nb\nr\ng'"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.shuffle.last
  end

  def round_success_message
    puts "Great round!"
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    initialize
  end
end

s = Simon.new
s.play
