Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :items
  post "selects" => "select#create"
  get "selects" => "select#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
