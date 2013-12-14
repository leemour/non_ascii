require 'spec_helper'

describe NonAscii::OptionParser do
  # before do
  #   @options = Options.new
  # end

  describe "option?" do
    it "must be true for option name" do
      NonAscii::OptionParser.option?('--nocolor').must_equal     true
    end
    it "must be false for option value or file" do
      NonAscii::OptionParser.option?('cool').must_equal          false
      NonAscii::OptionParser.option?('spec/test.txt').must_equal false
    end
  end

  describe "option_value?" do
    it "must be true for option value" do
      NonAscii::OptionParser.option_value?('cool').must_equal          true
    end
    it "must be false for option name or file" do
      NonAscii::OptionParser.option_value?('--nocolor').must_equal     false
      NonAscii::OptionParser.option_value?('spec/test.txt').must_equal false
    end
  end
end