class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @name_1 = name1
    @name_2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...13).each do |j|
      if j != 7 
        4.times do |i| 
          @cups[j] << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !(0...13).include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos].clear
    idx = start_pos
    while num_stones > 0
      idx = (idx + 1) % 14
      @cups[idx] << :stone if idx == 6 && current_player_name == @name1
      if idx == 13 && current_player_name == @name2
        @cups[idx] << :stone
      else
        @cups[idx] << :stone
      end
      num_stones -= 1
    end
  render
  next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].none? { |cup| !cup.empty? } || @cups[7..12].none? { |cup| !cup.empty? }  
  end

  def winner
    name_1_score = @cups[6].length
    name_2_score = @cups[13].length

    return :draw if name_1_score == name_2_score
    if name_1_score > name_2_score
      return @name_1
    else
      return @name_2
    end
  end
end
