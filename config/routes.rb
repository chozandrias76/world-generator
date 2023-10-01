Rails.application.routes.draw do
  root 'home#index'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/generate', to: 'generate#index'
end
