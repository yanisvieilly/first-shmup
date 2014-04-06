require 'gosu'
require './ship'

class GameWindow < Gosu::Window
  def initialize
    super 480, 640, false
    self.caption = 'First Shmup'

    @background = Gosu::Image.new(self, 'assets/background.png', false)
    @ship = Ship.new(self)
  end

  def update
    @ship.move_up if button_down? Gosu::KbUp
    @ship.move_down if button_down? Gosu::KbDown
    @ship.move_left if button_down? Gosu::KbLeft
    @ship.move_right if button_down? Gosu::KbRight
  end

  def draw
    @background.draw(0, 0, 0)
    @ship.draw
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = GameWindow.new
window.show
