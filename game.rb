require 'set'

class Game
    def initialize(players)
        @players = players
        @dictionary = init_dictionary()
        @fragment = []
        @winner = nil
    end

    def play_round
        p "#{current_player.name}'s turn!"

         p "Fragment so far: #{fragment}" if @fragment.any?
        
        print 'Pick a character: '
        char = gets.chomp.downcase

        if !letter?(char)
            p 'Please only enter alphabetic characters.'
            return
        end

        add_to_fragment(char)
            
        if @dictionary.include?(fragment)
            swap_players
            @winner = current_player
            return
        end

        swap_players
    end

    def current_player
        @players[0]
    end

    def swap_players
        @players = [@players[1], @players[0]]
    end

    def game_over?
        !@winner.nil?
    end

    def congratulate
        "Congratulations, #{@winner.name}, you are the winner!"
    end

    private
    def init_dictionary
        dictionary = []

        File.open('./words.txt', 'r') do |f|
            f.each_line do |line|
                dictionary << line.strip
            end
        end

        dictionary
    end

    def letter?(val)
        val =~ /[[:alpha:]]/
    end

    def fragment
        @fragment.join
    end

    def add_to_fragment(char)
        @fragment << char
    end
end