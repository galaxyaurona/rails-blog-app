Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"


  get "about" =>'pages#about'

  get "contact"=> 'pages#contact'

  resources :blogs do
    member do
      post :toggle_status  
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # set root route
  root to: "pages#home"
end
