require('spec_helper')

# extends the Kernel module to capture the puts output of the next_move method
module Kernel
  def capture_stdout
    (out = StringIO.new
     $stdout = out
     yield
     return out)
  ensure
    $stdout = STDOUT
  end
end

# spec for finding the princess path
describe 'SirLancebotTest2' do
  it 'test_output_next_move_for_princess_above_lancebot' do
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('3', '1 1',
                                      ['-p-', '-l-', '---'])
      sir_lancebot.next_move
    end

    expect(out.string).to(eq("UP\n"))
  end

  it 'test_output_next_move_for_princess_below_lancebot' do
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('5', '2 1',
                                      ['-----', '-----',
                                       '-l---', '-----',
                                       'p----'])
      sir_lancebot.next_move
    end

    expect(out.string).to(eq("DOWN\n"))
  end

  it 'test_output_next_move_for_princess_left_lancebot' do
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('5', '2 3',
                                      ['-----', '-----',
                                       'p--l-', '-----',
                                       '-----'])
      sir_lancebot.next_move
    end

    expect(out.string).to(eq("LEFT\n"))
  end

  it 'test_output_next_move_for_princess_right_lancebot' do
    out = capture_stdout do
      sir_lancebot = SirLancebot2.new('5', '2 1',
                                      ['-----', '-----',
                                       '-l--p', '-----',
                                       '-----'])
      sir_lancebot.next_move
    end

    expect(out.string).to(eq("RIGHT\n"))
  end
end
