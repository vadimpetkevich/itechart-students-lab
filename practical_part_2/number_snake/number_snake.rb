require 'matrix'

module NumberSnake
  def NumberSnake.fill_square(dimensions)
    square = Matrix.build(dimensions) { -1 }

    def square.empty_element?(row, column)
      self[row, column] && self[row, column] < 0
    end

    row, column = 0, square.row_count - 1
    direction, number = 0, 0

    change_direction = Proc.new do
      direction == 3 ? direction = 0 : direction += 1
    end

    move_on = Proc.new do
      case direction
      when 0
        square.empty_element?(row + 1, column) ? row += 1 : nil
      when 1
        square.empty_element?(row, column - 1) ? column -= 1 : nil
      when 2
        square.empty_element?(row - 1, column) ? row -= 1 : nil
      when 3
        square.empty_element?(row, column + 1) ? column += 1 : nil
      end
    end

    loop do
      square.send(:[]=, row, column, number)
      number += 1
      unless move_on.call
        change_direction.call
        break unless move_on.call
      end
    end

    square
  end
end
