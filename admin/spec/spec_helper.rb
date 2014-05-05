require 'minitest/autorun'
require 'minitest/spec'
require 'pry-byebug'
require 'database_cleaner'

$: << 'lib'
$: << 'spec'


require 'dummy/config/application'
Rails.env = ENV['RAILS_ENV'] || 'test'
require 'dummy/config/environment'

Dir.glob("app/{models,views,controllers}/**/*.rb").each do |path|
  load path
end

DatabaseCleaner.strategy = :transaction

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
