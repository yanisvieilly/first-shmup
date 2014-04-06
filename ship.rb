class Ship
  SPEED = 3
  WIDTH = 32
  HEIGHT = 32

  def initialize(window)
    @image = Gosu::Image.new(window, 'assets/ships.png', false, 80, 320, WIDTH, HEIGHT)
    @x = window.width / 2 - WIDTH / 2
    @y = window.height - HEIGHT - 18
  end

  def move_up
    @y -= SPEED unless @y <= 0
  end

  def move_down
    @y += SPEED unless @y >= 640 - HEIGHT
  end

  def move_left
    @x -= SPEED unless @x <= 0
  end

  def move_right
    @x += SPEED unless @x >= 480 - WIDTH
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
