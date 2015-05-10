module WebAdmin
  class ApplicationController < ActionController::Base
    layout 'web_admin/layouts/application'
    respond_to :html

    rescue_from CanCan::AccessDenied do |exception|
      render :file => "shared/403.html", :status => 403, :layout => false
    end
  end
end
