require './card'
require './deck'
require './hand'
require './player'
require './dealer'

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