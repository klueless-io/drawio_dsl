# frozen_string_literal: true

RSpec.describe DrawioDsl::DomBuilder do
  include_context :node_dependencies

  let(:instance) { described_class.new }

  context 'on initialize' do
    describe '.diagram' do
      subject { instance.diagram }

      it { is_expected.not_to be_nil }
    end

    describe '.diagram.host' do
      subject { instance.diagram.host }

      it { is_expected.not_to be_nil }
    end

    describe '.dom' do
      subject { instance.dom }

      it { is_expected.to be_a(Hash) }
    end
  end

  describe '#reset' do
    subject { instance }

    before do
      instance.queue_action({ a: 1, b: 2 })
      instance.diagram.host = 'xxxx'
    end

    context 'before reset' do
      describe '.actions' do
        subject { instance.actions }

        it { is_expected.not_to be_empty }

        context 'after reset' do
          before { instance.reset }

          it { is_expected.to be_empty }
        end
      end

      describe '.diagram.host' do
        subject { instance.diagram.host }

        it { is_expected.to eq('xxxx') }

        context 'after reset' do
          before { instance.reset }

          it { is_expected.not_to eq('xxxx') }
        end
      end
    end
  end

  context 'when adding shapes' do
    subject { shape_node }

    let(:shape_node) { instance.dom[:pages].first[:nodes].first[:nodes].first[:nodes].first }

    before { instance.add_page }

    describe '#add_shape (any key of shape can be provided)' do
      before { instance.add_shape(shape) }

      let(:shape) { DrawioDsl::Schema::Square.new(page, **opts) }
      let(:opts) { { id: 1 } }

      it { is_expected.to include(id: 1, key: :square) }
    end

    describe '#add_rectangle' do
      context 'when id is not provided' do
        before { instance.add_rectangle }

        it { is_expected.to include(key: :rectangle) }
        it { expect(subject[:id]).to eq("#{instance.current_page.id}-1") }
      end

      context 'when id is provided via opts' do
        before { instance.add_rectangle(**opts) }

        let(:opts) { { id: 1 } }

        it { is_expected.to include(id: 1, key: :rectangle) }
      end

      context 'when id is provided via optional positional param' do
        before { instance.add_rectangle(2) }

        it { is_expected.to include(id: 2, key: :rectangle) }
      end
    end
  end
end
