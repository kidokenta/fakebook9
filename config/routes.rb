Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'comments/create'
  get 'comments/destroy'
  root "posts#index"
  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :posts, only: [:index, :create, :destroy, :edit, :update, :show] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: [:index, :show, :edit, :destroy, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
