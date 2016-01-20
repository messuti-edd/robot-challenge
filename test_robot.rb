require 'minitest/autorun'
require './robot'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  # place

  def test_robot_placing
    @robot.place 0, 0, 'NORTH'
    assert_equal [0, 0, 'NORTH'], @robot.report
  end

  def test_robot_placing_table_constrains
    @robot.place 0, 6, 'NORTH'
    assert_equal false, @robot.report
  end

  # left

  def test_robot_left_turn
    @robot.place 0, 0, 'NORTH'

    @robot.left
    assert_equal [0,0, 'WEST'], @robot.report
    @robot.left
    assert_equal [0,0, 'SOUTH'], @robot.report
    @robot.left
    assert_equal [0,0, 'EAST'], @robot.report
    @robot.left
    assert_equal [0,0, 'NORTH'], @robot.report
  end

  # right

  def test_robot_right_turn
    @robot.place 0, 0, 'NORTH'

    @robot.right
    assert_equal [0,0, 'EAST'], @robot.report
    @robot.right
    assert_equal [0,0, 'SOUTH'], @robot.report
    @robot.right
    assert_equal [0,0, 'WEST'], @robot.report
    @robot.right
    assert_equal [0,0, 'NORTH'], @robot.report
  end

  # move

  def test_robot_move
    @robot.place 0, 0, 'NORTH'
    @robot.move
    assert_equal [0, 1, 'NORTH'], @robot.report
  end

  def test_robot_move_prevents_fall_north
    @robot.place 0, 5, 'NORTH'
    @robot.move
    assert_equal [0, 5, 'NORTH'], @robot.report
  end

  def test_robot_move_prevents_fall_west
    @robot.place 0, 0, 'WEST'
    @robot.move
    assert_equal [0, 0, 'WEST'], @robot.report
  end

  def test_robot_move_prevents_fall_wouth
    @robot.place 0, 0, 'SOUTH'
    @robot.move
    assert_equal [0, 0, 'SOUTH'], @robot.report
  end

  def test_robot_move_prevents_fall_east
    @robot.place 5, 0, 'EAST'
    @robot.move
    assert_equal [5, 0, 'EAST'], @robot.report
  end
end
