Rails.application.routes.draw do
  devise_for :users

  # Redireciona usuários autenticados para posts#index
  authenticated :user do
    root to: "posts#index", as: :authenticated_root
  end

  # Redireciona visitantes não autenticados para home#index
  unauthenticated do
    root to: "home#index"
  end

  # CRUD routes for posts
  resources :posts
  get "my_posts", to: "posts#my_posts"
end
