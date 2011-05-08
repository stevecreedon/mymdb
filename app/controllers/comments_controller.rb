class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    film = Film.find(params[:film_id])
    comment = film.comments.create(:text => params[:add_comment_text], :user => current_user)
    if comment.valid?
      render :partial => 'comments/comment', :locals => {:comment => comment}
    else
      response.status = 422
      render :nothing => true
    end
    
  end 

end