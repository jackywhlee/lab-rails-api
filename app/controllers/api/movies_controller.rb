module API
  class MoviesController < ApplicationController
  protect_from_forgery with: :null_session
    def index
      render json: Movie.all
    end

    def show
      render json: Movie.find(params[:id])
    end

    def create
      movie =  Movie.new(movie_params)
      if movie.save
        render json: movie, status: 201, location: [:api, movie]
      else
        render json: movie.errors, status: 403, location: [:api, movie]
      end
    end

    def update
      movie = Movie.find(params[:id])
      if movie.update(movie_params)
        render json: movie, status: 200
      else
        render json: movie.errors, status: 403
      end
    end

    def destroy
      movie = Movie.find(params[:id])
      movie.destroy
      head 204
    end

    private
    def movie_params
      params.permit(:title, :summary, :youtube_embed_id, :thumbnail)
    end
  end
end

