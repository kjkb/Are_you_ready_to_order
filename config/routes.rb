Rails.application.routes.draw do
  namespace :public do
    get 'searches/search'
  end
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update ]
  end
# 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 root to: 'public/home#top'
 scope module: :public do
    resources :maps, only: [:index, :show, :new, :create ] do
     resource :favorites, only: [:create, :destroy]
    end
    get 'home/about'
    get 'searches/search'
    resources :users, only: [:show] do
     get :favorites, on: :collection
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end