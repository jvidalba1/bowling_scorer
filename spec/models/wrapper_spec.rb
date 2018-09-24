require "././models/wrapper"
require "././models/reader"

RSpec.describe "Wrapper" do
  describe "new" do
    let(:match) {
      { "Jeff" => ["10", "7", "3", "9", "0", "10", "0", "8", "8", "2", "F", "6", "10", "10", "10", "8", "1"],
      "John" => ["3", "7", "6", "3", "10", "8", "1", "10", "10", "9", "0", "7", "3", "4", "4", "10", "9", "0"] }
    }

    let(:valid_game_file) { "resources/bowling-game.txt" }

    it "creates a match valid format from reader class" do
      @wrapper = Wrapper.new(valid_game_file)
      expect(@wrapper.match).to eq match
    end
  end
end
