require './card'
require './deck'
require './hand'
require './player'
require './dealer'

class Player
#read
	attr_reader(
		:wallet
	)

#read and write
	attr_accessor(
		:hand
	)
	def initialize(int = 0)
		@wallet = int
		@hand = Hand.new
	end

	def wins(int)
		@wallet += int
	end

	def broke?
		@wallet <= 0
	end











end