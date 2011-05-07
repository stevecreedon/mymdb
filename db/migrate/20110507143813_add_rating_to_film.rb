class AddRatingToFilm < ActiveRecord::Migration
  def self.up
    add_column :films, :user_rating, :integer
  end

  def self.down
    remove_column :films, :user_rating
  end
end