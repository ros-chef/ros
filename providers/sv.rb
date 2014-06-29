action :enable do
  user = @new_resource.user
  setup_bash = @new_resource.setup_bash
  launch = @new_resource.launch

  runit_service "roslaunch-#{user}-#{@new_resource.name}" do
    run_template_name "roslaunch"
    log_template_name "roslaunch"

    options({ user: user,
              setup_bash: setup_bash,
              launch_options: launch
            })

    sv_dir "/home/#{user}/.ros/sv"
    service_dir "/home/#{user}/.ros/service"
    owner user
    group user

    action :enable
  end
end

action :start do
  runit_service "roslaunch-#{@new_resource.user}-#{@new_resource.name}" do
    action :start
  end
end

action :stop do
  runit_service "roslaunch-#{@new_resource.user}-#{@new_resource.name}" do
    action :stop
  end
end
