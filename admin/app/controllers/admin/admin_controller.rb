require_dependency "admin/application_controller"

module Admin
  class AdminController < ApplicationController
    def index
      require 'pry'; binding.pry
    end
  end
end
