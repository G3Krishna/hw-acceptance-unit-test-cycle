class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.get_similar_directors(director)
    @similar_directors = Movie.where(:director => director).pluck(:title)
    return @similar_directors
  end
end
