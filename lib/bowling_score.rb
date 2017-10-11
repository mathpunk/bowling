require "pry"

class Bowling
  def initialize
    @rolls = []
  end

  def roll count
    @rolls << count
    if frames.size == 11
      return
    else
      if count == 10
        if frames.last.size == 1
          @rolls << 0
        else
          return
        end
      end
    end
  end

  def score
    score = 0
    frames.each_with_index do |frame, frame_index|
      score += frame_score frame_index
    end
    score
  end

  def frame_score frame_index
    puts "scoring frame ", frame_index
    frame = frames[frame_index]
    if extra_frame? frame_index
      score = frame.sum
      puts "it's a bonus frame, worth ", score
      # binding.pry
    else
      puts "not ending frame"
      if spare? frame
        score = frame.sum + bonus_frame(frame_index)[0]
        puts "this spare is worth ", score
        score
      elsif strike? frame
        score = frame.sum + bonus_frame(frame_index).sum
        puts "this strike is worth ", score
        score
      else
        score = frame.sum
        puts "this frame is worth ", score
        score
      end
    end
  end

  def extra_frame? frame_index
    frame_index == 10
  end

  def bonus_frame frame_index
    frames[frame_index + 1]
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
