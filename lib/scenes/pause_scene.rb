# frozen_string_literal: true

require_relative 'main_scene'
class PauseScene
  def initialize(window, previous_scene)
    @window = window
    @previous_scene = previous_scene
    @font = Gosu::Font.new(20)
    @message = "Game Paused\nPress Esc to return"
  end

  def update; end

  def draw
    @font.draw_text(@message, 100, 100, 1, 1.0, 1.0, Gosu::Color::WHITE)
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.change_scene(@previous_scene)
    end
  end
end
