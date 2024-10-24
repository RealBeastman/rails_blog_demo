Rails.application.routes.draw do
  get 'users/profile'

  # Resources for devise
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # Resources for single user
  get "/u/:id", to: "users#profile", as: "user"

  # Resources for posts
  resources :posts do
    # Resources for comments - /post/:id/comments/:id
    resources :comments
  end

  # Resources for pages
  get 'about', to: 'pages#about'

  # Root path, localhost:3000
  root "pages#home"
end
