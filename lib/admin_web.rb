require "admin_web/engine"
require 'devise'

module AdminWeb
  class Engine < ::Rails::Engine
    config.to_prepare do
      Devise::SessionsController.layout "layout_for_sessions_controller"
    end
  end
end
