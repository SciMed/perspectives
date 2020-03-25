# frozen_string_literal: true

require 'perspectives'
require 'ostruct'
require 'pry'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Perspectives.configure do |c|
  c.template_path = File.expand_path('mustaches', __dir__)
end

puts Perspectives.template_path
