class Bowling
  def initialize
    @rolls = []
  end

  def roll count
    @rolls << count
  end

  def score
    score = 0
    frames.each_with_index do |frame, frame_index |
      if spare? frame
        bonus_frame = frames[frame_index + 1]
        score += 10 + bonus_frame[0]
      elsif strike? frame
        bonus_frame = frames[frame_index + 1]
        score += 10 + bonus_frame.sum
      else
        score += frame.sum
      end
    end
    score
  end

  def strike? frame
    frame[0] == 10
  end

  def spare? frame
    frame[0] != 10 && frame.sum == 10
  end

  def frames
    @rolls.each_slice(2).to_a
  end
end
