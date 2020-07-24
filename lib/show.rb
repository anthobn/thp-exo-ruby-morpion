class Show
  def self.require_player(player_number, pawn)
    puts "*" * 70
    puts "*" + "MENU INITIALISATION PISTE".center(68) + "*"
    puts "*" * 70
    puts "*" + " " * 68 + "*"
    puts "*" + "Définition des attributs pour le JOUEUR #{player_number}".center(68) + "*"
    puts "*" + "--------------------".center(68) + "*"
    puts "*" + "Le jeton utilisé sera : #{pawn}".center(68) + "*"
    puts "*" + " " * 68 + "*"
    puts "*" * 70
    puts ""
    puts "Veuillez spécifier votre nom pour JOUEUR #{player_number} :"
    print "> "
    return gets.chomp, pawn
  end

  def self.movement(player)
    puts "*" * 70
    puts "*" + "MENU GESTION DES MOUVEMENTS".center(68) + "*"
    puts "*" * 70
    puts "*" + " " * 68 + "*"
    puts "*" + "Joueur actuellement en jeu : JOUEUR #{player.name}".center(68) + "*"
    puts "*" + "--------------------".center(68) + "*"
    puts "*" + "Veuillez spécifier la case sur laquelle vous souhaitez marquer".center(68) + "*"
    puts "*" + " " * 68 + "*"
    puts "*" * 70
    puts ""
    puts "Entrez l'adresse d'une case (ex : a1) :"
    print "> "
    return (gets.chomp).downcase
  end

  def self.victory(player)
    puts "*" * 70
    puts "*" + "VICTOIRE !".center(68) + "*"
    puts "*" * 70
    puts "*" + " " * 68 + "*"
    puts "*" + "Joueur actuellement en jeu : JOUEUR #{player.name}".center(68) + "*"
    puts "*" + "--------------------".center(68) + "*"
    puts "*" + "BRAVO #{player.name}, vous venez de remporter cette manche !".center(68) + "*"
    puts "*" + " " * 68 + "*"
    puts "*" * 70
  end

  def self.board(board_cases, letters, digits)
    puts "-------" + "-" * 21
    puts "  0   " + "-  A  -   B  -   C  -"
    digits.each do |digit|
      hight = "-------"
      middle = "  #{digit}   "

      letters.each do |letter|
        pawn = board_cases[letter + digit].who_marked?
        hight += "-------"
        middle += "-  #{pawn}  -"
      end
      puts hight
      puts middle
    end
    puts "-------" + "-" * 21
    
  end

  def self.continue?
    puts "*" * 70
    puts "*" + "MENU ABANDON".center(68) + "*"
    puts "*" * 70
    puts "*" + " " * 68 + "*"
    puts "*" + "Souhaitez-vous quitter le jeu ?".center(68) + "*"
    puts "*" + "--------------------".center(68) + "*"
    puts "*" + "Les joueurs resteront les mêmes que ceux actuellement définis".center(68) + "*"
    puts "*" + " " * 68 + "*"
    puts "*" * 70
    puts ""
    puts "Souhaitez-vous quitter le jeu ? (o pour OUI, n pour NON)"
    print "> "
    input = gets.chomp
    (input.downcase == "o") ? (return true) : (return false)
  end
end