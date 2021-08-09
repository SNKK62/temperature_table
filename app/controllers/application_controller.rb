class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    include SessionsHelper
    protect_from_forgery with: :null_session

end
