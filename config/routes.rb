Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :update, :index, :destroy] do
    resources :expenses, only: [:create]
  end

  resources :expenses, only: [:update, :show, :destroy]

  get 'users/:username', to: 'users#show'
  get 'users/:user_id/expenses', to: 'expenses#all'
  get '/expenses', to: 'expenses#index'

end
