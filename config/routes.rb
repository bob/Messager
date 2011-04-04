Messager::Application.routes.draw do


  controller :users do
    get  "user/show_friends" => :show_friends, :as => "show_friends"
    get "user/:user_id" => :show, :as => "show_user"
    get "user/:user_id" => :show, :as => "user"
    post "user/:user_id/follow" => :follow, :as => "follow_user"
    post "user/:user_id/unfollow" => :unfollow, :as => "unfollow_user"
  end

  match "profile" => "profile#profile", :as => "profile"
  match 'profile/edit' => 'profile#edit', :as => "profile_edit"
  #match 'profile/change_fullname' => 'profile#change_fullname', :as => "profile_change_fullname"

  controller :profile do
    get "profile/change_password" => :change_password, :as => "change_password"
    put "profile/update" => :update, :as => "update_profile"
    put "profile/update_password" => :update_password, :as => "update_password"
    get "profile/avatar" => :avatar, :as => "avatar"
    put "profile/update_avatar" => :update_avatar, :as => "update_avatar"
  end

  get "welcome/index"
  get "welcome/about", :as => "about"

  devise_for :users

  resources :messages  
  resources :comments, :only => [:new, :create, :destroy]    

  match "status/current" => "messages#current", :as => "current_status"

  # controller :messages do
  #   get 'status/current' => :current, :as => "current_status"
  # end



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

