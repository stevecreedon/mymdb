class PopulateRatingForExistingFilms < ActiveRecord::Migration
  def self.up
    Film.all.each do |film|
      film.update_attribute(:user_rating, 0)
    end
  end

  def self.down
    #not much to do here...
  end
end
