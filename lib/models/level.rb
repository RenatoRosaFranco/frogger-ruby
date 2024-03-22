# frozen_string_literal: true

class Level
  attr_reader :card_speed, :log_speed, :num_lanes, :num_rivers

  def initialize(card_speed, log_speed, num_lanes, num_rivers)
    @card_speed = card_speed
    @log_speed = log_speed
    @num_lanes = num_lanes
    @num_rivers = num_rivers
  end
end