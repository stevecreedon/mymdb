Factory.define :film do |film|
  film.name 'RSpec - The Movie'
  film.url 'http://some/test/url/rspec-the-movie'
  film.description "this is a very exciting film about unit testing"
  film.user_rating 0
end

Factory.define :genre do |genre|
  genre.name 'drama'
end

Factory.define :user do |user|
  user.email 'tester@testerxyz.co.uk'
  user.password 'xyzabc'
end

Factory.define :admin do |user|
  user.email 'admintester@testerxyz.co.uk'
  user.password 'xyzabc'
end
