Rails.application.routes.draw do


  devise_for :users

  get 'search/search_by'

  get 'search/cuisine'

  get 'search/rating'

  get 'search/price'

  get 'search/location'

  # Set landing page
  root 'landing_page#index'

  get 'landing_page/login'

  get 'landing_page/signup'

  get 'users/sign_in'

  get 'users/sign_up'

  get 'search/new_search'

  get 'serch/search_all'

  resources :profiles
  # resources :reviews
  #root 'reviews#index'
  resources :reviews do
    member do
      get 'map_location'
    end
  end
end
