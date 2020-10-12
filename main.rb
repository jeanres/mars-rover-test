require_relative './lib/grid'
require_relative './lib/rover'
class Main
  def process_grid
    params = gets.chomp.split(' ')
    @grid = Grid.new(params[0], params[1])
  end

  def process_rovers
    STDIN.each_slice(2).each do |lines|
      x, y, direction = lines[0].split
      rover = Rover.new(@grid, x, y, direction)
      rover.instruct(lines[1].strip)
      puts rover.get_current_location
    end
  end
end

main = Main.new
main.process_grid
main.process_rovers
