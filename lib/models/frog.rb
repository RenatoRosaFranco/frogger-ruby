# frozen_string_literal: true

class Frog
  def initialize(window)
    @image = Gosu::Image(windows, 'assets/sprites/frog.png', false)
    @x, @y = 0
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move_up
    @y -= 10
  end

  def move_down
    @y += 10
  end

  def move_left
    @x -= 10
  end

  def move_right
    @x += 10
  end
end