# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Node do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page, **args) }
  let(:args) { {} }

  it { is_expected.to have_attributes(id: nil, classification: :unknown) }

  context 'with valid attributes' do
    let(:args) { { id: 1, classification: :square } }

    it { is_expected.to have_attributes(classification: :square) }
  end

  context '.page' do
    subject { instance.page }

    it { is_expected.to eq page }
  end
end
