# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # Create an instance of a HTML formatter on the shape
    module Factory
      include KLog::Logging

      FORMATTERS = {
        class: DrawioDsl::Formatters::KlassFormatter,
        interface: DrawioDsl::Formatters::InterfaceFormatter
      }.freeze

      def format(type)
        unless FORMATTERS.key?(type)
          log.error "Unknown formatter type: #{type}"
          @formatter = nil
          return formatter
        end

        @formatter = FORMATTERS[type].new
        formatter
      end

      def formatter
        @formatter ||= DrawioDsl::Formatters::BaseFormatter.new
      end
    end
  end
end
