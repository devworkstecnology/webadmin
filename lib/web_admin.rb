require 'devise'
require 'simple_form'
require 'ckeditor'
require 'carrierwave'
require 'i18n_alchemy'
require 'jquery-fileupload-rails'
require 'enumerate_it'
require 'cancan'
require 'responders'
require "web_admin/engine"

module WebAdmin
  class Engine < ::Rails::Engine
    config.to_prepare do
      Devise::SessionsController.layout "web_admin/devise"
    end
  end
end
