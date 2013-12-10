KidFriendly::Application.routes.draw do
  root "welcome#index"
  resources :activities  do
    member do
      put 'claim'
      put 'confirm'
    end
  end



  devise_for :users
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
   end   
end
