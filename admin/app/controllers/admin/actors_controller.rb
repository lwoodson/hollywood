require_dependency "admin/application_controller"

module Admin
  class ActorsController < ApplicationController
    before_filter :lookup_actor, only: [:edit, :update, :destroy]

    def index
      @actors = Core::Actor.all
    end

    def new
      @actor = Core::Actor.new
    end

    def create
      @actor = Core::Actor.new(actor_params)
      if @actor.save
        redirect_to action: :index
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @actor.update(actor_params)
        redirect_to action: :index
      else
        render :edit
      end
    end

    def destroy
      @actor.destroy!
      redirect_to action: :index
    end

    private
      def actor_params
        params.require(:actor).permit(:first_name, :last_name)
      end

      def lookup_actor
        @actor = Core::Actor.find(params[:id])
      end
  end
end
