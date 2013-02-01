$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bigos_contact_box/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bigos_contact_box"
  s.version     = BigosContactBox::VERSION
  s.authors     = ["Artur Kremens"]
  s.email       = ["kremenso@o2.pl"]
  s.homepage    = "http://www.weban.com.pl"
  s.summary     = "Contact Form box for bigos cms system."
  s.description = "Contact box module"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "jquery-rails"
  s.add_dependency "bigos_settings"

  s.add_development_dependency "pg"

end
