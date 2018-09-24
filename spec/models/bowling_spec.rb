require "././models/bowling"

RSpec.describe "Bowling" do
  describe "#play" do
    let(:name) { "Jeff" }
    let(:chances) { ["10", "7", "3", "9", "0", "10", "0", "8", "8", "2", "F", "6", "10", "10", "10", "8", "1"] }
    let(:pinfalls) { [["X"], ["7", "/"], ["9", "0"], ["X"], ["0", "8"], ["8", "/"], ["F", "6"], ["X"], ["X"], ["X", "8", "1"]] }
    let(:scores) { [20, 39, 48, 66, 74, 84, 90, 120, 148, 167] }

    before(:example) do
      @bowling = Bowling.new(name, chances)
      @bowling.play
    end

    context "Games" do
      it "returns an array of Game objects" do
        expect(@bowling.games).to all(be_a(Game))
      end
    end

    context "Pinfalls" do
      it "returns the pinfalls format" do
        expect(@bowling.pinfalls).to eq pinfalls
      end
    end

    context "Scores" do
      it "returns the total scores" do
        expect(@bowling.scores).to eq scores
      end
    end
  end
end
