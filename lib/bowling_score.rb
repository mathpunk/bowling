require 'pry'
require 'pry-byebug'

class Bowling
  def initialize
    @rolls = []
  end

  def roll count
    @rolls << count
    @rolls << 0 if count == 10 && frames.last.size == 1 && !ending_bonus_frame?
  end

  def score
    score = 0
    frames.each_with_index do |frame, frame_index |
      # binding.pry
      if last_frame? frame_index
        score += frame.sum
      elsif spare? frame
        score += 10 + bonus_frame(frame_index)[0]
      elsif strike? frame
        score += 10 + bonus_frame(frame_index).sum
      else
        score += frame.sum
      end
    end
    score
  end

  def last_frame? frame_index
    frame_index == 10
  end

  def bonus_frame frame_index
    frames[frame_index + 1] || [0, 0]
  end

  def strike? frame
    frame[0] == 10 && frame.sum == 10
  end

  def spare? frame
    frame[0] != 10 && frame.sum == 10
  end

  def ending_bonus_frame?
    frames.size == 11
  end

  def frames
    @rolls.each_slice(2).to_a
  end
end
