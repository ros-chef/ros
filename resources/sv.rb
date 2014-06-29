actions :enable, :start, :stop
default_action [:enable, :start]

attribute :user, :kind_of => String
attribute :setup_bash, :kind_of => String
attribute :launch, :kind_of => String
attribute :command, :kind_of => String, :default => nil
