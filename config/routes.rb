Rails.application.routes.draw do
  # root to: "posts#index"
  root "pages#index"
  # resources :comments, except: %i[ create destroy]
  resources :posts, only: %i[ new create show ] do
    resources :comments, shallow: true, only: %i[ create destroy]
  end
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
