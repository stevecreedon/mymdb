require 'spec_helper'

describe Comment do
  
  it 'should not be valid' do
    comment = Comment.new
    comment.valid?.should be_false
    comment.errors.size.should == 3
    comment.errors_on(:film).should == ["can't be blank"]
    comment.errors_on(:user).should == ["can't be blank"]
    comment.errors_on(:text).should == ["can't be blank"]
  end
  
end
