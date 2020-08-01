class Admins::FilmsController < Admins::BaseController
  before_action :load_film, only: %i(edit update destroy)

  def index
    @films = Film.create_at_desc
  end

  def new
    @film = Film.new
    @film_profile = @film.build_film_profile
  end

  def create
    @film = Film.new films_params

    if @film.save
      flash[:success] = t ".success"
      redirect_to admins_films_path
    else
      flash[:danger] =  t ".error"
      render :new
    end
  end

  def edit; end

  def update
    if @film.update update_film_params
      flash[:success] = t ".success"
      redirect_to admins_films_path
    else
      flash[:danger] = t ".danger"
      render :edit
    end
  end

  def destroy
    @film.destroy

    if @film.destroyed?
      flash[:success] = t ".success_destroy_film"
    else
      flash[:danger] = t ".danger_destroy_film"
    end
    redirect_to request.referrer
  end

  private

  def films_params
    params.require(:film).permit Film::FILM_PARAMS
  end

  def update_film_params
    params.require(:film).permit Film::FILM_PARAMS
  end

  def load_film
    @film = Film.find_by id: params[:id]

    return if @film
    flash[:danger] = t ".not_found_film"
    redirect_to root_path
  end
end
