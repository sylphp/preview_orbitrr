Rails.application.routes.draw do
  resources :submissions
  resources :missions
  root 'landingpage#index', as: 'landingpage_index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
