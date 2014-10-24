$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin_web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin_web"
  s.version     = AdminWeb::VERSION
  s.authors     = ["Devwors Soluções e Tecnologia", "Rodrigo Ulisses e Silva"]
  s.email       = ["contato@devworks.net.br", "rodrigo.ulisses7@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AdminWeb."
  s.description = "TODO: Description of AdminWeb."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = 'git ls-files -- {test,spec,features}/*'.split("\n")

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "devise"

  s.add_development_dependency "pg"
end
