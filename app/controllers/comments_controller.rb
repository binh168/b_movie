class CommentsController < ApplicationController
  before_action :load_film , only: :create
  before_action :authenticate_user!, only: :create

  def create
    @comment = current_user.user_comment.new comment_params

    if @comment.save
      respond_to :js
    else
      flash[:danger] = t ".danger_comment"
      redirect_to request.referrer || root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end

  def load_film
    @film = Film.find_by params[:film_id]

    return if @film
    flash[:danger] = t ".not_found_film" 
    redirect_to root_path
  end
end
