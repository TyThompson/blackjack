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
	# binding.pry


  # def test_number_card_value
  #   2.upto(10) do |x|
  #     card = Card.new(x, :S)
  #     assert_equal card.value, x
  #   end

  # def test_face_card_value
  #   [:K, :Q, :J].each do |rank|
  #     card = Card.new(rank, :H)
  #     assert_equal card.value, 10
  #   end
  # end


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

	# deck = Deck.new
 	#    assert_equal deck.cards.count, 52

 	# deck.draw
    # assert_equal deck.cards.count, 51

    # drawn_card = deck.draw
    # assert_equal deck.cards.count, 51
    # refute_includes deck.cards, drawn_card
    # assert_includes deck.drawn, drawn_card
    # binding.pry
end

class Hand
	# hand.add(Card.new(9, :H), and
	attr_reader :cards, :drawn_card, :count, :draw, :value, :drawn_card, :acelogic, :to_s, :drawn_card, :draw, :count
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
		
	def add(a, b)
		@value = a + b
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

	# def to_s
	# 	@hand.to_s
	# end
	binding.pry
end
 #Card.new(7, :S)) regular cards
	# hand.add(Card.new(9, :H), Card.new(:K, :S)) face cards
	# hand.add(Card.new(:A, :H), Card.new(:K, :S)) Aces

	#busting # hand.add(Card.new(6, :H), Card.new(:K, :S), Card.new(9, :H))
    # assert hand.busted?
    # testing blackjack assert hand.blackjack?
    # hand to string
    # hand.add(Card.new(:A, :H), Card.new(:K, :S))
    # hand.add(Card.new(5, :S))
    # assert_equal hand.to_s, 'AH, KS, 5S'