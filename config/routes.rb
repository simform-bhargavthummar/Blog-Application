Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "blogs#index"
  resources :blogs do
    collection do
      get :my_blogs, to: "blogs#my_blogs", as: :my_blogs
    end

    resources :comments, except: [:index, :show, :new]
  end
end
