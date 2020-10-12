class Grid
  def initialize(x, y)
    raise ArgumentError unless Integer(x) && Integer(y)

    @top_right_y = Integer(y)
    @top_right_x = Integer(x)
  end

  def get_top_right_x
    @top_right_x
  end

  def get_top_right_y
    @top_right_y
  end
end
