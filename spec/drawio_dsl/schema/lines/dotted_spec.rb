# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Dotted do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.line(:dotted) }

  it_behaves_like :basic_line_attributes
end
