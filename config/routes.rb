KidFriendly::Application.routes.draw do

  resources :linkedin
  post '/rate' => 'rater#create', :as => 'rate'
  # post '/rate' => 'rater#create', :as => 'rate'
  get '/linkedin_profile' => "linkedin#linkedin_profile"
  get '/oauth_account' => "linkedin#oauth_account" 
  post '/oauth_account' => "linkedin#oauth_account" 
  get '/linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url' 
  post '/linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url' 
  
  get "comments/index"
  get "comments/new"
  resources :charges
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
