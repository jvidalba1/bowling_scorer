require "././models/reader"

RSpec.describe "Reader" do
  describe ".parse" do
    let(:valid_game_file) { "resources/bowling-game.txt" }
    let(:valid_complete_game_file) { "resources/complete-strike-game.txt" }
    let(:all_fouls_game_file) { "resources/all_fouls_game.txt" }
    let(:all_zeros_game_file) { "resources/all_zeros_game.txt" }
    let(:valid_game) {
      { "Jeff" => ["10", "7", "3", "9", "0", "10", "0", "8", "8", "2", "F", "6", "10", "10", "10", "8", "1"],
        "John" => ["3", "7", "6", "3", "10", "8", "1", "10", "10", "9", "0", "7", "3", "4", "4", "10", "9", "0"] }
    }
    let(:complete_valid_game) {
      { "Jeff" => ["10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10"] }
    }
    let(:all_fouls_game) {
      { "Jeff" => [ "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F",
                    "F", "F", "F", "F", "F", "F", "F", "F", "F"] }
    }
    let(:all_zeros_game) {
      { "Jeff" => [ "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0",
                    "0", "0", "0", "0", "0", "0", "0", "0", "0"] }
    }

    context "when txt is valid game" do
      before(:example) do
        @match = Reader.parse(valid_game_file)
      end

      it "resturns a valid match format" do
        expect(@match).to eq valid_game
      end

      it "returns the minimum size game" do
        expect(@match.values.first.flatten.length).to satisfy {|n| n >= 12 && n <= 21}
        expect(@match.values[1].flatten.length).to satisfy {|n| n >= 12 && n <= 21}
      end
    end

    context "when txt is valid complete strike game" do
      before(:example) do
        @match = Reader.parse(valid_complete_game_file)
      end

      it "resturns a valid complete match format" do
        expect(@match).to eq complete_valid_game
      end

      it "returns a valid size game" do
        expect(@match.values.flatten.length).to eq 12
      end
    end

    context "when txt is valid all fouls game" do
      before(:example) do
        @match = Reader.parse(all_fouls_game_file)
      end

      it "resturns a valid complete match format" do
        expect(@match).to eq all_fouls_game
      end

      it "returns a valid size game" do
        expect(@match.values.flatten.length).to eq 21
      end
    end

    context "when txt is valid all zeros game" do
      before(:example) do
        @match = Reader.parse(all_zeros_game_file)
      end

      it "resturns a valid complete match format" do
        expect(@match).to eq all_zeros_game
      end

      it "returns a valid size game" do
        expect(@match.values.flatten.length).to eq 21
      end
    end
  end
end
