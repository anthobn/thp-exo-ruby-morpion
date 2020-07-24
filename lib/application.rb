class Application
  def self.game
    quit = false
    game = Game.new()
    players = [game.player1, game.player2]
    max_possibilities = (game.board.letters.length * game.board.letters.length) - 1

    while quit == false
      victory = false
      game = Game.new(players)
      count = 0

      #Puts le board
      puts Show.board(game.board.board_cases, game.board.letters, game.board.digits)

      #Tant qu'il reste encore des coups possibles dans le jeu et qu'il n'y a pas de victoire
      while count < max_possibilities && victory == false
        #Pour chacun des deux joueurs
        players.each do |player|
          while true
            #Afficher menu pour le mouvement puis faire le mouvement
            if game.movement(Show.movement(player), player)
              #Si la case existe et que le mouvement a été correctement exécuté
              count += 1
              if count == max_possibilities
                puts "Aucune fin possible !"
              end
              break
            end
            #Si erreur car case inexistante ou déjà occupée, reafficher la grille
            puts Show.board(game.board.board_cases, game.board.letters, game.board.digits)
          end

          #Test de gain
          if game.win?(player)
            #Si le joueur a gagné, on affiche la victoire et on sors de la boucle
            Show.victory(player)
            puts Show.board(game.board.board_cases, game.board.letters, game.board.digits)
            victory = true
            break
          end

          #Puts le board
          puts Show.board(game.board.board_cases, game.board.letters, game.board.digits)

        end
      end
      quit = Show.continue?
    end
  end
end