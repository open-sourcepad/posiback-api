Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do

      resource :sessions, only: %i(show create destroy)
      resources :users  do
        collection do
          put :forgot_password
          put :reset_password
          get :verify_reset_token
        end
        member do
          put :update_password
        end

        resources :feedbacks do
          resources :comments do
          end
        end

      end

      resource :dashboard, only: :show
    end # end of scope
  end

  get "*path" => "application#index"
  root to: "application#index"
end
