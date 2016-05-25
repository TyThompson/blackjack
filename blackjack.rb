#52 cards
#4 of each card
# :H = Hearts
# :S = Spades
# :D = Diamonds
# :C = Clubs

require 'pry'
class Card
	attr_reader :value, :suit
	 def initialize(value, suit=:S)
		case value
			when :K
				@value = 10
			when :Q 
				@value = 10
			when :J
				@value = 10
			when :A
				@value = 11
			else
				@value = value
			end
		@suit = suit
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

	attr_reader :cards, :drawn_card, :count, :draw, :value,:drawn_card, :draw,
	def initialize
		@value = 0
		@drawn_card.each do |v|
			@value += card.value
		end
		if busted? == false
			return @value
		else
			drawn_card.each do |v|
				if drawn_card.include?(:A)
					@value -= 10
				else
					return @value
				end
			end
		end
	end
		
	def add
		cards.to_i
		cards.inject(&:+)
	end

	def busted?
		@value > 21
	end

	def acelogic
		if busted? == true
			@value - 10
		end
	end

	def blackjack?
		@drawn_card == 21
	end

def to_s
    string = []
    master = @ranks.zip @suits
    master.each do |e|
      string.push(e.join)
    end
    return string.join(", ")
  end
end
binding.pry