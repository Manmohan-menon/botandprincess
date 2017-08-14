#!/bin/env ruby

class SirLancebot
  attr_reader :n, :grid

  def initialize(n, grid)
    @n = n
    @grid = grid
  end

  def princess_path
    moves = []
    p_xy = []
    sir_lancebot_xy = []

    grid.each_with_index do |line, index|
      if line.include?('p')
        p_xy.push(line.chars.index('p'))
        p_xy.push(index)
      end
    end

    2.times { sir_lancebot_xy.push((n - 1) / 2) }

    cols = p_xy[0] - sir_lancebot_xy[0]
    rows = p_xy[1] - sir_lancebot_xy[1]

    rows < 0 ? moves.push("UP\n" * rows.abs) : moves.push("DOWN\n" * rows)
    cols < 0 ? moves.push("LEFT\n" * cols.abs) : moves.push("RIGHT\n" * cols)

    moves.each { |move| puts move }
  end
end
