require 'minitest/autorun'
require 'minitest/spec'
require 'pry-byebug'

# TODO This is all sort of boilerplate code that needs to be duplicated for
# every rails engine.  This is an opportunity for automation/ease of use
$: << 'lib'
$: << 'spec'

require "dummy/config/application"
require "dummy/config/environment"
Rails.env = 'test'

Dir.glob("app/{models,views,controllers}/**/*.rb").each do |path|
  load path
end
