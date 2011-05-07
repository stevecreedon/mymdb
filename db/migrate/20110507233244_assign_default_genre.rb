class AssignDefaultGenre < ActiveRecord::Migration
  def self.up
    genre = Genre.create!(:name => "other")
    Film.all.each do |film|
      genre.films << film #note the association is always saved immediately
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
