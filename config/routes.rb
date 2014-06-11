DoIt::Application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' }

  devise_scope :user do
    authenticated :user do
      root 'home#index'
    end
    unauthenticated :user do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :categories do
    resources :items
  end
end
