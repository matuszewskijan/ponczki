Rails.application.routes.draw do

  root to: "home#home"
  resources :bloopers
  resources :users, path: "user"
  resources :teams, except: :edit, param: :name
  get "/team/become_administrator/:name", to: "teams#become_admin", as: :become_team_admin
  get "/team/details/:name", to: "teams#edit", as: :edit_team
  get "/team/setup/:name", to: "teams#setup", as: :page_setup
  get "/team/tutorial/:name", to: "teams#tutorial", as: :team_setup_tutorial
  post ":team", to: "slack_api#bloop"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
