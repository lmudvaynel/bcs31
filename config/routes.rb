Cite::Application.routes.draw do

  mount_roboto

  root :to => "pages#index"

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :feedbacks, :only => :create


  resources :reviews, :only => [:index, :create]
  resources :news_pages
  get 'index' => 'pages#index'
  get 'news_pages/:id' => 'news_pages#show'
  get 'reviews' => 'reviews#index'
  get ':slug' => 'pages#show', :as => :slug
  resources :pages
end
