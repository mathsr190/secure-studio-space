Rails.application.routes.draw do
  get 'managers/show'
  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  get 'studios/index'
  root to: "studios#index"
  resources :managers, only: :show
  resources :studios, only: [:index, :show, :new, :create, :edit, :update] do
    resources :spaces, only: [:index, :show, :new, :create, :edit, :update]
  end
end
