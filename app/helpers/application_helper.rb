module ApplicationHelper
  def category_name
    Category.pluck :name, :id
  end

  def list_film category_id
    @films = Film.where(category_id: category_id).limit Settings.limmit_films_home
  end

  def list_comment film_id
    @comments = Comment.list_comment(film_id).order_comment
  end
end
