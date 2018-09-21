require 'byebug'
require './reader.rb'
require './bowling.rb'
require './printer.rb'

class Wrapper
  attr_accessor :url_file, :match

  def initialize(url_file)
    @url_file = url_file
    @match = Reader.parse(@url_file)
  end

  def execute
    bowlings = @match.map do |name, pinfalls|
      bowling = Bowling.new(name, pinfalls)
      bowling.play
      bowling
    end
    printer = Printer.new(bowlings)
    printer.output
  end
end

url_file = ARGV.first
wrapper = Wrapper.new(url_file)
wrapper.execute
