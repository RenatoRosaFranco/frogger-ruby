# frozen_string_literal: true

require 'gosu'
require_relative 'lib/models/frog'

# Scenes
require_relative 'lib/scenes/title_scene'
require_relative 'lib/scenes/main_scene'
require_relative 'lib/scenes/pause_scene'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = 'Frogger Adventures'
    @scene = TitleScene.new(self)
    @record_service = RecordService
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
    @scene.button_down(id)
  end
end

window = GameWindow.new
window.show