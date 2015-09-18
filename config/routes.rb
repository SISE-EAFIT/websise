Rails.application.routes.draw do
  root 'main#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get ':id', to: 'pages#show', as: :page
  resources :pages, except: :show
end
