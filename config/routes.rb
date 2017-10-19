Rails.application.routes.draw do

  scope '/(:locale)', defaults: { locale: 'es' }, constraints: { locale: /en|es/ } do
    root to: 'welcome#index'
    resources :sucursals
    resources :reservations
    resources :prostheses
    resources :treatments
    resources :dental_examinations
    resources :medical_histories
    resources :patients
    resources :employees
    resources :roles
    resources :reports
    devise_for :users
    resources :debts


    get '/perfil' => 'welcome#perfil'
    get '/lista' => 'prostheses#lista'
    get '/entregado/:id' => 'prostheses#entregado'
    get '/diary' => 'reservations#diary'
    get '/diary_special' => 'reservations#diary_special'
    post '/reservacion' => 'reservations#reservacion'
    post '/reservacion_especial' => 'reservations#reservacion_especial'
    get '/deudas' => 'debts#patient'
    get '/diary_secretary' => 'reservations#diary_secretary'
    post '/diary_secretary' => 'reservations#reservacion_secretaria'
    post '/diary_secretary_especial' => 'reservations#reservacion_secretaria_especial'
    get '/atendido/:id' => 'reservations#atendido'
  end


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
