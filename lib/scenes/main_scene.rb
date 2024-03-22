require 'gosu'

require_relative '../models/frog'

class MainScene < Gosu::Window
  def initialize
    super(40,480)
    window = self
    self.caption = "Frogger"
    
    @frog = Frog.new(window)
  end

  def update
    handle_player_input
  end

  def draw
    @frog.draw
  end

  private

  def handle_player_input
    if button_down?(Gosu::KbUp)
      @frog.move_up
    elsif button_down?(Gosu::KbDown)
      @frog.move_down
    elsif button_down?(Gosu::KbLeft)
      @frog.move_left
    elsif button_down?(Gosu::KbRight)
      @frog.move_right
    end
  end
end