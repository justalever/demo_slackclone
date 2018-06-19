require 'sidekiq/web'

Rails.application.routes.draw do
  resources :slackrooms do
    # singluar resource since it will only apply to the current user only and not other users.
    # In short, you can't add another user to a channel directly in this manner. It is possible but not like this.
    resource :slackroom_users
    resources :messages
  end

  devise_for :users


  root to: 'slackrooms#index'
end
