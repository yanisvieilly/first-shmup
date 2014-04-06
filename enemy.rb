class Enemy
  attr_reader :y

  def initialize(window)
    @image = Gosu::Image.new(window, 'assets/ships.png', false, 40, 328, 32, 24)
    @x = rand(448)
    @y = -24
  end

  def move
    @y += 3
  end

  def draw
    @image.draw_rot(@x, @y, 1, 180)
  end
end