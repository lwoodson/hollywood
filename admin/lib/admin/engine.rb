require 'bootstrap-sass'
# HOWTQ To allow for haml to be used for layouts defined in the engine, we
# have to explicitly require it here in the engine
require 'haml'
require 'haml-rails'
require 'bootstrap-datepicker-rails'
require 'bootstrap_form'
require 'virtus'

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin
  end
end
