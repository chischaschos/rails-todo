Todo::Application.routes.draw do
  devise_for :users

  root :to => 'todos#index'
  resources :todos do
    collection do
      get 'search'
    end
  end
end
