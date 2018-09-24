
class Game
  attr_accessor :frame, :kind

  def initialize(frame)
    @frame = frame
    @score = []
    define_kind
  end

  def define_kind
    if strike?
      @kind = "strike"
    elsif spare?
      @kind = "spare"
    elsif tenth?
      @kind = "tenth"
    else
      @kind = "normal"
    end
  end

  def strike?
    @frame.length == 1 && @frame.include?("10")
  end

  def spare?
    @frame.length == 2 && score == 10
  end

  def tenth?
    @frame.length == 3
  end

  def normal?
    score < 10
  end

  def score
    @frame.inject(0) { |sum, n| sum + n.to_i }
  end

end
