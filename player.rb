require './card'
require './deck'
require './hand'
require './player'
require './dealer'

class Player

	def initialize(int)
		@wallet = int
	end

	def wallet
		@wallet
	end

	def wins(int)
		@wallet += int
	end

	def broke?
		@wallet <= 0
	end


end