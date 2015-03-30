# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: bank-validator 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bank-validator"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Adam Bahlke"]
  s.date = "2015-03-30"
  s.description = "Validates IBAN and BIC account numbers. Still a work in progress"
  s.email = "adam.bahlke@hitfoxgroup.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bank-validator.gemspec",
    "lib/active_model/bic_validator.rb",
    "lib/active_model/iban_validator.rb",
    "lib/bank-validator.rb",
    "test/dummy/.gitignore",
    "test/dummy/.rspec",
    "test/dummy/Gemfile",
    "test/dummy/Gemfile.lock",
    "test/dummy/README.rdoc",
    "test/dummy/Rakefile",
    "test/dummy/app/assets/images/.keep",
    "test/dummy/app/assets/javascripts/application.js",
    "test/dummy/app/assets/stylesheets/application.css",
    "test/dummy/app/controllers/application_controller.rb",
    "test/dummy/app/controllers/concerns/.keep",
    "test/dummy/app/helpers/application_helper.rb",
    "test/dummy/app/mailers/.keep",
    "test/dummy/app/models/.keep",
    "test/dummy/app/models/concerns/.keep",
    "test/dummy/app/models/user.rb",
    "test/dummy/app/views/layouts/application.html.erb",
    "test/dummy/bin/bundle",
    "test/dummy/bin/rails",
    "test/dummy/bin/rake",
    "test/dummy/bin/setup",
    "test/dummy/bin/spring",
    "test/dummy/config.ru",
    "test/dummy/config/application.rb",
    "test/dummy/config/boot.rb",
    "test/dummy/config/database.yml",
    "test/dummy/config/environment.rb",
    "test/dummy/config/environments/development.rb",
    "test/dummy/config/environments/production.rb",
    "test/dummy/config/environments/test.rb",
    "test/dummy/config/initializers/assets.rb",
    "test/dummy/config/initializers/backtrace_silencers.rb",
    "test/dummy/config/initializers/cookies_serializer.rb",
    "test/dummy/config/initializers/filter_parameter_logging.rb",
    "test/dummy/config/initializers/inflections.rb",
    "test/dummy/config/initializers/mime_types.rb",
    "test/dummy/config/initializers/session_store.rb",
    "test/dummy/config/initializers/wrap_parameters.rb",
    "test/dummy/config/locales/en.yml",
    "test/dummy/config/routes.rb",
    "test/dummy/config/secrets.yml",
    "test/dummy/db/migrate/20150330083818_create_users.rb",
    "test/dummy/db/schema.rb",
    "test/dummy/db/seeds.rb",
    "test/dummy/lib/assets/.keep",
    "test/dummy/lib/tasks/.keep",
    "test/dummy/log/.keep",
    "test/dummy/public/404.html",
    "test/dummy/public/422.html",
    "test/dummy/public/500.html",
    "test/dummy/public/favicon.ico",
    "test/dummy/public/robots.txt",
    "test/dummy/spec/features/gem_testing_spec.rb",
    "test/dummy/spec/rails_helper.rb",
    "test/dummy/spec/spec_helper.rb",
    "test/dummy/vendor/assets/javascripts/.keep",
    "test/dummy/vendor/assets/stylesheets/.keep",
    "test/helper.rb",
    "test/test_bank-validator.rb"
  ]
  s.homepage = "http://github.com/declarus/bank-validator"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Bank account number validator gem"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, ["~> 3.5"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.9"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0"])
      s.add_dependency(%q<activerecord>, [">= 3.0"])
      s.add_dependency(%q<activemodel>, [">= 3.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<shoulda>, ["~> 3.5"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0"])
    s.add_dependency(%q<activerecord>, [">= 3.0"])
    s.add_dependency(%q<activemodel>, [">= 3.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<shoulda>, ["~> 3.5"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.9"])
  end
end

