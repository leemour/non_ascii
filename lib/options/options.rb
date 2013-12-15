require 'forwardable'

module NonAscii
  class OptionsParser
    class << self
      def parse(arguments)
        options = Options.new
        return options if arguments.length < 2
        arguments.each_cons(2) do |first, second|
          return options if end_of_options? first, second
          if option? first
            options[first] = option_value?(second) ? second : true
            arguments.delete first
          end
        end
        options
      end

      # private

      def end_of_options?(first, second)
        not option?(first) and not option?(second)
      end

      def option?(arg)
        !!arg[/^-{1,2}\w+$/]
      end

      def option_value?(arg)
        not arg.start_with?('-') and not_file? arg
      end

      def not_file?(arg)
        arg !~ /[\.\\\/]/
      end
    end
  end


  class Options
    include Enumerable
    extend Forwardable

    def_delegators :@values, :each, :map, :merge!, :[]

    def initialize
      @values = {}
    end

    def <<(option)
      @values << option.sub(/^-{1,2}/, '')
    end

    def []=(key, value)
      @values[keyify(key)] = value
    end

    def keyify(arg)
      (arg.sub /^-+/, '').to_sym
    end
  end
end