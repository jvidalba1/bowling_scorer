class Printer

  attr_accessor :bowlings

  def initialize(bowlings)
    @bowlings = bowlings
  end

  def output
    @bowlings.each do |bowling|
      frame
      name(bowling)
      pinfalls(bowling)
      score(bowling)
    end
  end

  private

    def frame
      print "Frame\t\t"
      (1..10).each { |f| print "#{f}\t\t" }
      print "\n"
    end

    def name(bowling)
      puts bowling.name
    end

    def pinfalls(bowling)
      print "Pinfalls\t"
      bowling.pinfalls.map {|p| p.length == 1 ? ["", p.first] : p}.flatten.each { |chance| print "#{chance}\t" }
      print "\n"
    end

    def score(bowling)
      print "Score\t\t"
      bowling.scores.each { |s| print "#{s}\t\t" }
      print "\n"
    end

end
