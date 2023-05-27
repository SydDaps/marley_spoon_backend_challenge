# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    ApiException::EXCEPTIONS.each do |exception_name|
      unless ApiException.const_defined?(exception_name)
        ApiException.const_set(exception_name, Class.new(ApiException::BaseError))

        exception_name = "ApiException::#{exception_name}"
      end

      rescue_from exception_name.constantize do |error|
        flash[:error] = error.message
        redirect_to root_path
      end
    end
  end
end
