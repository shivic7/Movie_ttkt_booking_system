Rails.application.routes.draw do
  devise_for :admins
  root to: 'home_page#index'
  get "/admin"=>'admin#index', as: :authenticated_root
  match "/add-movie" => 'movie#add_movie', via: [:get, :post]
  get "view-movie/:movie_id"=>'movie#view_movie'
  get "edit-movie/:movie_id"=>'movie#edit_movie'
  get "delete-movie/:movie_id"=>'movie#delete_movie'
  post "/download-movie-report" => "movie#download_movie_report"
  get "book-ticket/:movie_id"=>'movie#book_ticket'
  post "/calculate-amount" => 'movie#calculate_amount'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
