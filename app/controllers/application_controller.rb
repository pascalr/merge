class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # FIXME: What is this?

  before_action :authenticate_user!
end
