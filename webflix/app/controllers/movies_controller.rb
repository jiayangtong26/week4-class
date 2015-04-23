class MoviesController < ApplicationController

  def secret
    redirect_to "http://www.apple.com"
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by(:id => params["id"])

    if @movie != nil
      render "show"
    else
      redirect_to "/", notice: "Movie not found."
    end
  end

end
