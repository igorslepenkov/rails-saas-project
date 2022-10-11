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

  resources :projects
  resources :artifacts

  post 'payments/create-intent', to: 'payments#create_intent'

  post 'validations/organization', to: 'validations#organization_valid?'
end
