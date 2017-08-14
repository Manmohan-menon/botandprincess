require_relative "../level1/sir_lancebot.rb"
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

class SirLancebotTest < Minitest::Test
  def test_princess_path
    out = capture_stdout do
      sir_lancebot = SirLancebot.new(3, ['---',
                                  '-m-',
                                  '--p'])
      sir_lancebot.princess_path
    end

    assert_equal "DOWN\nRIGHT\n", out.string
  end
end
