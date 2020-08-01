class StaticPagesController < ApplicationController
  def home
    @categories = Category.select_category
  end
end
