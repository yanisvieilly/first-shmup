class Enemy
  WIDTH = 32
  HEIGHT = 24

  attr_reader :y

  def initialize(window)
    @image = Gosu::Image.new(window, 'assets/ships.png', false, 40, 328, WIDTH, HEIGHT)
    @x = rand(0..(window.width - WIDTH))
    @y = -HEIGHT
  end

  def move
    @y += 3
  end

  def draw
    @image.draw_rot(@x, @y, 1, 180, 1, 1)
  end
end