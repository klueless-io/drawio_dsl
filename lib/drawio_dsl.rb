# frozen_string_literal: true

require 'securerandom'
require 'nokogiri'

require 'k_config'
require 'k_log'
require 'k_director'

require_relative 'drawio_dsl/configuration'
require_relative 'drawio_dsl/version'
require_relative 'drawio_dsl/schema'
require_relative 'drawio_dsl/dom_builder'
require_relative 'drawio_dsl/xml_builder'
require_relative 'drawio_dsl/layout_container'
require_relative 'drawio_dsl/layout_engine'
require_relative 'drawio_dsl/drawio'

module DrawioDsl
  # raise DrawioDsl::Error, 'Sample message'
  Error = Class.new(StandardError)

  # Your code goes here...
end

if ENV['KLUE_DEBUG']&.to_s&.downcase == 'true'
  namespace = 'DrawioDsl::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('drawio_dsl/version') }
  version   = DrawioDsl::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
