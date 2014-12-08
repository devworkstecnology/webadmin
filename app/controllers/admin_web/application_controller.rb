module AdminWeb
  class ApplicationController < ActionController::Base
    layout 'admin_web/layouts/application'

    rescue_from CanCan::AccessDenied do |exception|
      render :file => "shared/403.html", :status => 403, :layout => false
    end
  end
end
