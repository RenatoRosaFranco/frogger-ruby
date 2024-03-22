# frozen_string_literal: true

class Car
  attr_accessor :speed
  attr_reader :x, :y

  def initialize(window, x, y, speed)
    @window = window
    @x, @y = x, y
    @speed = speed
    @image = Gosu::Image.new('assets/sprites/frog.png', retro: true, tileable: false)
  end

  def update
    @x += @speed
    @x = -@image.width if @x > @window.width
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end