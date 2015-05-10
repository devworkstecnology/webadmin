WebAdmin::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, class_name: "WebAdmin::User", module: :devise
  root "main#index"

  resources :posts
  resources :institutionals
  resources :albums
  resources :videos
  resources :images
  resources :events
  resources :users
end
