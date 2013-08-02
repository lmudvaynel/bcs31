Cite::Application.routes.draw do

  mount_roboto

  root :to => "pages#show"

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :feedbacks, :only => :create

  resources :online_couriers, :only => :create
  get 'online_couriers' => 'online_couriers#new'
  get 'thanks' => 'online_couriers#thanks', :as => :thanks

  resources :workers , :only  => :create
  get 'about' => 'workers#index'

  resources :reviews, :only => [:index, :create]
  resources :news_pages
  get 'index' => 'pages#index'
  get 'news_pages/:id' => 'news_pages#show'
  get 'reviews' => 'reviews#index'
  get ':slug' => 'pages#show', :as => :slug
  resources :pages
end