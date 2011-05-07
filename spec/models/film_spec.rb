require File.dirname(__FILE__) + '/../spec_helper'

describe Film do
  it "should be valid when we have a name, url and description" do
    film = Factory(:film, :name => 'test name', :url => 'http://test', :description => 'some test decsrpiption')
    film.valid?.should be_true
  end
  
  describe 'cleaning the URL' do
    
    it 'should remove any leading http:// from the url when it is saved' do
      film = Factory(:film, :url => 'http://some/test/url')
      film.save!
      film.url.should == 'some/test/url'
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
#

