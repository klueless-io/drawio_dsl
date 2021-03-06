# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Document do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.element(:document) }

  it_behaves_like :basic_element_attributes
end
