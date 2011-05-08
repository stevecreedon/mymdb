require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsController do
  
  
  
  it 'should find the film, create the comment and return a partial for that comment' do
    user = Factory(:user)
    sign_in :user, user
      
    film = Factory(:film)
    
    post :create, :film_id => film.id, :add_comment_text => 'test comment'
    
    film.comments.size.should == 1
    film.comments.first.text.should == 'test comment'
    film.comments.first.user.should == user
    response.should render_template('comments/_comment')
  end
  
  it 'should do nothing if the comment text is empty' do
    user = Factory(:user)
    sign_in :user, user
      
    film = Factory(:film)
    
    post :create, :film_id => film.id, :add_comment_text => '    '
    
    film.comments.size.should == 0
    response.status.should == 422
  end
  
  it 'should destroy the comment and redirect back to the film' do
    
    user = Factory(:user)
    sign_in :user, user
    
    film = Factory(:film)
    
    Comment.expects(:destroy).with('123')
    
    delete :destroy, :film_id => film.id, :id => '123'
    
    response.should redirect_to film_path(film.id)
  end
  
end