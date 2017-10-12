class Bowling

  def initialize
    @rolls = []
  end

  def roll count
    @rolls << count
  end

  def score
    total = 0
    roll_index = 0
    frames.each do | frame |
      total += score_frame(roll_index)
      roll_index += frame_size roll_index
    end
    total
  end

  private

  def frames
    (0...10)
  end

  def frame_size roll_index
    return 1 if strike? roll_index
    2
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
