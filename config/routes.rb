Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  resource :my, only: %i(show)
  resources :books, only: [:create,:show,:index,:edit]
  resources :users, only: [:create,:show,:index,:edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
