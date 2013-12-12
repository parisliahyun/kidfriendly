KidFriendly::Application.routes.draw do
  root "welcome#index"
  get "calendar" => "calendar#show", :as => "calendar"

  devise_for :users  
    get "profile" => "devise/registrations#update", :as => :profile_user_registration 
  # , :controllers => { registrations: 'users/registrations' }
  resources :users, only: :show do
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
    resources :activities  do
      member do
        put 'claim'
        put 'confirm'
      end
    end
  end 
end
