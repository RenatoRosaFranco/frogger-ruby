# frozen_string_literal: true

class Level
  attr_reader :car_speed, :log_speed, :num_lanes, :num_rivers

  def initialize(car_speed, log_speed, num_lanes, num_rivers)
    @car_speed = car_speed
    @log_speed = log_speed
    @num_lanes = num_lanes
    @num_rivers = num_rivers
  end
end