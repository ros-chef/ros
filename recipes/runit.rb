include_recipe "runit"

user = node[:ros][:user]
ros_distro = "indigo"

directory "/home/#{user}/.ros" do
  owner user
  group user
  action :create
end

directory "/home/#{user}/.ros/service" do
  owner user
  group user
  action :create
end

runit_service "runsvdir-ros-#{user}" do
  run_template_name "runsvdir-ros-user"
  log_template_name "runsvdir-ros-user"
  options({user: user})
end

ros_sv "roscore" do
  user user
  setup_bash "/opt/ros/#{ros_distro}/setup.bash"
  launch "--core"
end
