Rails.application.routes.draw do

  root to: "home#home"
  resources :bloopers
  resources :users, path: "user"
  resources :teams
  get "/team/become_administrator", to: "teams#become_admin", as: :become_team_admin
  post ":team", to: "slack_api#bloop"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
