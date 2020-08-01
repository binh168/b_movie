Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  resources :films, only: :index
  resources :search_films, only: :index
  resources :films, only: %i(index show)
  resources :ratings, only: %i(new create)
  resources :comments, only: %i(create)
  resources :reply_comments, only: %i(create)

  namespace :admins do
    resources :users
    resources :categories, except: :show
    resources :films
  end
end
