Rails.application.routes.draw do

  get ':id', to: 'pages#show', as: :page
  resources :pages, except: :show
end
