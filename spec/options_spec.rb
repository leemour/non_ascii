require 'spec_helper'

describe OptionsParser do
  # before do
  #   @options = Options.new
  # end

  describe "option?" do
    it "must be true for option name" do
      OptionsParser.option?('--nocolor').must_equal     true
    end
    it "must be false for option value or file" do
      OptionsParser.option?('cool').must_equal          false
      OptionsParser.option?('spec/test.txt').must_equal false
    end
  end

  describe "option_value?" do
    it "must be true for option value" do
      OptionsParser.option_value?('cool').must_equal          true
    end
    it "must be false for option name or file" do
      OptionsParser.option_value?('--nocolor').must_equal     false
      OptionsParser.option_value?('spec/test.txt').must_equal false
    end
  end
end