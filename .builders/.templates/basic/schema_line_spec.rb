# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::{{camel line.type}} do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.element(:{{snake line.type}}) }

  it_behaves_like :basic_shape_attributes
end
