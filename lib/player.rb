class Player
  attr_accessor :name, :count_strokes, :pawn
  def initialize(array_name_pawn)
    @name = array_name_pawn[0]
    @pawn = array_name_pawn[1]
    @count_strokes = 0
  end
end