Rails.application.routes.draw do
  devise_for :organizations
  devise_for :users
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  get 'pages/plans', to: 'pages#plans'
  get 'pages/dashboard', to: 'pages#dashboard'
end
