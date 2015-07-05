require './pattern'
require './line'
require './line_processor'

class Input
  def read_lines
    line_processor = LineProcessor.new
    while(true)
      line = gets.chomp
      line = Line.new(line)

      if line.valid?
        line_processor.add_line(line)
      else
        break
      end

    end
    line_processor.process.print_result
  end
end
