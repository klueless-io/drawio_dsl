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

  describe '.nodes' do
    subject { instance.nodes }

    it { is_expected.to be_a(DrawioDsl::Schema::NodeList) }

    describe '.empty?' do
      subject { instance.nodes }

      it { is_expected.to be_empty }
    end
  end

  context 'when node hierarchy' do
    let(:add_child_to_parent) { parent_node.add_node(child_node) }
    let(:parent_node) { DrawioDsl::Schema::Anchor.new(page, id: 'page_node') }
    let(:child_node) { DrawioDsl::Schema::Square.new(page, id: 'shape_id') }

    context 'from parent point of view' do
      subject { parent_node }

      it { expect { add_child_to_parent }.to change { parent_node.nodes.length }.from(0).to(1) }

      context 'when child node is added' do
        before { add_child_to_parent }

        it { is_expected.to be_root }

        describe '.parent' do
          subject { parent_node.parent }

          it { is_expected.to be_nil }
        end

        describe '.page' do
          subject { parent_node.page }

          it { is_expected.to eq(page) }
        end
      end
    end

    context 'from child point of view' do
      subject { child_node }

      context 'when child node is added' do
        before { add_child_to_parent }

        it { is_expected.not_to be_root }

        describe '.parent' do
          subject { child_node.parent }

          it { is_expected.to eq(parent_node) }
        end

        describe '.page' do
          subject { child_node.page }

          it { is_expected.to eq(page) }
        end
      end
    end
  end

  describe '.to_h' do
    subject { instance.to_h }

    it { is_expected.not_to be_nil }
  end
end
