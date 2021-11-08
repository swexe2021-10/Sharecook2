Rails.application.routes.draw do
<<<<<<< HEAD
    get "top/login"
    post "top/login"
    root "top#main"
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  get'top/main'
  post'top/login'
  root'top#main'
>>>>>>> 11169b2f5baba950ffdc3f99855215ce70af4b49
end
