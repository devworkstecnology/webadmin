module AdminWeb
  class Engine < ::Rails::Engine
    isolate_namespace AdminWeb

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer("admin_web.locales") do |app|
      AdminWeb::Engine.config.i18n.load_path += Dir[Rails.root.join('../../config/locales/', '*.{rb,yml}').to_s]
      AdminWeb::Engine.config.i18n.default_locale = 'pt-BR'
    end
  end
end
