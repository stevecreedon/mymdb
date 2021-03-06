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
      
      lambda do
        genre.destroy
      end.should change(Film, :count).by(-2)
      
      Film.exists?(film1.id).should be_false
      Film.exists?(film2.id).should be_false
      
    end
  
  end
  
end

# == Schema Information
#
# Table name: genres
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

