class Rover
  def initialize(grid, x, y, direction)
    raise ArgumentError unless Integer(x) && Integer(y)
    raise ArgumentError unless ['N', 'E', 'S', 'W'].include? direction

    @grid = grid

    @y = Integer(y)
    @x = Integer(x)

    @direction = direction
  end

  def print_location
    "#{@x} #{@y} #{@direction}"
  end

  def instruct(instructions)
    # check if there are any instructions
    raise ArgumentError unless instructions.length > 0

    instructions.chars.each do |instruction|
      # could do this above the loop
      raise ArgumentError unless ['M','L','R'].include? instruction

      case instruction
      when "L"
        rotate_left
      when "R"
        rotate_right
      when "M"
        move
      end
    end
  end

  def rotate_right
    case @direction
    when "N"
      @direction = "E"
    when "E"
      @direction = "S"
    when "S"
      @direction = "W"
    when "W"
      @direction = "N"
    end
  end

  def rotate_left
    case @direction
    when "N"
      @direction = "W"
    when "W"
      @direction = "S"
    when "S"
      @direction = "E"
    when "E"
      @direction = "N"
    end
  end

  def move
    case @direction
    when "E"
      @x = @x + 1
    when "W"
      @x = @x - 1
    when "N"
      @y = @y + 1
    when "S"
      @y = @y - 1
    end

    # if the y cooridnate is out of bounds return the previous cooridnate
    @y = @y - 1 if @y > @grid.get_top_right_y
    # if the x cooridnate is out of bounds return the previous cooridnate
    @x = @x - 1 if @x > @grid.get_top_right_x
  end
end
