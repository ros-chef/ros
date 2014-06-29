# ros cookbook

Basic ROS installation via chef.

# Runit

ROS launch files can be managed under runit. The runit recipe
configures runsvdir to run services from ~/.ros/sv.  Services should
be configured within ~/.ros/sv and symlinked to ~/.ros/service.

The user under which ROS will run should be set in
node[:ros][:user]. Override it unless you're using vagrant.
