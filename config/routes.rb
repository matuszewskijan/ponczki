Rails.application.routes.draw do

  root to: "home#home"
  resources :bloopers do
    member do
      get :mark_as_delivered
    end
  end
  resources :users, path: "user", param: :name
  resources :teams, except: :edit, param: :name do
    member do
      get :manage
    end
  end
  get "/team/become_administrator/:name", to: "teams#become_admin", as: :become_team_admin
  get "/team/details/:name", to: "teams#edit", as: :edit_team
  get "/team/setup/:name", to: "teams#setup", as: :page_setup
  get "/team/tutorial/:name", to: "teams#tutorial", as: :team_setup_tutorial
  post "/api/listen", to: "slack_api#listen"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
