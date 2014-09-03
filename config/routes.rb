Rails.application.routes.draw do
  get 'experiencias/index'

  get 'emprendimientos/index'

  get 'cv/index'

  get 'home/index'

  get 'home/portafolio'

  get 'login/index'
  post 'login/index'
  get 'admin/index'
  get 'admin/cerrar_sesion'
  post 'admin/eliminar_campo_menu'
  post 'admin/crear_campo_menu'
  post 'admin/actualizar_menu'
  post 'admin/actualizar_jumbotron'
  post 'admin/eliminar_thumbnail'
  post 'admin/actualizar_thumbnail'
  post 'admin/crear_thumbnail'
  post 'admin/actualizar_thumbnails'
  match '/' => "home#index", :via => "get"


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
