# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Layout do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page, **args) }
  let(:args) { {} }

  describe '#initialize' do
    context '.type' do
      subject { instance.type }

      it { is_expected.to be_nil }
    end

    context '.anchor_x' do
      subject { instance.anchor_x }

      it { is_expected.to be_nil }
    end

    context '.anchor_y' do
      subject { instance.anchor_y }

      it { is_expected.to be_nil }
    end

    context 'after firing after_init' do
      before do
        page.position_x = 100
        page.position_y = 200
        instance.fire_after_init
      end

      context '.anchor_x' do
        subject { instance.anchor_x }

        it { is_expected.to eq(page.position_x) }
      end

      context '.anchor_y' do
        subject { instance.anchor_y }

        it { is_expected.to eq(page.position_y) }
      end
    end
  end
end
