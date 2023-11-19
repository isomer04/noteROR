Rails.application.routes.draw do
  resources :wiki_posts
  namespace :wiki_posts do
    get 'example'

  end
  namespace :wekcome do
    get 'index'
    get 'about'

  end
  get 'wiki_posts/example'
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get 'welcome/about'
  get '/about', to: redirect('/welcome/about')
  root "welcome#index"
end
