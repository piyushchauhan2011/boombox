Rails.application.routes.draw do
  get 'artists/index', to: 'artists#index', defaults: { format: :json }
  get 'artists/top_5_by_sum', to: 'artists#top_5_by_sum', defaults: { format: :json }
  get 'artists/top_5_by_number', to: 'artists#top_5_by_number', defaults: { format: :json }
  get 'artists/top_5_by_tags/:tag_id', to: 'artists#top_5_by_tags', defaults: { format: :json }
  get 'artists/byID/:id', to: 'artists#show_artist_id', defaults: { format: :json }
  get 'artists/:id', to: 'artists#show', defaults: { format: :json }

  get 'users/index', to: 'users#index', defaults: { format: :json }
  get 'users/byID/:id', to: 'users#show_user_id', defaults: { format: :json }
  get 'users/:id', to: 'users#show', defaults: { format: :json }
  get 'users/:id/top_5_by_sum', to: 'users#top_5_by_sum', defaults: { format: :json }
  get 'users/:id/top_5_by_number', to: 'users#top_5_by_number', defaults: { format: :json }
  get 'users/:id/top_5_by_tags/:tag_id', to: 'users#top_5_by_tags', defaults: { format: :json }
  get 'users/:id/artists/:artist_id', to: 'users#artist', defaults: { format: :json }

  get 'tags/index', to: 'tags#index', defaults: { format: :json }

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
