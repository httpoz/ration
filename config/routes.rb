Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  unauthenticated do
    root 'static_pages#home'
  end

  authenticated do
    root 'dashboard#index'
    resources :budgets
    resources :categories
    resources :expenses, only: [:create, :destroy]
  end

end
