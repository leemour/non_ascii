require 'spec_helper'

describe FindChars do
  before do
    @finder = FindChars.new 'spec/non_ascii.txt'
    @options = { nocolor: true }
  end

  describe '#extract option' do
    it "must be defaults when none given" do
      defaults = { placeholder: '�' }
      @finder.extract({}).must_equal defaults
    end
    it "must merge defaults with given options" do
      result = { nocolor: true, placeholder: '�' }
      @finder.extract(@options).must_equal result
    end
  end

  describe "#process single file" do
    describe "with non-ascii characters" do
      it "must highlight lines" do
        # response = "0:China, \e[0;33;49m�\e[0mity: Beijing,\n" +
        #            "5:Mr: Ji\e[0;33;49m�\e[0mn Cheng Sun,\n"
        response = "\e[0;32;49m0\e[0m\e[0;34;49m:\e[0mChina, " +
                   "\e[0;33;49m�\e[0mity: Beijing,\n" +
                   "\e[0;32;49m5\e[0m\e[0;34;49m:\e[0mMr: " +
                   "Ji\e[0;33;49m�\e[0mn Cheng Sun,\n"
        @finder.find_non_ascii.must_equal response
      end
    end
    describe "without non-ascii characters" do
      it "must return empty string" do
        finder = FindChars.new 'spec/ascii_only.txt', @options
        finder.find_non_ascii.must_equal ""
      end
    end
    describe "without color" do
      it "must return string with no color" do
        response = "0:China, �ity: Beijing,\n" +
                   "5:Mr: Ji�n Cheng Sun,\n"
        finder = FindChars.new 'spec/non_ascii.txt', @options
        finder.find_non_ascii.must_equal response
      end
    end
  end
end