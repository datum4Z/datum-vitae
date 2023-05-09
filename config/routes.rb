Rails.application.routes.draw do
  resources :experiences do
    resources :experience_details
  end

  root to: 'experiences#index'
end
