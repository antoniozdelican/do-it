DoIt::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index'
    end
    unauthenticated :user do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end


end
