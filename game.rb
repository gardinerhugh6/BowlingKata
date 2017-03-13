class Game

  def initialize
    @rolls = Array.new()
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    frame_index = 0
    for i in 1..10
      if is_strike(frame_index)
        score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif is_spare(frame_index)
        score += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        score += sum_of_balls_in_frame(frame_index)
        frame_index += 2
      end
    end
    score
  end

  private

  def is_spare(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end

  def is_strike(frame_index)
    @rolls[frame_index] == 10
  end

  def sum_of_balls_in_frame(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1]
  end

  def spare_bonus(frame_index)
    @rolls[frame_index + 2]
  end

  def strike_bonus(frame_index)
    @rolls[frame_index + 1] + @rolls[frame_index + 2]
  end

end