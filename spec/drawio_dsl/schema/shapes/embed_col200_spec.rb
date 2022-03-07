# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::EmbedCol200 do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.shapes.embed_col200 }

  it_behaves_like :basic_shape_attributes
end
