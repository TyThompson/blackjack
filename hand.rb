require './card'
require './deck'
require './hand'
require './player'
require './dealer'
require 'pry'

class Hand
	attr_reader(
		:cards
	)
	def initialize
		@cards = []
	end
		
	def add(*cards)
		@cards.concat(cards)
    end

    def aces
    	cards.select { |card| card.card == :A }
    end

    def to_i
    	ret = cards.map(&:to_i).inject(:+)

    	if ret > 21
    		aces.each do
    			ret -= 10
    			break if ret <= 21
    		end
    	end

    	ret
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

	def showing
		cards.first.to_s
	end
	
	def beats?(p)
		(self.to_i > p.to_i && self.to_i <= 21) || p.to_i > 21
	end










end