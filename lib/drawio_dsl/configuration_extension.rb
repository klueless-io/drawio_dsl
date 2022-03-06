# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationExtension
    def drawio
      return @drawio if defined? @drawio

      @drawio = DrawioDsl::Configuration.new
    end
  end
end
