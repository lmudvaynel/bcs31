Bcs31::Application.routes.draw do

  mount_roboto

  root :to => "pages#index"

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :feedbacks, :only => :create

  resources :workers , :only  => :create
  get 'about' => 'workers#index'

  resources :online_couriers, :only => :create
  get 'online_couriers' => 'online_couriers#new'
  get 'thanks' => 'online_couriers#thanks', :as => :thanks

  resources :reviews, :only => [:index, :create]
  resources :news_pages

  resources :invoices do
    post :search, on: :collection
  end

  get 'price_of_delivery' => 'pages#price_of_delivery'
  post 'price_of_delivery' => 'pages#price_of_delivery', constraints: {format: :json}

  get 'index' => 'pages#index'
  get 'news_pages/:id' => 'news_pages#show'
  get 'reviews' => 'reviews#index'
  get ':slug' => 'pages#show', :as => :slug

  resources :pages
end
