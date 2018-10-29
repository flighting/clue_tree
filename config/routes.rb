Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    get 'dashboard/index'
  end

  get 'home/index'
  resources :nodes
  
  root to: "home#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user, lambda { |u| u.admin? } do
    mount RailsAdmin::Engine => '/super', as: 'rails_admin'
  end

  namespace :admin do
    get 'dashboard/index'
    get '/', to: 'dashboard#index'

    resources :nodes
  end
end
