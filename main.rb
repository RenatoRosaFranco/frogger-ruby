# frozen_string_literal: true

require 'gosu'
require_relative 'lib/models/frog'

# Scenes
require_relative 'lib/scenes/main_scene.rb'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = 'Frogger'
    @scene = MainScene.new(self)
  end

  def update
    @scene.update
  end

  def draw
    @scene.draw
  end
end

window = GameWindow.new
window.show