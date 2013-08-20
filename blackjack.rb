#!/usr/bin/env ruby
# encoding: UTF-8
class Blackjack
  
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


  def build_deck
      @deck = []
      @player=[]
      @dealer=[]
      SUITS.each do |suit|
        VALUES.each do |value|
        @deck.push(value + suit)
        end
      end
      @shuffled_deck = @deck.shuffle
    self.init
  end

  def init
    2.times{@player << @shuffled_deck.pop }
    2.times{@dealer << @shuffled_deck.pop }
   print @player
  end

end


game = Blackjack.new
game.build_deck


#deal two card out to player
#store cards in player 1
#show cards to player

#choose hit or stay
