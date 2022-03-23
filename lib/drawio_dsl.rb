# frozen_string_literal: true

require 'securerandom'
require 'nokogiri'

require 'k_config'
require 'k_log'
require 'k_director'

module DrawioDsl
  # raise DrawioDsl::Error, 'Sample message'
  Error = Class.new(StandardError)

  ROOT_PATH = File.expand_path('..', __dir__)
end

require_relative 'drawio_dsl/configuration_extension'
require_relative 'drawio_dsl/configuration_shapes'
require_relative 'drawio_dsl/configuration_themes'
require_relative 'drawio_dsl/configuration'
require_relative 'drawio_dsl/version'
require_relative 'drawio_dsl/formatters/_'
require_relative 'drawio_dsl/schema/_'
require_relative 'drawio_dsl/dom_builder_shapes'
require_relative 'drawio_dsl/dom_builder'
require_relative 'drawio_dsl/xml_builder'
require_relative 'drawio_dsl/layout_engine'
require_relative 'drawio_dsl/drawio_shapes'
require_relative 'drawio_dsl/drawio_extensions_active'
require_relative 'drawio_dsl/drawio_extensions'
require_relative 'drawio_dsl/drawio_page'
require_relative 'drawio_dsl/drawio'

if ENV['KLUE_DEBUG']&.to_s&.downcase == 'true'
  namespace = 'DrawioDsl::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('drawio_dsl/version') }
  version   = DrawioDsl::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
