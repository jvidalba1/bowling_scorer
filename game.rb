
class Game
  attr_accessor :frame, :kind, :score

  def initialize(frame)
    @frame = frame
    @score = []
    define_kind
  end

  def define_kind
    if strike?
      @score << [10]
      @kind = "strike"
    elsif spare?
      @score << frame
      @kind = "spare"
    elsif tenth?
      @score << frame
      @kind = "tenth"
    else
      @score << frame
      @kind = "normal"
    end
  end

  def strike?
    frame.length == 1 && frame.include?("10")
  end

  def spare?
    frame.length == 2 && score == 10
  end

  def tenth?
    frame.length == 3
  end

  def normal?
    score(frame) < 10
  end

  def score
    frame.inject(0) { |sum, n| sum + n.to_i }
  end

end
