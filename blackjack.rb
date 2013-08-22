#!/usr/bin/env ruby
# encoding: UTF-8
class Blackjack

  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
    # @player_score = 0
    # @dealer_score = 0
    @deck = []
    @player=[]
    @dealer=[]

    build_deck
    deal_cards
    show_cards(@player)
    turn
  end

  def build_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck.push(value + suit)
      end
    end
    @deck.shuffle!    
  end

  def deal_cards
    2.times{@player << @deck.pop }
    2.times{@dealer << @deck.pop }
    
    score(@player)
  end

  def show_cards(who)
    if who == @player 
      puts "Player's hand:  "
      puts @player 
      puts "Player's score is #{score(@player)}"
      turn
    else
      score(@dealer)
      puts "Dealer's hand:  "
      puts @dealer 
    end
  end

  

  def turn

    if score(@player) > 21
      puts 'You busted!'
      return nil
    end

    puts ''
    puts 'Hit (h) or Stay (s): '

    input = gets.chomp
    if input == 'h'
      hit(@player)
    elsif input == 's'  
      dealer_plays
    else
      p 'invalid'
      turn
    end
  end

  def hit(user)
    user << @deck.pop
    # p @player 
    # p score(@player)
    score(user)
    show_cards(user)
  end

  def dealer_plays

    score(@dealer)
    if score(@dealer) < 17
      hit(@dealer)
      dealer_plays

    elsif score(@dealer) >= 17 && score(@dealer) <= 21
      winning
    end     

  end

  def score(who)

    # @player_score = 0
    # @dealer_score = 0

    who.sort_by!{ |card| VALUES.index(card.chop) }
    
    hand_total = 0
    who.each do |card|
      case card.chop
      when ('2'..'10')
        hand_total += card.chop.to_i
      when 'J','Q','K'
        hand_total += 10
      when 'A'
        if hand_total + 11 > 21
          hand_total += 1
        else
          hand_total += 11
        end
      end    
    end

    return hand_total
    show_cards
  end

  def winner
      if score(@player) == score(@dealer)
        puts 'Tie game!'
      elsif score(@player) < score(@dealer)
        puts 'Dealer wins!'
      elsif score(@player) < score(@dealer)
        puts 'Player wins!'      
      end
  end


  # hand_total.each do |x| 
  #     if who == @player
  #       @player_score += x
  #     elsif who == @dealer
  #       @dealer_score += x
  #     end  
  #   end
  #   show_cards(who)


end


game = Blackjack.new
game.build_deck


