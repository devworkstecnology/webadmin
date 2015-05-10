$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "web_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "web_admin"
  s.version     = WebAdmin::VERSION
  s.authors     = ["Devworks Soluções e Tecnologia"]
  s.email       = ["contato@devworks.net.br"]
  s.homepage    = "http://www.devworks.net.br"
  s.summary     = "Sistema administrativo para site"
  s.description = "Sistema administrativo para site"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")


  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "simple_form"
  s.add_dependency "devise"
  s.add_dependency "ckeditor"
  s.add_dependency "carrierwave"
  s.add_dependency "fog"
  s.add_dependency "rmagick"
  s.add_dependency 'less-rails', '~> 2.6.0'
  s.add_dependency 'therubyracer'
  s.add_dependency 'i18n_alchemy'
  s.add_dependency 'jquery-fileupload-rails'
  s.add_dependency 'cancan'
  s.add_dependency 'enumerate_it'
  s.add_dependency 'mini_magick'
  s.add_dependency 'responders'

  s.add_development_dependency "pg"
end
