require 'devise'
require 'simple_form'
require 'ckeditor'
require 'carrierwave'
require "admin_web/engine"

module AdminWeb
  class Engine < ::Rails::Engine
    config.to_prepare do
      Devise::SessionsController.layout "admin_web/devise"
    end
  end
end
