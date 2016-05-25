require './card'
require './deck'
require './hand'
require './player'
require './dealer'
require 'pry'

class Deck

	RANKS = (%w(2 3 4 5 6 7 8 9 10) + %i(J Q K A)).freeze
	SUITS = %i(C D H S).freeze
 #freeze prevents future changes
	attr_reader(
		:drawn,
		:cards
	)

	def initialize
		reshuffle
	end


	def count
		cards.length - drawn.length
	end

	def draw
		drawn_card = @cards.sample
		@drawn << drawn_card
		@cards.delete(drawn_card) if drawn_card
	end

	def reshuffle
    	
    	@cards = []
    	@drawn = []

    	@cards = RANKS.product(SUITS).map do |rank, suit|
    		Card.new(rank, suit)
    	end
#is the same as
    	#RANKS.each do |rank|
    	#	SUITS.each do |suit|
        #		@cards << Card.new(rank, suit)
     	#	 end
		#end
	end
end