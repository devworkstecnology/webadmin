require "admin_web/engine"
require 'devise'

module AdminWeb
  class Engine < ::Rails::Engine
    config.to_prepare do
      Devise::SessionsController.layout "admin_web/application"
    end
  end
end
