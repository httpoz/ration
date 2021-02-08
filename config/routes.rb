Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  authenticated do
    root 'dashboard#index'
    resources :profile, only: [:index, :create]
  end

  resources :categories
  resources :budgets do
    resources :expenses
  end
end
