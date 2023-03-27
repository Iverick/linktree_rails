Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  post 'links', to: 'links#create', as: :create_link
  patch 'links/:id' => 'links#update', as: :update_link
  delete 'links/:id', to: 'links#destroy', as: :destroy_link

  get 'dashboard', to: 'dashboard#index'
  get 'appearance', to: 'dashboard#appearance'
  root 'dashboard#index'

  get ':id', to: 'dashboard#show', as: :user
end
