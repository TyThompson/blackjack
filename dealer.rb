

require './card'
require './deck'
require './hand'
require './player'
require './dealer'

class Dealer

	def initialize
		if @cards = []
			reshuffle_when_out_of_cards
		end
	end

	def deal_hand_to(person)
		draw
		person = Hand.add(drawn)
		draw
		person = Hand.add(drawn)
	end

	def hit(person)
		# person gains 1 card
		draw
		person = Hand.add(drawn)
	end

	def reshuffle_when_out_of_cards
		@reshuffle
	end

end