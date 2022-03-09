# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Node do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page, **args) }
  let(:args) { {} }
  let(:page_root) { described_class.new(page, classification: :anchor, id: 'root-1') }

  it { is_expected.to have_attributes(id: nil, classification: :unknown, parent: nil) }

  context 'with valid attributes' do
    let(:args) { { id: 1, classification: :square, parent: page_root } }

    it { is_expected.to have_attributes(classification: :square, parent: have_attributes(id: 'root-1')) }
  end

  describe '.page' do
    subject { instance.page }

    it { is_expected.to eq page }
  end

  describe '.id' do
    subject { instance.id }

    it { is_expected.to be_nil }
  end

  describe '.classification' do
    subject { instance.classification }

    it { is_expected.to eq :unknown }
  end

  describe '.parent' do
    subject { instance.parent }

    it { is_expected.to be_nil }

    describe '.root' do
      subject { instance }

      it { is_expected.to be_root }
    end

    context 'with parent' do
      let(:args) { { parent: page_root } }

      it { is_expected.to eq page_root }

      describe '.root' do
        subject { instance }

        it { is_expected.not_to be_root }
      end
    end
  end

  describe '.to_h' do
    subject { instance.to_h }

    it { is_expected.not_to be_nil }
  end
end
