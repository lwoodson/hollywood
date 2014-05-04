require 'minitest/autorun'
require 'minitest/spec'
require 'pry-byebug'

$: << 'lib'
$: << 'spec'

require 'dummy/config/application'
Rails.env = ENV['RAILS_ENV'] || 'test'
require 'dummy/config/environment'

Dir.glob("app/{models,views,controllers}/**/*.rb").each do |path|
  load path
end
