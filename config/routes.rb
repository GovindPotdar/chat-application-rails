Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "sessions#new"

  post "sessions/authenticates", to: "sessions#create", as: "sessions_authentication"
  get "session/logout", to: "sessions#destroy", as: "session_destroy"

  resources :rooms do
    get "/personal", to: "rooms#create_personal", on: :collection,  as: "personal"
    get "/create/group", to: "rooms#create_group", on: :collection, as:"create_group"
    get "/join/group/:room_id",to:"rooms#join_group",on: :collection, as: "join_group"
  end

  get "searchs",to:"searches#index"

  resources :messages, only:[:create]


  mount ActionCable.server => '/cable'
end
