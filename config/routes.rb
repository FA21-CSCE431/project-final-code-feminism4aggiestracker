Rails.application.routes.draw do
  get 'member/ManageMembers'
  root 'announcements#index' # temporarily set the announcements page as home, for convenience

  resources :announcements do
    member do
      get :delete
    end
  end

  resources :members
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
