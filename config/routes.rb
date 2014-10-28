AdminWeb::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, class_name: "AdminWeb::User", module: :devise
  root "main#index"

  resources :posts
  resources :institutionals
end
