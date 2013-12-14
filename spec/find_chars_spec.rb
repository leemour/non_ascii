require "minitest/autorun"

describe FindChars do
  before do
    @find = FindChars.new 'test.txt'
  end

  describe "when a file is given" do
    it "must respond positively" do
      response = "0:China, �ity: Beijing,\n
                  5:Mr: Ji�n Cheng Sun,"
      @find.i_can_has_cheezburger?.must_equal "OHAI!"
    end
    it "won't say no" do
      @meme.will_it_blend?.wont_match /^no/i
    end
  end
end

# p NonAscii::OptionParser.option_value?('--nocolor')
# p NonAscii::OptionParser.option?('--nocolor')

# ARGV.replace ['--nocolor', 'test.txt']

# test = FindChars.new 'test.txt'
# p test.find_non_ascii