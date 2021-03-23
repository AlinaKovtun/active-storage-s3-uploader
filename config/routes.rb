Rails.application.routes.draw do
  resources :words do
    resources :images
    resources :videos
  end
end
