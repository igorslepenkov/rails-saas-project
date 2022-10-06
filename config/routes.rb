Rails.application.routes.draw do
  devise_for :organizations
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/plans', to: 'pages#plans'
  get 'pages/dashboard', to: 'pages#dashboard'
end
