Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    collection do # no id in the url
      get 'top', to: "restaurants#top" #RestaurantsController#top
    end
    member do # member => id in URL
      get 'chef', to: 'restaurants#chef'
    end

    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit]

  namespace :admin do
    resources :restaurants, only: [:index]
  end
end
