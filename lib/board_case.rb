class BoardCase
  attr_accessor :used, :who
  def initialize
    @used = false
    @who = ""
  end

  def movement(player)
    #Permet de marquer une case
    if !@used
      #Si la case est libre
      @used = true
      @who = player
      return true
    else
      #Si la case est déjà occupée
      puts "ERREUR : la case est déjà occupée par un joueur. Veuillez spécifier une autre case"
      return false
    end
  end

  def who_marked?
    if @used == true
      return @who.pawn
    end
    return " "
  end
end