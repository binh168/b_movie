class FilmsController < ApplicationController
  before_action :find_category, only: :index

  def index
    @films = Film.create_at_desc.category_films params[:category]

    return if @films
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def show
    @film = Film.find_by id: params[:id]
    @rating = Rating.new

    return if @film
    flash[:danger] = t ".not_found"
    redirect_to root_url
  end

  private

  def find_category
    @category = Category.find_by id: params[:category]

    return if @category
    flash[:danger] = t ".not_found_category"
    redirect_to root_path
  end
end
