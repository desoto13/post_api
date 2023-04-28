Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, except: [:show, :new, :edit] do
      end
    end
  end
end
