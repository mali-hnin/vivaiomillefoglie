Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :plants do
    collection do    # collection => no restaurant id in URL
      get 'by_created', to: "plants#by_created"
      get 'by_updated', to: "plants#by_updated"
      get 'erbacee_perenni', to: "plants#erbacee_perenni"
      get 'erbacee_annuali', to: "plants#erbacee_annuali"
      get 'graminacee', to: "plants#graminacee"
      get 'categoria_altro', to: "plants#categoria_altro"
      get 'esposizione_sole', to: "plants#esposizione_sole"
      get 'esposizione_ombra', to: "plants#esposizione_ombra"
      get 'fioritura_primavera', to: "plants#fioritura_primavera"
      get 'fioritura_estate', to: "plants#fioritura_estate"
      get 'fioritura_autunno', to: "plants#fioritura_autunno"
      get 'fioritura_inverno', to: "plants#fioritura_inverno"
      get 'altezza_bassa', to: "plants#altezza_bassa"
      get 'altezza_alta', to: "plants#altezza_alta"
      get 'altezza_media', to: "plants#altezza_media"
      get 'fogliame_ornamentale', to: "plants#fogliame_ornamentale"
      get 'da_taglio', to: "plants#da_taglio"
      get 'coprisuolo', to: "plants#coprisuolo"
      get 'azotofissatrici', to: "plants#azotofissatrici"
      get 'insetti_e_uccelli', to: "plants#insetti_e_uccelli"
      get 'da_secco', to: "plants#da_secco"
      get 'spontanee', to: "plants#spontanee"
      get 'export', to: "plants#export"
    end
  end
  resources :line_items
  resources :carts do
    resources :orders, only: [:new, :create]
  end

  resources :vivaio_events, path: 'eventi'

  resources :gardens, path: 'giardini', except: [:show]

  # scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
  #  resources :categories, path: 'kategorien'
  # end
  
  get "/catalogo", to: "pages#catalogo_intro"
  get "/orto-dei-fiori", to: "pages#flowerslab", as: :ortodeifiori
  get "/contatti", to: "pages#contatti", as: :contatti
  get "/bonus-verde", to: "pages#bonusverde", as: :bonusverde
  get "/come-acquistare", to: "pages#comeacquistare", as: :acquistare
  get "/abbonamento", to: "pages#abbonamento"
  get "/condizionivendita", to: "pages#condizionivendita"
  get "/admin_catalogo", to: "plants#admin_catalogo"

  mount Attachinary::Engine => "/attachinary"
end
