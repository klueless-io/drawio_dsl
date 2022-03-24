# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::H6 do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.text(:h6) }

  it_behaves_like :basic_text_attributes
end
