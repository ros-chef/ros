def whyrun_supported?
  true
end

action :install do
  converge_by("Install ROS") do
    `touch /tmp/ROS`
  end
end
