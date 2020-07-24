class Board
  attr_accessor :board_cases, :letters, :digits
  def initialize
    @board_cases = {}
    @letters = ['a', 'b', 'c']
    @digits = ['1', '2', '3']

    @letters.each do |letter|
      @digits.each do |digit|
        @board_cases[letter + digit] = BoardCase.new
      end
    end
  end
end