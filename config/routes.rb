Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :clothes do
  	resources :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
   get 'top' => 'user#top'
  root 'clothes#index'
end


