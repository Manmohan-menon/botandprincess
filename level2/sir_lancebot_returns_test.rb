require '../level2/sir_lancebot_returns.rb'
require 'minitest/autorun'
require 'stringio'

module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

class SirLancebotTest2 < Minitest::Test
  def test_output_next_move_for_princess_above_lancebot
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('3',
                               '1 1',
                               ["-p-",
                                "-m-",
                                "---"])
      sir_lancebot.next_move
    end

    assert_equal "UP\n", out.string
  end

  def test_output_next_move_for_princess_below_lancebot
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('5',
                               '2 1',
                               ["-----",
                                "-----",
                                "-m---",
                                "-----",
                                "p----"])
      sir_lancebot.next_move
    end

    assert_equal "DOWN\n", out.string
  end

  def test_output_next_move_for_princess_left_lancebot
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('5',
                               '2 3',
                               ["-----",
                                "-----",
                                "p--m-",
                                "-----",
                                "-----"])
      sir_lancebot.next_move
    end

    assert_equal "LEFT\n", out.string
  end

  def test_output_next_move_for_princess_right_lancebot
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('5',
                               '2 1',
                               ["-----",
                                "-----",
                                "-m--p",
                                "-----",
                                "-----"])
      sir_lancebot.next_move
    end

    assert_equal "RIGHT\n", out.string
  end
end