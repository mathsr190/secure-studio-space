Rails.application.routes.draw do
  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  get 'studios/index'
  root to: "studios#index"
end
