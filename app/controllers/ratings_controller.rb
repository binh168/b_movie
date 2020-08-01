class RatingsController < ApplicationController
  before_action :load_film, only: :create
  before_action :logged_in_user, only: :create

  def create
    @rating = @film.ratings.build star:params[:star], user_id: current_user.id

    if @rating.save
      flash[:success] =  t ".successful"
      respond_to :js
    else
      flash[:danger] =  t ".fail"
      redirect_to request.referrer
    end
  end

  private

  def load_film
    @film = Film.find_by id: params[:film_id]

    return if @film
    flash[:danger] = t ".not_found"
    redirect_to root_url
  end

  def logged_in_user
    return if user_signed_in?
    flash[:danger] = t ".loggin"
    redirect_to new_user_session_path
  end
end
