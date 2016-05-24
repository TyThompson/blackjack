#52 cards
#4 of each card
# :H = Hearts
# :S = Spades
# :D = Diamonds
# :C = Clubs

class Card
	attr_reader :value, :suit
	def initialize(value, suit=:S)
			case value
				when :K || :Q || :J
					return @value = 10
				when :A
					return @value = 11
				end
			@suit = suit
	end


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
	attr_reader :drawn, :cards, :count, :deck, :drawn_card
	def initialize
   		@ranks = %w(2 3 4 5 6 7 8 9 10 :J :Q :K :A)
    	@suits = %w(:C :D :H :S)
    	@cards = []
    	@drawn_card = []
    	@ranks.each do |rank|
    		@suits.each do |suit|
        		@cards << Card.new(rank, suit)
     		 end
		end
	end

	def count(cards_drawn)
		52 - cards_drawn
	end

	def draw
		drawn_card << @cards.sample
		@cards.delete(drawn_card)
		return drawn_card
	end

	# deck = Deck.new
 	#    assert_equal deck.cards.count, 52

 	# deck.draw
    # assert_equal deck.cards.count, 51

    # drawn_card = deck.draw
    # assert_equal deck.cards.count, 51
    # refute_includes deck.cards, drawn_card
    # assert_includes deck.drawn, drawn_card
end

class Hand
	attr_reader :drawn, :cards, :count, :deck, :drawn_card, :hand
	def initialize
		@hand << Deck.draw
		@hand << Deck.draw
		@hand = drawn_card
	end

	def busted?
		@hand > 21
	end

	def blackjack?
		@hand == 21
	end

	def to_s
		@hand.to_s
	end
end

	# hand.add(Card.new(9, :H), Card.new(7, :S)) regular cards
	# hand.add(Card.new(9, :H), Card.new(:K, :S)) face cards
	# hand.add(Card.new(:A, :H), Card.new(:K, :S)) Aces

	#busting # hand.add(Card.new(6, :H), Card.new(:K, :S), Card.new(9, :H))
    # assert hand.busted?
    # testing blackjack assert hand.blackjack?
    # hand to string
    # hand.add(Card.new(:A, :H), Card.new(:K, :S))
    # hand.add(Card.new(5, :S))
    # assert_equal hand.to_s, 'AH, KS, 5S'