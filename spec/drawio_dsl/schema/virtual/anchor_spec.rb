# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Anchor do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page, **args) }
  let(:args) { {} }

  describe '#initialize' do
    context '.classification' do
      subject { instance.classification }

      it { is_expected.to eq(:anchor) }
    end
  end
end
