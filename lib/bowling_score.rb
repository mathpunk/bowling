

class BowlingScore

  def initialize
    @roll = []
  end

  def score
    score = @roll.sum
    frames.each_with_index do |frame, frame_index|
      if strike? (frame)
        first_bonus_ball_index = (2 * frame_index) + 2
        second_bonus_ball_index = (2 * frame_index) + 3
        score += @roll[first_bonus_ball_index] + @roll[second_bonus_ball_index]
      elsif spare?(frame)
        bonus_ball_index = (2 * frame_index) + 2
        score += @roll[bonus_ball_index]
      end
    end
    score
  end

  def frames
    @roll.each_slice(2).to_a
  end

  def strike?(frame)
    frame[0] == 10
  end

  def spare?(frame)
    frame[0] && frame[1] && frame[0] + frame[1] == 10
  end

  def roll(pins)
    @roll << pins
    if pins == 10
      @roll << 0
    end
  end

end

