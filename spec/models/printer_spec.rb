require "././models/printer"
require "././models/game"
require "././models/bowling"

RSpec.describe "Printer" do
  describe "" do
    let(:name) { "Jeff" }
    let(:random) { ["10", "7", "3", "9", "0", "10", "0", "8", "8", "2", "F", "6", "10", "10", "10", "8", "1"] }
    let(:strike) { ["10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10"] }
    let(:fouls) { ["F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F"] }
    let(:zeros) { ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"] }
    let(:random_result) { "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\t\t\nJeff\nPinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1\t\nScore\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\t\t\n" }
    let(:strike_result) { "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\t\t\nJeff\nPinfalls\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\tX\tX\tX\t\nScore\t\t30\t\t60\t\t90\t\t120\t\t150\t\t180\t\t210\t\t240\t\t270\t\t300\t\t\n" }
    let(:fouls_result) { "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\t\t\nJeff\nPinfalls\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\tF\t\nScore\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t\n" }
    let(:zeros_result) { "Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\t\t\nJeff\nPinfalls\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t\nScore\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t0\t\t\n" }

    context "Random game" do
      it "prints all valid bowling game" do
        bowling = Bowling.new(name, random)
        bowling.play
        bowlings = [bowling]
        printer = Printer.new(bowlings)
        expect { printer.output }.to output(random_result).to_stdout
      end
    end

    context "All strike game" do
      it "prints all strike bowling game" do
        bowling = Bowling.new(name, strike)
        bowling.play
        bowlings = [bowling]
        printer = Printer.new(bowlings)
        expect { printer.output }.to output(strike_result).to_stdout
      end
    end

    context "Alll fouls game" do
      it "prints all fouls bowling game" do
        bowling = Bowling.new(name, fouls)
        bowling.play
        bowlings = [bowling]
        printer = Printer.new(bowlings)
        expect { printer.output }.to output(fouls_result).to_stdout
      end
    end

    context "Alll zeros game" do
      it "prints all zeros bowling game" do
        bowling = Bowling.new(name, zeros)
        bowling.play
        bowlings = [bowling]
        printer = Printer.new(bowlings)
        expect { printer.output }.to output(zeros_result).to_stdout
      end
    end
  end
end

