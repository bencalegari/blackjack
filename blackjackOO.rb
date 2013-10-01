

class Deck
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  def initialize
    @deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck.push(value + suit)
      end
    end
    @deck.shuffle!     
  end

  def deal
    @deck.pop  
  end
end


class Game
  attr_reader :player
  def initialize
    @deck = Deck.new
    @player = Hand.new
    @dealer = Hand.new
    puts "Welcome to Blackjack!"
  end

  def deal_cards
    2.times do
      @player.hit(@deck.deal)
    end
  end 
  
  def player_turn
    @player.show_hand
    puts "Hit or Stay? (H/S)"
    input = gets.chomp
    if input == "H"
      @player.hit(@deck.deal)
      
      if @player.busted?
        puts "Your score: #{player.score}"
        puts "You busted!"
      else  
        player_turn
      end
    elsif input == "S"
      dealer_turn
    else
      puts "Incorrect Response. Try again."
      player_turn
    end
  end

  def dealer_turn
    2.times do
      @dealer.dealer_hit(@deck.deal)
    end
    @dealer.show_hand
    while @dealer.score < 17 
      @dealer.dealer_hit(@deck.deal)
      @dealer.show_hand
    end

    if @dealer.busted?
     puts "Player wins!"
    else
     output_winner     
    end
  end

  def output_winner
    puts "Player Score: #{@player.score}"
    puts "Dealer Score: #{@dealer.score}"
    
    if @player.score > @dealer.score
      puts "Player wins!"
    elsif @player.score < @dealer.score
      puts "Dealer wins!"
    else
      puts "Tie!"
    end
  end
end


class Hand
  attr_reader :hand, :player_score
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  
  def initialize
    @hand = []
    @player_score = []
    @done_turn = false
  end

  def hit(card)
    @hand << card
    puts "You drew a #{card}"
  end

  def dealer_hit(card)
    @hand << card
    puts "Dealer drew a #{card}"
  end

  def stay
    @done_turn = true
  end

  def done_turn?
    @done_turn
  end

  def score

    hand.sort_by!{ |card| VALUES.index(card.chop) }
    hand_total = 0
    hand.each do |card|
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
  end

  def show_hand
    puts "Hand: #{@hand.join(', ')}"
    puts "Score: #{score}"
  end

  def busted?
    score > 21  
  end
end


current_game = Game.new
current_game.deal_cards
current_game.player_turn


