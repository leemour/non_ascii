require 'colorize'

class FindChars
  def initialize(file)
    raise Errno::ENOENT "File #{file} not found" unless File.exist? file
    @file = file
  end

  def find_non_ascii
    occurances = find_chars { |char| not ascii char }
    lines_of occurances
  end

  private

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

  def lines_of(occurances)
    occurances.map do |number, line, chars|
      chars.uniq.each { |char| line.gsub!(char, '�'.yellow) }
      number.to_s.green + ":".blue + line
    end.join('')
  end
end