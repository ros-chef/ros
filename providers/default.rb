def whyrun_supported?
  true
end

## BEGIN HACK
#
# Until chef '11.14.0.rc.1' is out, we need this:
# https://github.com/opscode/chef/commit/e9cfad2fd5c2c659e51fa7ef07906e1a80af7236#diff-956770fc4d43ca694d0f01b5414811ce
#

class Chef
  class Provider
    class Package
      class Apt
        def shell_out!( cmd, opts={} )
          super(cmd, opts.merge(:timeout => 3600))
        end
      end
    end
  end
end

## END HACK
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
