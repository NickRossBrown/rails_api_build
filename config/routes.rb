Rails.application.routes.draw do
  resources :quotes

  scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end

  resources :users, only: [:index, :create]

end
