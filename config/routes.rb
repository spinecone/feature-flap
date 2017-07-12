Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Flipper::UI.app(->() { Flipper::Rails.flipper }) => '/flipper'

  root to: 'users#index'

  get '/logout'                  => 'sessions#logout',  :as => "logout"
  get '/auth/githubber/callback' => 'sessions#create',  :as => "oauth_callback"
end
