class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 2
  end
end

## TODO add your own Player subclasses here


class bravePlayer < Player
  def roll_again?
    super && @turn_score < 50
  end
end

class evenPlayer < Player #stops 50% of the time
  def evenPlayer
    num = rand(1..100)
    if num % 2 == 0
      @turn_over = true
    end
  end
end

class oddPlayer < Player #stops 50% of the time
  def oddPlayer
    num = rand(1..100)
    if num % 2 != 0
      @turn_over
    else
      super roll_again
    end
  end
end

class scorePlayer < Player #stops when they reach a certain score
  def scorePlayer
    if roll == 11
      @turn_over
    else
      super roll_again
    end
  end
end
