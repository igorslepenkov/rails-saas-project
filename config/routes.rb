Rails.application.routes.draw do
  devise_for :organizations, controllers: {
    sessions: 'organizations/sessions',
    registrations: 'organizations/registrations'
  }
  devise_for :users, controllers: {
    invitations: 'users/invitations',
    sessions: 'users/sessions'
  }

  root 'pages#home'
  
  get 'pages/about', to: 'pages#about'
  get 'pages/plans', to: 'pages#plans'
  get 'pages/dashboard', to: 'pages#dashboard'
  get 'upgrade_plan', to: 'pages#edit_plan'
  patch 'upgrade_plan', to: 'pages#upgrade_plan'
  put 'upgrade_plan', to: 'pages#upgrade_plan'

  post 'payments/create-intent', to: 'payments#create_intent'

  post 'validations/organization', to: 'validations#organization_valid?'

  # post 'projects/withdraw_user', to: 'projects#withdraw_user'
  # post 'projects/assign_user', to: 'projects#assign_user'
  resources :projects do
    get '/manage', to: 'projects#manage_team'
    post '/withdraw_user', to: 'projects#withdraw_user'
    post '/assign_user', to: 'projects#assign_user'
  end

  resources :artifacts
end
