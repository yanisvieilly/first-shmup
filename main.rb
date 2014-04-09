require 'gosu'
require './ship'
require './enemy'
require './bullet'

class GameWindow < Gosu::Window
  WIDTH = 480
  HEIGHT = 640

  attr_reader :enemies, :bullets

  def initialize
    super WIDTH, HEIGHT, false
    self.caption = 'First Shmup'

    @background = Gosu::Image.new(self, 'assets/background.png', false)

    @ship = Ship.new(self)

    @enemies = []
    @bullets = []
  end

  def clean
    @enemies.reject!(&:inactive?)
    @bullets.reject!(&:inactive?)
  end

  def update
    @ship.update

    if rand(100) == 0
      @enemies.push Enemy.new(self)
    end
    @enemies.each(&:update)

    @bullets.each(&:update)

    clean
  end

  def draw
    @background.draw(0, 0, 0)
    @ship.draw
    @enemies.each(&:draw)
    @bullets.each(&:draw)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show
