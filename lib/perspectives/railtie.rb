# frozen_string_literal: true

require 'perspectives/controller_additions'
require 'perspectives/responder'
require 'perspectives/active_record'
require 'generators/perspectives/install.rb'
require 'generators/perspectives/scaffold/scaffold_generator.rb'

module Perspectives
  class Railtie < Rails::Railtie
    # It seems like the responder gem defines the Rails module in some way (or
    # otherwise makes it available, i.e. the `Rails` constant is defined after
    # responder is required in lib/perspectives.rb), which implies that this
    # file is required, due to the conditional in lib/perspectives.rb. However,
    # Rails.version is not defined. This previously raised an error when
    # Rails.version was invokved, so the conditional below was modified to
    # accommodate this edge case in a reasonable manner.
    if defined?(::Rails.version) && ::Rails.version.to_s < '3.1'
      config.generators.template_engine :perspectives
      config.generators.templates << File.expand_path('../generators/perspectives/templates', __dir__)
    else
      config.app_generators.template_engine :perspectives
      config.app_generators.templates << File.expand_path('../generators/perspectives/templates', __dir__)
    end

    initializer 'perspectives.railtie' do |app|
      app.config.autoload_paths += ['app/perspectives']
      app.config.watchable_dirs['app/mustaches'] = [:mustache]

      app.config.assets.paths << File.expand_path('../../vendor/assets/javascripts', __dir__)

      Perspectives::Base.class_eval do
        include ActionView::Helpers
        include app.routes.url_helpers
        include ERB::Util
        include Perspectives::ActiveRecord
      end

      Perspectives.configure do |c|
        c.template_path = app.root.join('app', 'mustaches')
      end

      app.config.assets.configure do |env|
        env.register_engine '.mustache', Perspectives::MustacheCompiler
      end
      app.config.assets.paths << Perspectives.template_path

      # TODO: probably bail if we're not in rails3/sprockets land...
      # TODO: probably cache asset version in prod?
      ActionController::Base.send(:include, Perspectives::ControllerAdditions)
    end
  end
end
