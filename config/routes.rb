AdminWeb::Engine.routes.draw do
  devise_for :users, class_name: "AdminWeb::User", module: :devise
  root "main#index"
end
