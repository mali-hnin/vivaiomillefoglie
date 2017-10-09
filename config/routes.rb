Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :plants
  get "/catalogo", to: "pages#catalogo"

  mount Attachinary::Engine => "/attachinary"
end
