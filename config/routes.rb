Rails.application.routes.draw do
    root 'messages#new'
    get 'home' => 'messages#index'

    resources :messages, only: [:index, :new, :create, :show, :update, :destroy]
    
    get '/about' => 'messages#about'
    get '/messages/:id/:token' => 'messages#show'
    get '/home/:id/:token' => 'messages#show'
    get '/messages/:id/:token/auth' => 'messages#auth'
    get '/home/:id/:token/auth' => 'messages#auth'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
