Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/sign_in'
  get 'pages/account'
  root 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :users do
    get '/sign_in' => 'omniauth_callbacks#sign_in'
  end
end
