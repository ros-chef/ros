include_recipe "runit"

user = node[:ros][:user]
ros_distro = 'indigo'

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

runit_service "ros-core-#{user}" do
  run_template_name "roslaunch"
  log_template_name "roslaunch"

  options({ user: user,
            init_sh: "/opt/ros/#{ros_distro}/setup.bash",
            launch_options: '--core'
          })

  sv_dir "/home/#{user}/.ros/sv"
  service_dir "/home/#{user}/.ros/service"
  owner user
  group user

  action [:enable, :start]
end
