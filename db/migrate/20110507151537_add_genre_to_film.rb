class AddGenreToFilm < ActiveRecord::Migration
  def self.up
    add_column :films, :gener_id, :integer
  end

  def self.down
    remove_column :films, :gener_id
  end
end