module SpreeFeeds
  module Helpers
    class Base
      include Spree::Core::Engine.routes.url_helpers
      include ActionView::Helpers::SanitizeHelper

      def initialize(variant, host)
        @variant = variant
        @product = variant.product
        @host = host
      end

      def description
        sanitized_description = strip_tags(@product.description)
        sanitized_description ? sanitized_description.gsub("\n", ' ').gsub("\r", '').squeeze(' ').strip : ''
      end

    end
  end
end
