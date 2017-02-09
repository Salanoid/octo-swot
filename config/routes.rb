Rails.application.routes.draw do
  resources :swot_tables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "swot_tables#index", :as => "root"
end
