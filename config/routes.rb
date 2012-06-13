Todo::Application.routes.draw do
  root :to => 'todos#new'
  resources :todos
end
