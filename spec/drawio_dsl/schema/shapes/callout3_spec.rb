# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Callout3 do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.shapes.callout3 }

  it_behaves_like :basic_shape_attributes
end
