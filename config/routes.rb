Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  resources :portfolios

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
