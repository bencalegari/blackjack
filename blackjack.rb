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
    
    check(@player)
  end

  def show_cards(who)
    if who == @player 
      puts "Player's hand:  "
      puts @player 
      puts "Player's score is #{@player_score}"
      turn
    else
      check(@dealer)
      puts "Dealer's hand:  "
      puts @dealer 
    end
  end

  

  def turn

    puts ''
    puts 'Hit (h) or Stay (s): '
    input = gets.chomp
    if input == 'h'
      hit
    elsif input == 's'  
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

    @player_score = 0
    @dealer_score = 0

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
