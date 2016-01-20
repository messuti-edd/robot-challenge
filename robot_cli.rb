class RobotCli
  PLACE_ERROR = 'ERROR: robot not yet placed'

  def initialize robot
    @robot = robot
  end

  def execute_command command_str
    args = command_str.split(' ')
    if args[0] == 'place' && args.length == 4
      @robot.place args[1].to_i, args[2].to_i, args[3]
      'robot placed'
    elsif args[0] == 'report'
      resp = @robot.report
      resp ? @robot.report.join(' ') : PLACE_ERROR
    elsif args[0] == 'move'
      resp = @robot.move
      resp ? 'robot moved' : PLACE_ERROR
    elsif args[0] == 'right'
      resp = @robot.right
      resp ? 'robot turned right' : PLACE_ERROR
    elsif args[0] == 'left'
      resp = @robot.left
      resp ? 'robot turned left' : PLACE_ERROR
    else
      'command not recognized'
    end
  end
end
