class NumberGuess
  def initialize(number)
    @number = number
  end

  def choose(guess)
    if guess == @number
      'correct'
    else
      'guess again'
    end
  end
end

