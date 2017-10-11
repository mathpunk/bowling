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
      if strike? roll_index
        score += score_frame(roll_index)
        roll_index += 1
      else
        score += score_frame(roll_index)
        roll_index += 2
      end
    end
    score
  end

  def score_frame roll_index
    if spare?(roll_index) || strike?(roll_index)
      @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
    else
      @rolls[roll_index] + @rolls[roll_index + 1]
    end
  end

  def strike? roll_index
    @rolls[roll_index] == 10
  end

  def spare? roll_index
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end
end
