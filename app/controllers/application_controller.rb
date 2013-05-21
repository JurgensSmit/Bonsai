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

    def check_for_mobile
      session[:mobile_override] = params[:mobile] if params[:mobile]
    end

    def prepare_for_mobile
      prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end
  helper_method :mobile_device?
end

end
