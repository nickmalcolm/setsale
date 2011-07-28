Setsale::Application.routes.draw do
  
  resources :sales

  root :to                   => 'home#index'
  
  match 'home'                => 'home#index'

  match 'login'              => 'login#index'

  match 'login/authenticate' => 'login#authenticate'

  match 'login/finalize'     => 'login#finalize'

  match 'login/logout'       => 'login#logout'

  mount Resque::Server.new, :at => "/resque"
end
