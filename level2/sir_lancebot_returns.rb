#!/bin/usr/env ruby

# this is the main class
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
    check_moves(rows, cols)
  end

  private

  def get_sir_lancebot_pos(rc)
    rc.strip.split.map(&:to_i)
  end

  def check_moves(rows, cols)
    if rows != 0
      move = rows < 0 ? 'UP' : 'DOWN'
      puts move
    elsif cols != 0
      move = cols < 0 ? 'LEFT' : 'RIGHT'
      puts move
    end
  end
end
