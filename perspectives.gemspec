# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'perspectives/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'perspectives'
  s.version     = Perspectives::VERSION
  s.authors     = ['Andrew Warner']
  s.email       = ['wwarner.andrew@gmail.com']
  s.homepage    = 'https://github.com/RapGenius/perspectives'
  s.summary     = 'Render shared views on the client OR on the server'
  s.description = 'Render shared views on the client OR on the server'

  s.files = Dir['{app,config,db,lib,vendor}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rails', "< 6"
  s.add_development_dependency 'rspec'

  s.add_dependency 'activesupport', ">= 4.2.0"
  s.add_dependency 'mustache'
  s.add_dependency 'responders', "< 3"
  s.add_dependency 'tilt'
end
