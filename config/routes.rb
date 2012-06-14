Todo::Application.routes.draw do
  root :to => 'todos#index'
  resources :todos do
    collection do
      get 'search'
    end
  end
end
