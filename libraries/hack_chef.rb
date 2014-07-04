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
