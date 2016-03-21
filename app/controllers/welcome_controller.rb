class WelcomeController < ActionController::Base
  def index
    render :'layouts/application'
  end
end
