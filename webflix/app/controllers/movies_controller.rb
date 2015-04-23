class MoviesController < ApplicationController

  def secret
    redirect_to "http://www.apple.com"
  end

  def index
    @movies = Movie.all
  end

  #  http://localhost:3000/movies/4
  #  Parameters: { "id" => "4" }
  def show
    @movie = Movie.find_by(:id => params["id"])

    if @movie != nil
      data = JSON.parse(open("http://www.omdbapi.com/?i=#{@movie[:omdb_key]}&plot=full&r=json").read)
      @movie.rated = data["Rated"]
      @movie.runtime = data["Runtime"]
      @movie.director = data["Director"]
      @movie.plot = data["Plot"]
      @movie.poster_url = data["Poster"]
      render "show"
    else
      redirect_to "/", notice: "Movie not found."
    end
  end

  # def all_movie_data
  #   return [
  #     {:id => 1, :title => "Apollo 13", :year => 1995, :omdb_key => 'tt0112384'},
  #     {:id => 2, :title => "Star Wars", :year => 1977, :omdb_key => 'tt0076759'},
  #     {:id => 3, :title => "Cast Away", :year => 2000, :omdb_key => 'tt0162222'},
  #     {:id => 4, :title => "Raiders of the Lost Ark", :year => 1981, :omdb_key => 'tt0082971'},
  #     {:id => 5, :title => "Toy Story", :year => 1995, :omdb_key => 'tt0114709'},
  #     {:id => 6, :title => "Jurassic Park", :year => 1993, :omdb_key => 'tt0107290'},
  #     {:id => 7, :title => "The Terminal", :year => 2004, :omdb_key => 'tt0362227'}
  #   ]
  # end

  # def all_director_data
  #   return [
  #     {:id => 1, :name => "Ron Howard" },
  #     {:id => 2, :name => "Steven Spielberg" },
  #     {:id => 3, :name => "George Lucas" },
  #     {:id => 4, :name => "Robert Zemeckis" },
  #     {:id => 5, :name => "John Lasseter" }
  #   ]
  # end

end
