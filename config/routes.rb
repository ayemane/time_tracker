Rails.application.routes.draw do
  resources :works
  resources :checkins, only: [:create, :update]
  root 'works#index'
end
