module WebAdmin
  class Engine < ::Rails::Engine
    isolate_namespace WebAdmin

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => '../factories'
    end

    initializer("web_admin.locales") do |app|
      WebAdmin::Engine.config.i18n.load_path += Dir[Rails.root.join('../../config/locales/', '*.{rb,yml}').to_s]
      WebAdmin::Engine.config.i18n.default_locale = 'pt-BR'
    end
  end
end
