Rails.application.routes.draw do
    get "top/login"
    post "top/login"
    root "top#main"
    resources :users
    resources :cooks
    get "ranks/index"
    get 'get_image/:id' , to: 'cooks#get_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
