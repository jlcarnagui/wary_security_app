Rails.application.routes.draw do
  devise_for :employees
  resources :access_logs, only: [:index, :new, :create, :edit, :update]
  root to: "access_logs#index"
end
