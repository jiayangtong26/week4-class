class Movie < ActiveRecord::Base

  attr_accessor :rated
  attr_accessor :runtime
  attr_accessor :director
  attr_accessor :plot
  attr_accessor :poster_url

end
