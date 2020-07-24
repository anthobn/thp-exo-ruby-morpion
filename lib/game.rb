class Game
  #Cette classe permet de régir l'ensemble du jeu

  attr_accessor :player1, :player2, :board

  def initialize(players = false)
    if players == false
      #Creation des objets players en appelant le menu d'initialisation
      @player1 = Player.new(Show.require_player('1', "X"))
      @player2 = Player.new(Show.require_player('2', "O"))
    else
      #Si les joueurs existent déjà
      @player1 = players[0]
      @player2 = players[1]
    end

    #Initialisation du plateau
    @board = Board.new
  end

  def movement(target, player)

    if @board.board_cases.has_key?(target)
      #Si la case existe, on assigne la case à l'objet player correspondant
      @board.board_cases[target].movement(player)
    else
      #Si la case n'existe pas (mauvais input de l'utilisateur)
        puts "ERREUR : la case demandée n'existe pas. Veuillez spécifier une case présente sur le plateau SVP"
        return false
    end
    
  end

  def win?(player)
    #Test s'il y a un gagnant
    letters = @board.letters
    digits = @board.digits

    #Test de vainqueur par colonne
    letters.each do |letter|
      marked = 0
      digits.each do |digit|
        if @board.board_cases[letter + digit].who == player
          #Test pour chaque colonne si un alignement est constaté
          marked +=1
        end
      end
      return true, player if marked == letters.length
      marked = 0
    end

    #Test de vainqueur par ligne
    digits.each do |digit|
      marked = 0
      letters.each do |letter|
        if @board.board_cases[letter + digit].who == player
          #Test pour chaque colonne si un alignement est constaté
          marked +=1
        end
      end
      return true, player if marked == letters.length
      marked = 0
    end

    #Test de vainqueur par diagonale
    marked1 = 0
    marked2 = 0
    i = 0
    letters.length.times do
      if @board.board_cases[letters[i] + digits[i]].who == player
        #Test pour diagonale 1 si un alignement est constaté
        marked1 +=1
      end
      if @board.board_cases[letters[letters.length - (i + 1)] + digits[i]].who == player
        #Test diagonale 2 si un alignement est constaté
        marked2 +=1
      end
      i += 1
    end
    return true, player if marked1 == letters.length || marked2 == letters.length
    return false
  end
end