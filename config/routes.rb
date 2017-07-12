require 'admin_authenticated_constraint'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  flipper_app = Flipper::UI.app(->() { Flipper::Rails.flipper }, {
    secret: ENV['SECRET_TOKEN']
  })
  mount flipper_app => "/admin/flipper",
    constraints: AdminAuthenticatedConstraint.new

  root to: 'users#index'

  get '/logout'                  => 'sessions#logout',  :as => "logout"
  get '/auth/githubber/callback' => 'sessions#create',  :as => "oauth_callback"
end
