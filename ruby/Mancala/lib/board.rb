class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      @cups[i] += [:stone, :stone, :stone, :stone] unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    unless (1..6).include?(start_pos) || (7..12).include?(start_pos)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    i = start_pos + 1
    while @cups[start_pos].length > 0
      i += 1 if i == 6 &&  @name2 == current_player_name
      i = 0 if i == 13 && @name1 == current_player_name
      @cups[i].push(@cups[start_pos].pop)
      i+=1
      i-=14 if i>13
    end
    render
    next_turn(i - 1)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].length > 1
      ending_cup_idx
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? {|cup| cup.length == 0} || @cups[7..12].all?{|c| c.length == 0}
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end

  end
end
