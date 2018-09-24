require "././models/game"

RSpec.describe "Game" do
  let(:strike) { ["10"] }
  let(:spare) { ["7", "3"] }
  let(:tenth) { ["10", "8", "4"] }
  let(:normal) { ["5", "4"] }

  describe "#defind_kind" do
    context "when its strike" do
      it "defines kind as strike" do
        game = Game.new(strike)
        expect(game.kind) == "strike"
      end
    end

    context "when its spare" do
      it "defines kind as strike" do
        game = Game.new(spare)
        expect(game.kind) == "spare"
      end
    end

    context "when its tenth" do
      it "defines kind as tenth frame" do
        game = Game.new(tenth)
        expect(game.kind) == "tenth"
      end
    end

    context "when its normal" do
      it "defines kind as normal frame" do
        game = Game.new(normal)
        expect(game.kind) == "normal"
      end
    end
  end

  describe "#strike?" do
    it "returns true if its a strike game" do
      game = Game.new(strike)
      expect(game.strike?).to be_truthy
    end

    it "returns false if its not a strike game" do
      game = Game.new(tenth)
      expect(game.strike?).to be false
    end
  end

  describe "#spare?" do
    it "returns true if its a spare game" do
      game = Game.new(spare)
      expect(game.spare?).to be_truthy
    end

    it "returns false if its not a strike game" do
      game = Game.new(normal)
      expect(game.spare?).to be false
    end
  end

  describe "#tenth?" do
    it "returns true if its a tenth game" do
      game = Game.new(tenth)
      expect(game.tenth?).to be_truthy
    end

    it "returns false if its not a tenth game" do
      game = Game.new(normal)
      expect(game.tenth?).to be false
    end
  end

  describe "#normal?" do
    it "returns true if its a normal game" do
      game = Game.new(normal)
      expect(game.normal?).to be_truthy
    end

    it "returns false if its not a normal game" do
      game = Game.new(spare)
      expect(game.normal?).to be false
    end
  end

  describe "#score" do
    context "when its a strike game" do
      it "returns the exactly sum for the frame" do
        game = Game.new(strike)
        expect(game.score).to eq 10
      end
    end

    context "when its a spare game" do
      it "returns the exactly sum for the frame" do
        game = Game.new(spare)
        expect(game.score).to eq 10
      end
    end

    context "when its a tenth game" do
      it "returns the exactly sum for the frame" do
        game = Game.new(tenth)
        expect(game.score).to eq 22
      end
    end

    context "when its a normal game" do
      it "returns the exactly sum for the frame" do
        game = Game.new(normal)
        expect(game.score).to eq 9
      end
    end
  end
end
