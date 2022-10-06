Rails.application.routes.draw do
  devise_for :organizations, controllers: {
    sessions: 'organizations/sessions'
  }
  devise_for :users, controllers: {
    invitations: 'users/invitations',
    sessions: 'users/sessions'
  }
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/plans', to: 'pages#plans'
  get 'pages/dashboard', to: 'pages#dashboard'
end
