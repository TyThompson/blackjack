

require './card'
require './deck'
require './hand'
require './player'
require './dealer'

class Dealer
	attr_reader(
		:deck
	)

	def initialize
		@deck = Deck.new
	end

	def deal_hand_to(person)
		person.hand = Hand.new
		hit(person)
		hit(person)
	end

	def hit(person)
		person.hand.add(draw)
	end

	def draw
		
		ret = deck.draw
		if ret.nil?
			deck.reshuffle
			ret = deck.draw
		end

		ret
	end






end