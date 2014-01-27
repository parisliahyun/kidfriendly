KidFriendly::Application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'

  resources :linkedin
  get '/linkedin_profile' => "linkedin#linkedin_profile"
  get '/oauth_account' => "linkedin#oauth_account" 
  post '/oauth_account' => "linkedin#oauth_account" 
  get '/linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url' 
  post '/linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url' 
  
  get "comments/index"
  get "comments/new"
  resources :charges
  resources :searches, only: [:new, :create, :index]
  root "searches#new"
  get "about" => "welcome#about"
  
  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  # devise_for :users  
  resources :users, only: :show do
    resources :schedules
    resources :comments
    get "calendar" => "calendar#show", :as => "calendar"
    post :generate_new_password_email
    resources :messages     
      match 'sent', to: 'messages#sent', via: [:get]
      member do 
        get :show
        post :new
        post :reply
        post :trash
        post :empty_trash
      end
   
    resources :activities, :shallow=>true   do
      resources :appointments 
      resources :comments
      member do
        put 'book'
      end
    end
  end 
end
