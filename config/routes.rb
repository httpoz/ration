Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  unauthenticated do
    root 'static_pages#home'
  end

  authenticated do
    root 'dashboard#index'
  end
  
  resources :budgets
  
  resources :expenses, only: [:create, :destroy]
  
end
