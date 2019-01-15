Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :plants do
    collection do    # collection => no restaurant id in URL
      get 'by_created', to: "plants#by_created"
      get 'by_updated', to: "plants#by_updated"
    end
  end

  get "/catalogo", to: "pages#catalogo"
  get "/giardini", to: "pages#giardini"
  get "/millefoglie-flowers-lab", to: "pages#flowerslab", as: :flowerslab
  get "/contatti", to: "pages#contatti", as: :contatti

  mount Attachinary::Engine => "/attachinary"
end
