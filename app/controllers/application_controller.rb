class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

    def auth_user
        if user_signed_in?
            if current_user.has_role? :admin or current_user==@user
            end
        else
            redirect_to root_path, :notice => "Not Authorized"
        end
    end
end
