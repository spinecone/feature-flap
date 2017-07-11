Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Flipper::UI.app(->() { Flipper::Rails.flipper }) => '/flipper'
end
