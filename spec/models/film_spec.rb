require File.dirname(__FILE__) + '/../spec_helper'

describe Film do
  
  describe 'validation' do
    
    it "should be valid when we have a name, url and description" do
      film = Factory(:film, :name => 'test name', 
                            :url => 'http://test', 
                            :description => 'some test decsrpiption', 
                            :user_rating => 0)
      film.valid?.should be_true
    end
    
    describe 'ratings' do
      
       it "should be valid when we have a rating between 0 and 5" do
          (0..5).each do |rating|
            film = Factory(:film, :user_rating => rating)
            film.valid?.should be_true
          end
        end

        it "should not be valid when we have a rating less than 0" do
          film = Factory.build(:film, :user_rating => -1)
          film.valid?.should be_false
          film.errors_on(:user_rating).should == ["must be greater than -1"]
        end
        
        it "should not be valid when we have a rating greater than 5" do
          film = Factory.build(:film, :user_rating => 6.0)
          film.valid?.should be_false
          film.errors_on(:user_rating).should == ["must be less than 6"]
        end
      
    end

  end
  
  describe 'cleaning the URL' do
    
    it 'should remove any leading http:// from the url when it is saved' do
      film = Factory(:film, :url => 'http://some/test/url')
      film.save!
      film.url.should == 'some/test/url'
    end
    
    it 'should not remove anything when there is no http:// in the url when it is saved' do
        film = Factory(:film, :url => 'a/some/test/url')
        film.save!
        film.url.should == 'a/some/test/url'
    end
    
    it 'should do nothing when the URL is nil' do
      film = Factory.build(:film, :url => nil) #we use Factory.build & .save otherwise validation will generate errors...
      film.save
      film.url.should be_nil
    end
    
  end
  
  
  
end



# == Schema Information
#
# Table name: films
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_rating :integer
#  gener_id    :integer
#

