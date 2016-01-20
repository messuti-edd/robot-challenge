require './robot'
require './robot_cli'

robot = Robot.new
robot_cli = RobotCli.new robot

while (inp = gets.chomp.downcase) != '\q' do
  puts robot_cli.execute_command inp
end
