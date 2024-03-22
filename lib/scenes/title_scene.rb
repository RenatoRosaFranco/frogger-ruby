# frozen_string_literal: true

class TitleScene
  def initialize(window)
    @window = window
    @menu_items = ['New Game', 'Records', 'Quit']
    @current_selection = 0
    @font = Gosu::Font.new(20)
    @last_move = Gosu.milliseconds
    @move_delay = 200
  end

  def update
    if @window.button_down?(Gosu::KbDown) && (Gosu.milliseconds - @last_move) > @move_delay
      @current_selection = (@current_selection + 1) % @menu_items.size
      @last_move = Gosu.milliseconds
    elsif @window.button_down?(Gosu::KbUp) && (Gosu.milliseconds - @last_move) > @move_delay
      @current_selection = (@current_selection - 1) % @menu_items.size
      @last_move = Gosu.milliseconds
    elsif @window.button_down?(Gosu::KbReturn) && (Gosu.milliseconds - @last_move) > @move_delay
      case @current_selection
      when 0
        @window.change_scene(MainScene.new(@window))
      when 1
        # TODO: Implement Records screen
        # @window.change_scene(RecordsScene.new(@window))
      when 2
        @window.close
      end
    end
  end

  def draw
    @menu_items.each_with_index do |item, index|
      color = index == @current_selection ? Gosu::Color::YELLOW : Gosu::Color::WHITE
      @font.draw_text(item, 100, 100 + 30 * index, 1, 1.0, 1.0, color)
    end
  end
end