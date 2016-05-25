#52 cards
# :H = Hearts
# :S = Spades
# :D = Diamonds
# :C = Clubs

require './card'
require './deck'
require './hand'
require './player'
require './dealer'

require 'pry'

# print "How many players?"
# players = gets.chomp
# print "What is your starting balance Mr. Bond?"
# wallet = gets.chomp

p = Player.new(500)
h = Hand.new
d = Dealer.new
d.deal_hand_to p
puts "Hit or Stay"
# choice = gets.chomp
3.times { d.hit p }
		puts
		print "You won, wow so impressive"
		puts .to_s
		puts .value