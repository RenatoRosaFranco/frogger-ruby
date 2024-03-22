# frozen_string_literal: true

class Frog
  attr_reader :x, :y

  def initialize(window)
    @image = Gosu::Image.new(window, 'assets/sprites/frog.png', false)
    @x, @y = 320, 240
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move_up
    @y -= 10 unless @y <= 0
  end

  def move_down
    @y += 10 unless @y >= 470
  end

  def move_left
    @x -= 10 unless @x <= 0
  end

  def move_right
    @x += 10 unless @x >= 630
  end
end