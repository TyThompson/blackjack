require './card'
require './deck'
require './hand'
require './player'
require './dealer'
require 'pry'

class Deck
	attr_reader :suits, :cards, :drawn_card
	def initialize
   		@ranks = %w(2 3 4 5 6 7 8 9 10 :J :Q :K :A)
    	@suits = %i(C D H S)
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
		@cards = @cards.delete(drawn)
	end

	def drawn
		@drawn_card
	end

	def reshuffle
   		@ranks = %w(2 3 4 5 6 7 8 9 10 :J :Q :K :A)
    	@suits = %i(C D H S)
    	cards = []
    	@drawn_card = []
    	@ranks.each do |rank|
    		@suits.each do |suit|
        		cards << Card.new(rank, suit)
        		@cards = cards
			end
		end
	end



end