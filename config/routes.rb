Rails.application.routes.draw do
    get "top/login"
    post "top/login"
    get "top/logout"
    root "top#main"
    resources :users
    resources :cooks do 
        collection do 
            get 'search'
        end 
    end 
    get "ranks/index"
    get 'get_image/:id' , to: 'cooks#get_image'

    resources :likes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
