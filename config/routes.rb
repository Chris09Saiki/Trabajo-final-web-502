Rails.application.routes.draw do
  resources :clientes
  resources :empleados, only: [:index, :show]
  resources :productos, only: [:index, :show]
  resources :proveedores, only: [:index]
  resources :pedidos, only: [:new, :create, :show]
  resources :detalle_pedidos, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
