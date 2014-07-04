def whyrun_supported?
  true
end

action :install do
  converge_by("Add ROS apt repo") do
    apt_repository "ros-#{@new_resource.release}" do
      uri "http://packages.ros.org/ros/ubuntu"
      distribution node['lsb']['codename']
      components ['main']
      key "https://raw.githubusercontent.com/ros/rosdistro/master/ros.key"
    end
  end

  converge_by("Install ROS") do
    simple_flavors = %w(ros-base desktop desktop-full)
    if simple_flavors.include? @new_resource.flavor
      package_name = "ros-#{@new_resource.release}-#{@new_resource.flavor}"
      apt_package package_name do
        action :install
      end
    end
    `touch /tmp/ROS`
  end
end
