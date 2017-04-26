Rails.application.routes.draw do
  root to: "home#index"
  resources :documents, except: [:index, :show]
  get 'dashboard/index'
  devise_for :users

  post 'documents/:id/publish', to: 'documents#publish', as: :document_publish
  post 'documents/:id/unpublish', to: 'documents#unpublish', as: :document_unpublish
end
