require './card'
require './deck'
require './hand'
require './player'
require './dealer'


class Hand
	attr_reader :cards, :aces
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

	def beats?(p)
		(self.to_i > p.to_i && self.to_i <= 21) || p.to_i > 21
	end

end