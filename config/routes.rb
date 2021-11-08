Rails.application.routes.draw do
    get "top/login"
    post "top/login"
    root "top#main"
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
