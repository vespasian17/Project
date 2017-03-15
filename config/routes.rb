Rails.application.routes.draw do
	root to: redirect("/#{I18n.default_locale}", status: 302)
  get 'auth/:provider/callback', to: 'sessions#create'
  scope "/:locale" do
	  resources :instructions
	  resources :tags, only: [:show]
	  resources :categories
	  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	  root to: 'home#index'
	  get 'home/profile'
	  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
	end
end
