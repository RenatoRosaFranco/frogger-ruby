# frozen_string_literal: true

require 'gosu'
require_relative 'lib/models/frog'

# Scenes
require_relative 'lib/scenes/title_scene'
require_relative 'lib/scenes/main_scene'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = 'Frogger Adventures'
    @scene = TitleScene.new(self)
  end

  def update
    @scene.update
  end

  def change_scene(new_scene)
    @scene = new_scene
  end

  def draw
    @scene.draw
  end

  def button_down(id)
    close if id ==Gosu::KbEscape
  end
end

window = GameWindow.new
window.show