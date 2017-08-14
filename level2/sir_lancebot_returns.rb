#!/bin/ruby 
class SirLancebot2
  attr_reader :n, :bot_y, :bot_x, :grid

  def initialize(n, rc, grid)
    @n    = n
    @grid = grid
    @bot_y, @bot_x = get_sir_lancebot_pos(rc)
  end

  def next_move
    princess_xy = []

    grid.each_with_index do |line, index|
      if line.include?('p')
        princess_xy.push(line.chars.index('p'))
        princess_xy.push(index)
      end
    end

    cols = princess_xy[0] - bot_x
    rows = princess_xy[1] - bot_y

    if rows != 0
      rows < 0 ? move = 'UP' : move = 'DOWN'
      puts move; return
    elsif cols != 0
      cols < 0 ? move = 'LEFT' : move = 'RIGHT'
      puts move
    end
  end

  private

    def get_sir_lancebot_pos(rc)
      rc.strip.split.map { |num| num.to_i }
    end
end
