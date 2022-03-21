# frozen_string_literal: true

require 'pry'
require 'bundler/setup'
require 'simplecov'

SimpleCov.start do
  add_group 'Lib', 'lib'
end

# SimpleCov.start do
#   add_group "Models", "app/models"
#   add_group "Controllers", "app/controllers"
#   add_group "Long files" do |src_file|
#     src_file.lines.count > 100
#   end
#   add_group "Multiple Files", ["app/models", "app/controllers"] # You can also pass in an array
#   add_group "Short files", LineFilter.new(5) # Using the LineFilter class defined in Filters section above
# end

require 'drawio_dsl'

Dir[File.join(Dir.pwd, 'spec/shared/**/*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.filter_run_when_matching :focus

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
