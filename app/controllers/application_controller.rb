class ApplicationController < ActionController::Base
  include Error::ErrorHandler
  before_action :authenticate_user!

  helper_method :current_user
end
