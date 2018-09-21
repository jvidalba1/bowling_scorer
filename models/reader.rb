class Reader
  def self.parse(url_file)
    match = Hash.new { |h, k| h[k] = [] }
    File.open(url_file).each do |line|
      game = line.split(" ")
      match[game[0]] << game[1]
    end
    match
  end
end
