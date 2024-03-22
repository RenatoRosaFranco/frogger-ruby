# frozen_string_literal: true

class Log
  attr_reader :x, :y, :image, :speed

  def initialize(window, x, y, speed)
    @window = window
    @x, @y = x, y
    @speed = speed
    @image = Gosu::Image.new('assets/sprites/frog.png', retro: true, tileable: false)
  end

  def update
    @x += speed
    wrap_around_screen
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  private

  def wrap_around_screen
    if @x > @window.width
      @x = -@image.width
    elsif @x < -@image.width
      @x = @window.width
    end
  end
end