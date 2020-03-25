# frozen_string_literal: true

class Perspectives::Forms::Base < Perspectives::Base
  def self.template_path
    File.expand_path('../../../vendor/assets/javascripts', __dir__)
  end
end
