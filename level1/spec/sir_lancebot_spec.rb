require('spec_helper')

# extends the Kernel module to capture the puts output of the princess_path method

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
describe 'SirLancebot' do
  describe 'princess_path' do
    it 'finds the princess path for sir Lancebot' do
      out = capture_stdout do
        sir_lancebot = SirLancebot.new(3, ['---', '-l-', '--p'])
        sir_lancebot.princess_path
      end
      expect(out.string).to(eq("DOWN\nRIGHT\n"))
    end
  end
end
