require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "ROS" do
  it 'creates /tmp/ROS' do
    expect(File.exists?('/tmp/ROS')).to be_truthy
    # Uncomment to make it fail
    # expect(File.exists?('/tmp/ROS2')).to be_truthy
  end
end
