class Bullet
  def initialize(window, x, y)
    @window = window
    @image = Gosu::Image.new(@window, 'assets/ships.png', false, 174, 37, 4, 7)
    @x = x
    @y = y
  end

  def inactive?
    @y > @window.height
  end

  def update
    @y += 4
  end

  def draw
    @image.draw_rot(@x, @y, 1, 180, 1, 1)
  end
end
