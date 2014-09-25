Rails.application.routes.draw do

  resources :pzz_cars

  resources :pzz_identities

  resources :pzz_driver_identities

  apipie
  resources :pzz_comments

  resources :pzz_posts

  resources :cors
  # match '/', :to => proc {|env| [200, {'Content-Type' => 'text/plain'}, ["Hello world"]] },
  #            :via => [:get, :post, :put, :delete, :options, :head, :patch]

  # devise_for :pzz_users
  devise_for :pzz_users, controllers: {registrations: "pzz_users/registrations", sessions: "pzz_users/sessions"}

  devise_scope :pzz_user do
    get 'pzz_users/phone_registered', to: 'pzz_users/registrations#phone_registered'
    get 'pzz_users/email_registered', to: 'pzz_users/registrations#email_registered'
    post 'pzz_users/avatar',          to: 'pzz_users/users#avatar'
    get 'pzz_users/:id',              to: 'pzz_users/users#show'
    put 'pzz_users/:id',              to: 'pzz_users/registrations#update_with_token'
    get '/pzz_users/:pzz_user_id/pzz_lines', to: 'pzz_lines#user_lines'
  end

  mount Rich::Engine => '/rich', :as => 'rich'
  resources :pzz_traffics

  resources :pzz_links

  resources :pzz_term_taxonomies

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :pzz_draw_configs

  resources :pzz_templates

  resources :pzz_options

  resources :pzz_messages

  resources :pzz_orders

  resources :pzz_lines do
    collection do 
      post '/search', to: 'pzz_lines#search'
    end
  end




  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
