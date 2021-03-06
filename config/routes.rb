Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'

  get 'reviews/all' => "reviews#all"

  get 'reviews/new/:movie_id' => "reviews#new"

  get 'reviews/edit/:id' => "reviews#edit"

  put 'reviews/:id' => "reviews#update"

  delete 'reviews/:id' => "reviews#delete"

  post 'reviews/:movie_id' => "reviews#create"

  devise_for :users
  
  get 'movies/new' => "movies#new"

  get 'movies/show/:id' => "movies#show"

  get 'movies/all' => "movies#all"

  get 'movies/edit/:id' => "movies#edit"

  post 'movies' => "movies#create"

  put 'movies/:id' => "movies#update"

  delete 'movies/:id' => "movies#destroy"

  get 'movies/search' => "movies#search"

  root :to => "movies#all"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
