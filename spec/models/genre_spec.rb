require File.dirname(__FILE__) + '/../spec_helper'

describe Genre do
  it "should not be valid when we do not have a name" do
    g = Genre.new
    g.valid?.should be_false
    g.errors.should == {:name=>["can't be blank"]}
  end
  
  describe 'destroying' do
  
    it 'should destroy all the child films on destruction' do
      genre = Genre.create!(:name => 'horror')
      film1 = genre.films.create!(:name => 'f1', :url => 'http://f1', :user_rating => 4, :description => 'f1 is')
      film2 = genre.films.create!(:name => 'f1', :url => 'http://f1', :user_rating => 4, :description => 'f1 is')
    end
  
  end
  
end
