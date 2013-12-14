module NonAscii
  class OptionParser
    class << self
      def parse
        options = Options.new
        ARGV.each_cons(2) do |first, second|
          return options if end_of_options? first, second
          if option? first
            options[:first] = option_value? second ? second : true
            ARGV.delete first
          end
        end
        options
      end

      private

      def end_of_options?(first, second)
        not option?(first) and not option?(second)
      end

      def option?(arg)
        arg =~ /^-{1,2}\w+$/ and arg !~ /\./
      end

      def option_value?(arg)
        not arg.start_with?('-') and arg !~ /\./
      end
    end
  end


  class Options
    include Enumerable
    extend Forwardable

    def_delegators :@values, :each, :map, :merge, :[], :[]=

    def initialize
      @values = {}
    end

    def <<(option)
      @values << option.sub(/^-{1,2}/, '')
    end
  end
end