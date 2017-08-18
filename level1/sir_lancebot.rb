#!/bin/usr/env ruby

# this is the main class
class SirLancebot
  attr_reader :n, :grid

  def initialize(n, grid)
    @n = n
    @grid = grid
  end

  # this method finds the prince path for sir lancebot
  def princess_path
    moves = []
    princess_xy = []
    sir_lancebot_xy = []

    grid.each_with_index do |line, index|
      if line.include?('p')
        princess_xy.push(line.chars.index('p'))
        princess_xy.push(index)
      end
    end

    2.times { sir_lancebot_xy.push((n - 1) / 2) }

    cols = princess_xy[0] - sir_lancebot_xy[0]
    rows = princess_xy[1] - sir_lancebot_xy[1]

    rows < 0 ? moves.push("UP\n" * rows.abs) : moves.push("DOWN\n" * rows)
    cols < 0 ? moves.push("LEFT\n" * cols.abs) : moves.push("RIGHT\n" * cols)

    moves.each { |move| puts move }
  end
end
