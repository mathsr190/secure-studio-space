Rails.application.routes.draw do
  get 'studios/index'
  devise_for :managers
  root to: "studios#index"
end
