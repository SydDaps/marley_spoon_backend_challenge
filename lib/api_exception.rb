# frozen_string_literal: true

module ApiException
  EXCEPTIONS = %w[RecipeNotFound].freeze

  class BaseError < StandardError
    def initialize(msg = '')
      super
    end
  end
end
