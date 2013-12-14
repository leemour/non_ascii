require 'colorize'
require_relative 'options'

module NonAscii
  class FindChars
    def initialize(file, options = {})
      raise Errno::ENOENT, "File #{file} not found" unless File.exist? file
      @file = file
      @options = extract options
    end

    def find_non_ascii
      occurances = find_chars { |char| not ascii char }
      lines = replace occurances
      format lines
    end

    private

    def extract(options)
      defaults = { placeholder: '�' }
      options.merge defaults
    end

    def ascii(char)
      char =~ /\p{ASCII}/
    end

    def find_chars
      result = []
      File.open(@file, 'r') do |f|
        f.each_line.with_index do |line, number|
          chars = line.each_char.find_all { |char| yield char }
          result << [number, line, chars] unless chars.empty?
        end
        result
      end
    end

    def replace(occurances)
      occurances.map do |number, line, chars|
        chars.uniq.each { |char| line.gsub! char, placeholder }
        [number, line, chars]
      end
    end

    def format(lines, options = {})
      lines.map do |number, line, _|
        colorize [number, ":", line]
      end.join('')
    end

    def colorize(items)
      return items if @options[:nocolor]
      number, separator, line = *items
      number.to_s.green +
      separator.blue +
      line
    end

    def placeholder
      @options[:placeholder].yellow
    end
  end
end