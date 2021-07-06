Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end


  # resources :tweets, only: [:index,:new,:create,:destroy,:edit,:update,:show]
  # GET          /tweets(.:format)                   tweets#index
# POST         /tweets(.:format)                   tweets#create
# GET          /tweets/new(.:format)               tweets#new
# GET          /tweets/:id/edit(.:format)          tweets#edit
# GET          /tweets/:id(.:format)               tweets#show
# PATCH        /tweets/:id(.:format)               tweets#update
# PUT          /tweets/:id(.:format)               tweets#update
# DELETE       /tweets/:id(.:format)               tweets#destroy
resources :users, only: :show

end
