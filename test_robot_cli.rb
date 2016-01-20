require 'minitest/autorun'
require './robot'
require './robot_cli'

class TestRobotCli < Minitest::Test
  def setup
    @robot = Robot.new
    @robot_cli = RobotCli.new @robot
  end

  def test_robot_placing
    @robot_cli.execute_command 'place 0 0 NORTH'
    assert_equal [0, 0, 'NORTH'], @robot.report
  end

  def test_robot_move
    @robot_cli.execute_command 'place 0 0 NORTH'
    @robot_cli.execute_command 'move'
    assert_equal [0, 1, 'NORTH'], @robot.report
  end

  def test_robot_right
    @robot_cli.execute_command 'place 0 0 NORTH'
    @robot_cli.execute_command 'right'
    assert_equal [0, 0, 'EAST'], @robot.report
  end

  def test_robot_left
    @robot_cli.execute_command 'place 0 0 NORTH'
    @robot_cli.execute_command 'left'
    assert_equal [0, 0, 'WEST'], @robot.report
  end

  def test_bad_command
    resp = @robot_cli.execute_command 'bad_place 0 0 NORTH'
    assert_equal 'command not recognized', resp
  end
end
