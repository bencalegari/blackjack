#!/usr/bin/env ruby
# encoding: UTF-8
class Blackjack

  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


  def build_deck
    @player_score = 0
    @dealer_score = 0
    @deck = []
    @player=[]
    @dealer=[]
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck.push(value + suit)
      end
    end
    @shuffled_deck = @deck.shuffle
    init
  end


  def init
    2.times{@player << @shuffled_deck.pop }
    2.times{@dealer << @shuffled_deck.pop }
    
    show_cards(@player)
  

  end

  def show_cards(who)
   if who == @player
    @player.each do |card| 
      puts 'Player was dealt:  ' + card
    end
    turn
    else
      @dealer.each do |card| 
      puts 'Dealer was dealt:  ' + card
  end
  end

    # Can we use an optional argument to print Dealer/Player Score?
    # We also need to change it so that after the first turn 
    # it only shows the card that was dealt.
   
  end

  

  def turn
    puts ''
    puts 'Hit (h) or Stay (s): '
    input = gets.chomp
    if input == 'h'
      hit
    elsif input == 's'  
      show_cards(@dealer)
      dealer_plays
    else
      p 'invalid'
      turn
    end
  end

  def hit
    @player << @shuffled_deck.pop 
    check(@player)
  end

  def dealer_plays

    check(@dealer)
    if @dealer_score < 17
      @dealer << @shuffled_deck.pop 
      dealer_plays

    elsif @dealer_score >= 17 && @dealer_score <= 21

    end     

  end

  def check(who)

    array = []
    who.each do |x|
      if x.chr == 'J' || x.chr == 'K' || x.chr == 'Q'
        array << 11
      else
        array << x.to_i
      end
    end

    array.each do |x| 
      if who == @player
        @player_score += x
      elsif who == @dealer
        @dealer_score += x
      end  
    end  

      show_cards(who)

  end    
end


game = Blackjack.new
game.build_deck


#deal two card out to player
#store cards in player 1
#show cards to player

#choose hit or stay
