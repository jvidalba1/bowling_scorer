require './game.rb'

class Bowling
  attr_accessor :chances, :name, :pinfalls, :scores

  def initialize(name, chances)
    @name = name
    @chances = chances
    @pinfalls = []
    @scores = []
  end

  def play
    games = []
    games_by_frame(@chances).each do |frame|
      game = Game.new(frame)
      parse_pinfalls(game)
      games << game
    end
    result(games)
  end

  def result(games)
    games.each_with_index do |game, index|
      sum = if game.tenth?
        (@scores.last || 0 ) + game.score
      elsif game.strike?
        if games[index+1].strike?
          if games[index+2].strike?
            (@scores.last || 0 ) + 30
          elsif games[index+2].spare?
            (@scores.last || 0 ) + 20 + games[index+2].frame.first.to_i
          else
            (@scores.last || 0 ) + 20 + games[index+2].frame[0].to_i
          end
        elsif games[index+1].spare?
          (@scores.last || 0 ) + 20
        elsif games[index+1].tenth?
          (@scores.last || 0 ) + 10 + games[index+1].frame[0].to_i + games[index+1].frame[1].to_i
        else
          (@scores.last || 0 ) + 10 + games[index+1].score
        end
      elsif game.spare?
        (@scores.last || 0 ) + 10 + games[index+1].frame[0].to_i
      else
        (@scores.last || 0 ) + game.score
      end
      @scores << sum
    end
  end

  private

    def games_by_frame(games)
      pinsfall_by_frame = []
      ii = 0
      while (ii < games.length )
        if ii == games.length - 3
          pinsfall_by_frame << [games[ii], games[ii+1], games[ii+2]]
          ii += 2
        elsif games[ii] == "10"
          pinsfall_by_frame << [games[ii]]
        else
          pinsfall_by_frame << [games[ii], games[ii+1]]
          ii += 1
        end
        ii += 1
      end
      pinsfall_by_frame
    end

    def parse_pinfalls(game)
      if game.kind == "strike"
        @pinfalls << ["X"]
      elsif game.kind == "spare"
        @pinfalls << [game.frame.first, "/"]
      elsif game.kind == "tenth"
        @pinfalls << game.frame.map { |chance| chance == "10" ? "X" : chance }
      else
        @pinfalls << game.frame
      end
    end
end
