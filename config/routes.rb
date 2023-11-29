Rails.application.routes.draw do
  devise_for :users
  resources :wiki_posts do
    collection do
      get 'deleted', to: 'wiki_posts#deleted', as: 'deleted'
    end
    member do
      patch 'restore'
      patch 'soft_delete'
    end
  end  
  
  namespace :wiki_posts do
    get 'example'

  end
  namespace :welcome do
    get 'index'
    get 'about'

  end
  get 'wiki_posts/example'
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  namespace :api do
    namespace :v1 do
      get 'wiki_posts/xml', to: 'wiki_posts#xml_index'
      get 'wiki_posts/csv', to: 'wiki_posts#csv_index'
      resources :wiki_posts
    end

    namespace :v2 do
      resources :wiki_posts
    end
  end

  # Defines the root path route ("/")
  get 'welcome/about'
  get '/about', to: redirect('/welcome/about')
  get 'wiki_posts/:id/restore', to: 'wiki_posts#restore', as: :restore_wiki_post_get
  get 'contributors/:contributor', to: 'wiki_posts#contributor_posts', as: 'contributor_posts'


  root "welcome#index"

end
