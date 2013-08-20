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
    
    self.show_cards

  end

def show_cards
    @player.each{|card| print card, '   '}
    self.turn
end
  

  def turn
    print 'Hit (h) or Stay (s): '
    input = gets.chomp
    if input == 'h'
      self.hit
    elsif input == 's'  
      self.show
    else
      p 'invalid'
      self.turn
    end
  end

  def hit
    @player << @shuffled_deck.pop 
    self.check
   
  end

  def stay
  end

  def check
    sum = 0
    array = []
   
   
    @player.each do |x|
      if x.chr == 'J'
        array << 11
      elsif x.chr == 'Q'
        array << 11
      elsif x.chr == 'K'
        array << 11
      else
        array << x.to_i
      end
    
    end

    array.each{|x| sum += x}
    p sum
    p @player
     p array
  end    

      
  

end


game = Blackjack.new
game.build_deck


#deal two card out to player
#store cards in player 1
#show cards to player

#choose hit or stay
