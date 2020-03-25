# frozen_string_literal: true

module Perspectives
  class Collection
    include ::Enumerable

    def initialize(perspectives)
      @perspectives = perspectives
    end

    def each(&block)
      perspectives.each(&block)
    end

    def to_html
      perspectives.map(&:to_html).join
    end
    alias to_s to_html

    private

    attr_reader :perspectives
  end
end
