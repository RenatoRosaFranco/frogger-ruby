# frozen_string_literal: true

require 'gosu'

require_relative '../models/car'
require_relative '../models/frog'
require_relative '../models/level'
require_relative '../models/log'

require_relative '../scenes/title_scene'

class MainScene
  def initialize(window)
    @window = window
    @current_level_index = 0
    @levels = initialize_levels
    @frog = Frog.new(window)
    setup_level(@levels[@current_level_index])
  end

  def initialize_levels
    [
      Level.new(1, 1, 3, 1),
      Level.new(2, 1.5, 4, 2),
      Level.new(3, 2, 5, 3)
    ]
  end

  def setup_level(level)
    configure_card_speed(level.car_speed)
    configure_log_speed(level.log_speed)
    configure_lanes(level.num_lanes)
    configure_rivers(level.num_rivers)

    @cars, @logs = [], []

    level.num_lanes.times do |i|
      @cars << Car.new(@window, rand(@window.width), i * 100, level.car_speed)
    end

    level.num_rivers.times do |i|
      @logs << Log.new(@window, rand(@window.width), i * 150 + 100, level.log_speed)
    end
  end

  def configure_card_speed(speed)
    # TODO: to be implemented
  end

  def configure_log_speed(speed)
    # TODO: to be implemented
  end

  def configure_lanes(num_lanes)
    # TODO: to be implemented
  end

  def configure_rivers(num_rivers)
    # TODO: to be implemented
  end

  def next_level
    @current_level_index += 1
    setup_level(@levels[@current_level_index]) unless @current_level_index >= @levels
  end

  def update
    handle_player_input
    @cars.each(&:update)
    @logs.each(&:update)

    if frog_on_log?
      @frog.x += log_under_frog.speed
    end

    check_level_completion
  end

  def frog_on_log?
    @logs.any? do |log|
      Gosu.distance(@frog.x, @frog.y, log.x + log.image.width / 2, log.y + log.image.height / 2) < 50
    end
  end

  def log_under_frog
    @logs.find do |log|
      Gosu.distance(@frog.x, @frog.y, log.x + log.image.width / 2, log.y + log.image.height / 2) < 50
    end
  end

  def draw
    @frog.draw
    @cars.each(&:draw)
    @logs.each(&:draw)
  end

  private

  def level_complete?
    # @frog.y <= 0
  end

  def check_level_completion
    next_level if level_complete?
  end

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

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.change_scene(TitleScene.new(@window))
    end
  end
end