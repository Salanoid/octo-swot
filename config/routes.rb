Rails.application.routes.draw do
  devise_for :users
  resources :swot_tables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'swot_tables#index'
end
