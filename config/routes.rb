Rails.application.routes.draw do
  # Resources for posts
  resources :posts

  # Resources for pages
  get 'about', to: 'pages#about'

  # Root path, localhost:3000
  root "pages#home"
end
