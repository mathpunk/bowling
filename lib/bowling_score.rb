class Bowling

  def initialize
    @rolls = []
  end

  def roll count
    @rolls << count
  end

  def score
    score = 0
    roll_index = 0
    (0...10).each do | _ |
      score += score_frame(roll_index)
      if strike? roll_index
        roll_index += 1
      else
        roll_index += 2
      end
    end
    score
  end

  def score_frame roll_index
    score = @rolls[roll_index] + @rolls[roll_index + 1]
    if spare?(roll_index) || strike?(roll_index)
      score += @rolls[roll_index + 2]
    end
    score
  end

  def strike? roll_index
    @rolls[roll_index] == 10
  end

  def spare? roll_index
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end

end
