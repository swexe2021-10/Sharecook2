Rails.application.routes.draw do
    get "top/login"
    post "top/login"
    root "top#main"
    resources :users
    resources :cooks
    get 'get_image/:id' , to: 'cooks#get_image'
     resources :likes
  root 'cooks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
