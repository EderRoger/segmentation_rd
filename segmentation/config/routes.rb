Rails.application.routes.draw do

  root 'contacts#index'

  resources :contacts
  post 'segmentation' => 'contacts#segmentation'

  resources :query_builders

end
