Todo::Application.routes.draw do
  # root :to => 'welcome#index'
  match '/new' => 'todos#new'
end
