class Robot
  TABLE_WIDTH = 5
  TABLE_HEIGHT = 5

  def initialize
    @x_pos = -1
    @y_pos = -1
    @facing = nil
    @placed = false
    @directions = %w(NORTH WEST SOUTH EAST)
    @directions_literal_to_index = @directions.each_with_index
                                              .map { |v, i| [v, i] }.to_h
  end

  def place(x_pos, y_pos, facing)
    return unless x_pos >= 0 && x_pos <= TABLE_WIDTH &&
                  y_pos >= 0 && y_pos <= TABLE_HEIGHT
    @x_pos = x_pos
    @y_pos = y_pos
    @facing = @directions_literal_to_index[facing.upcase]
    @placed = true
  end

  def left
    return false unless @placed
    if @facing >= @directions.length-1
      @facing = 0
    else
      @facing += 1
    end
  end

  def right
    return false unless @placed
    if @facing <= 0
      @facing = @directions.length-1
    else
      @facing -= 1
    end
  end

  def move
    return false unless @placed
    case facing_literal
    when 'NORTH'
      @y_pos += 1 unless @y_pos >= TABLE_HEIGHT
    when 'WEST'
      @x_pos -= 1 unless @x_pos < 1
    when 'SOUTH'
      @y_pos -= 1 unless @y_pos < 1
    when 'EAST'
      @x_pos += 1 unless @x_pos >= TABLE_WIDTH
    end
  end

  def report
    return false unless @placed
    [@x_pos, @y_pos, facing_literal]
  end

  private

  def facing_literal
    @directions[@facing] rescue nil
  end
end
