RailsAdmin.config do |config|
  config.model 'User' do
    edit do
      field :name
      field :admin
      field :blocked
    end
  end
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end
  private
    def current_user
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  config.actions do
    dashboard
    index
    new
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
