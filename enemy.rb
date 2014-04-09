class Enemy
  WIDTH = 32
  HEIGHT = 24

  def initialize(window)
    @window = window
    @image = Gosu::Image.new(@window, 'assets/ships.png', false, 40, 328, WIDTH, HEIGHT)
    @x = rand(0..(@window.width - WIDTH))
    @y = -HEIGHT
    @timer = 0
  end

  def shoot
    @window.bullets.push Bullet.new(@window, @x + WIDTH / 2 - 2, @y + HEIGHT)
  end

  def inactive?
    @y > 640
  end

  def update
    @timer += 1

    if @timer == 60
      shoot
      @timer = 0
    end

    @y += 3
  end

  def draw
    @image.draw_rot(@x, @y, 1, 180, 1, 1)
  end
end
