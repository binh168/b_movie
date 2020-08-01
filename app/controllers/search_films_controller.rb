class SearchFilmsController < ApplicationController
  def index
    @films = params[:search] ? Film.search_film(params[:search]) : Film
    @films =  @films.page(params[:page]).per Settings.search_films
  end
end
