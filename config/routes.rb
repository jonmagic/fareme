Fareme::Application.routes.draw do
  match 'api/search' => 'search#index'
  root :to => 'home#index'
end
