Rails.application.routes.draw do
  
  get 'home/index'
  
  root to: "home#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user, lambda { |u| u.admin? } do
    mount RailsAdmin::Engine => '/super', as: 'rails_admin'
  end
end
