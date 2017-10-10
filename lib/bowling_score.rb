class BowlingGame
  def initialize
    @rolls = []
  end

  def roll count
    puts "roll: ", count
    @rolls << count
    @rolls << 0 if count == 10 && @rolls.size % 2 == 1
    puts "rolls: ", @rolls.inspect
  end

  def score
    score = 0
    frames.each_with_index do |frame, frame_index|
      if spare? frame
        score += spare_bonus(frame_index)
      elsif strike? frame
        score += strike_bonus(frame_index)
      else
        score += frame.sum
      end
    end
    score
  end

  def spare_bonus(frame_index)
    bonus_frame = frames[frame_index + 1]
    bonus_frame[0]
  end

  def strike_bonus(frame_index)
    bonus_frame = frames[frame_index + 1]
    bonus_frame.sum
  end

  def strike? frame
    frame[0] == 10
  end

  def spare? frame
    frame.sum == 10 && frame[0] != 10
  end

  def frames
    @rolls.each_slice(2).to_a
  end
end
