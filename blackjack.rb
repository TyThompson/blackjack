#52 cards
#4 of each card
# :H = Hearts
# :S = Spades
# :D = Diamonds
# :C = Clubs

require 'pry'
class Card
	attr_reader :card, :suit

	def initialize(card, suit=:S)
	 	@card = card
		@suit = suit
	end

	def to_i
		case card
			when :K, :Q, :J
				10
			when :A
				11
			else
				card.to_i
			end
	end
	alias_method :value, :to_i

	def to_s
		"#{card}#{suit}"
	end
end


class Deck
	attr_reader :suits, :cards, :drawn_card
	def initialize
   		@ranks = %w(2 3 4 5 6 7 8 9 10 :J :Q :K :A)
    	@suits = %w(:C :D :H :S)
    	cards = []
    	@drawn_card = []
    	@ranks.each do |rank|
    		@suits.each do |suit|
        		cards << Card.new(rank, suit)
        		@cards = cards
     		 end
		end
	end

	def count
		@cards.length - @drawn_card.length
	end

	def draw
		drawn = @cards.sample
		drawn_card << drawn
		@cards.delete(drawn)
	end

	def drawn
		@drawn_card
	end
end

class Hand
	attr_reader :cards
	def initialize
		@cards = []
	end
		
	def add(*cards)
		@cards.concat(cards)
    end

    def to_i
    	cards.map(&:to_i).inject(:+)
    end

    alias_method :value, :to_i

	def busted?
		to_i > 21
	end

	def blackjack?
		to_i == 21
	end

	def to_s
		cards.join(', ')
	end
end