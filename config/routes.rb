Rails.application.routes.draw do
  resources :words do
    resources :images
  end
end
