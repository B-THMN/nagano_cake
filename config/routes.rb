Rails.application.routes.draw do
  root to: 'public/items#top'

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  namespace :admin do

    get 'homes/top'
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    end

  scope module: :public do

    get 'items/top'
    get 'items/about'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    post 'orders/check'
    get 'orders/complete'
    resources :orders, only: [:index, :show, :create, :new]
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers, only: [:edit, :show, :update]
    resources :addresses, except: [:show, :new]
  end

end