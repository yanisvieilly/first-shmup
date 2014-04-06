require 'gosu'
require './ship'
require './enemy'

class GameWindow < Gosu::Window
  WIDTH = 480
  HEIGHT = 640

  def initialize
    super WIDTH, HEIGHT, false
    self.caption = 'First Shmup'

    @background = Gosu::Image.new(self, 'assets/background.png', false)
    @ship = Ship.new(self)
    @enemies = []
  end

  def update
    @ship.move_up if button_down? Gosu::KbUp
    @ship.move_down if button_down? Gosu::KbDown
    @ship.move_left if button_down? Gosu::KbLeft
    @ship.move_right if button_down? Gosu::KbRight

    if rand(100) == 0
      @enemies.push Enemy.new(self)
    end
    @enemies.each { |enemy| enemy.move }
    @enemies.reject! { |enemy| enemy.y > HEIGHT }
  end

  def draw
    @background.draw(0, 0, 0)
    @ship.draw
    @enemies.each { |enemy| enemy.draw }
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = GameWindow.new
window.show
