# frozen_string_literal: true

require 'gosu'
require 'yaml'

require_relative 'title_scene'

class RecordsScene
  def initialize(window)
    @window = window
    @font = Gosu::Font.new(20)
    load_records
  end

  def load_records
    records_path = File.join(File.dirname(__FILE__), '../../data/mock/records.yaml')
    @records = YAML.load_file(records_path)['records']
  rescue StandardError => e
    puts "Failed to load records: #{e.message}"
    records = []
  end

  def update
    if @window.button_down?(Gosu::KbEscape)
      @window.change_scene(TitleScene.new(@window))
    end
  end

  def draw
    @records.each_with_index do |record, index|
      text = "#{record['name']}: #{}"
      @font.draw_text(text, 100, 100 + 30 * index, 1, 1.0, 1.0, Gosu::Color::WHITE)
    end
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.change_scene(TitleScene.new(@window))
    end
  end
end
