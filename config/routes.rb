KidFriendly::Application.routes.draw do
  get "comments/index"
  get "comments/new"
  resources :charges
  get '/rate' => 'rater#create', :as => 'rate'
  resources :appointments 
  resources :searches, only: [:new, :create, :index]
  root "welcome#index"
  
  # devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  devise_for :users  
  resources :users, only: :show do
    resources :schedules
    resources :comments
    get "calendar" => "calendar#show", :as => "calendar"
    post :generate_new_password_email
    resources :messages do
      member do
        get :show
        post :new
        post :reply
        post :trash
        post :empty_trash
      end
    end
    resources :activities, :shallow=>true   do
      resources :comments
      member do
        put 'claim'
        put 'confirm'
      end
    end
  end 
end
