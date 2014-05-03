require_dependency "admin/application_controller"

module Admin
  class DashboardController < ApplicationController
    def index
      @movie_count = Core::Movie.count
      @actor_count = Core::Actor.count
      @casting_count = Core::Casting.count
    end
  end
end
