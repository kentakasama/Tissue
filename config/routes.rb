Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :items
  resources :users, :only => [:index, :show, :edit, :update, :destroy]
  post "selects" => "select#create"
  get "selects/:id" => "select#show"
  get "selects" => "select#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
