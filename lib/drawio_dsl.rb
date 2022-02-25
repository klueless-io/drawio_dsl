# frozen_string_literal: true

require_relative 'drawio_dsl/version'

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
