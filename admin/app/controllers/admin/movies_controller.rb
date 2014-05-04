require_dependency "admin/application_controller"

module Admin
  class MoviesController < ApplicationController
    before_filter :lookup_movie, only: [:show, :edit, :update, :destroy]

    def index
      @movies = Core::Movie.all
    end

    def new
      @movie = Core::Movie.new
    end

    def create
      @movie = Core::Movie.new(movie_params)
      if @movie.save
        redirect_to action: :index
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      @movie = Core::Movie.find(params[:id])

      if @movie.update(movie_params)
        redirect_to action: :index
      else
        render :edit
      end
    end

    def destroy
      @movie.destroy!
      redirect_to action: :index
    end

    private
      def movie_params
        params.require(:movie).permit(:title, :production_start, :production_finish, :premiere, :description)
      end

      def lookup_movie
        @movie = Core::Movie.find(params[:id])
      end
  end
end
