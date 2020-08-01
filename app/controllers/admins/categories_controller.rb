class Admins::CategoriesController < ApplicationController
  before_action :load_category, only: %i(edit update destroy)

  def index
    @categories = Category.create_at_desc.select_category.last Settings.limmit_category
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t ".success"
    else
      flash[:danger] =  t ".error"
    end
    redirect_to admins_categories_path
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to  admins_categories_path
    else
      flash[:danger] =  t".not_update"
      render :edit
    end
  end

  def destroy
    @category.destroy

    if @category.destroyed?
      flash[:success] = t ".delete_category"
    else
      flash[:danger] =  t".not_deleted"
    end
    redirect_to request.referrer
  end

  private

  def category_params
    params.require(:category).permit Category::CATEGORY_PARAMS
  end

  def load_category
    @category = Category.find_by id: params[:id]

    return if @category
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
