require 'gosu'

require_relative '../models/frog'

class MainScene
  def initialize(window)
    @window = window
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
    if @window.button_down?(Gosu::KbUp)
      @frog.move_up
    elsif @window.button_down?(Gosu::KbDown)
      @frog.move_down
    elsif @window.button_down?(Gosu::KbLeft)
      @frog.move_left
    elsif @window.button_down?(Gosu::KbRight)
      @frog.move_right
    end
  end
end