Factory.define :film do |film|
  film.name 'RSpec - The Movie'
  film.url 'http://some/test/url/rspec-the-movie'
  film.description "this is a very exciting film about unit testing"
  film.user_rating 0
end

Factory.define :genre do |genre|
  genre.name 'drama'
end
