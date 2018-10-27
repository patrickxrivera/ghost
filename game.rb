require 'set'

class Game
    def initialize(players, fragment, dictionary)
        @players = players
        @fragment = fragment
        @dictionary = init_dictionary()        
    end

    private
    def init_dictionary
        set = Set.new
        
        File.open('./words.txt', 'r') do |f|
            f.each_line do |line|
                set.add(line.strip)
            end
        end

        set
    end
end