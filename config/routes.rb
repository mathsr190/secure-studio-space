Rails.application.routes.draw do
  get 'studios/index'
  root to: "studios#index"
end
