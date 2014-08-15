Rails.application.routes.draw do

  root 'users#index'

  resources :events do
    resources :invitations, only: [:create, :new]
  end

  post 'users/login' => 'users#login', as: 'login'
  get 'users/logout' => 'users#logout', as: 'logout'

  post 'users/follow' => 'users#follow', as: 'follow'
  post 'users/unfollow' => 'users#unfollow', as: 'unfollow'

  get 'users/:id/events_attending' => 'users#events_attending', as: "user_events_attending"
  get 'users/:id/created' => 'users#created', as: "user_events_created"

  get 'users/:id/following' => 'users#following', as: "user_following"
  get 'users/:id/followers' => 'users#followers', as: "user_followers"


  get 'events/:id/friends_attending' => 'events#friends_attending', as: "events_friends_attending"

  resources :users
end
