# frozen_string_literal: true

RSpec.describe DrawioDsl::LayoutEngine do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page) }

  it { is_expected.to be_a described_class }

  context 'before call' do
    subject { page }

    before do
      # configure page defaults
      page_anchor = DrawioDsl::Schema::Anchor.new(self, id: "page_root_#{page.id}", key: :page_root)
      node_anchor = DrawioDsl::Schema::Anchor.new(self, id: "node_root_#{page.id}", key: :node_root)
      page_anchor.add_node(node_anchor)
      page.add_node(page_anchor)
    end

    it { is_expected.to have_attributes(position_x: 0, position_y: 0) }

    context 'after call' do
      context 'when page has margin, but there is no shapes or layout rule' do
        before { instance.call }

        it { is_expected.to have_attributes(position_x: 50, position_y: 50) }
      end

      context 'layout rules are not defined' do
        context 'and shapes are added' do
          before do
            page.add_node(DrawioDsl::Schema::Square.new(page, w: 100, h: 100))
            page.add_node(DrawioDsl::Schema::Circle.new(page, w: 100, h: 100))
            instance.call
          end
          it { is_expected.to have_attributes(position_x: 50, position_y: 50) }
        end
      end

      context 'layout rule is defined' do
        context 'no shapes added' do
          before do
            page.add_node(DrawioDsl::Schema::GridLayout.new(page, grid_w: 150))
            instance.call
          end

          it { is_expected.to have_attributes(position_x: 50, position_y: 50) }
        end

        context 'add shapes' do
          before do
            page.add_node(DrawioDsl::Schema::GridLayout.new(page, grid_w: 150))
            page.add_node(DrawioDsl::Schema::Square.new(page, w: 100, h: 100))
            page.add_node(DrawioDsl::Schema::Circle.new(page, w: 100, h: 100))
            instance.call
          end
          it { is_expected.to have_attributes(position_x: 350, position_y: 50) }
        end

        context 'add shapes and connecting line' do
          before do
            page.add_node(DrawioDsl::Schema::GridLayout.new(page, grid_w: 150))
            a = DrawioDsl::Schema::Square.new(page, w: 100, h: 100)
            b = DrawioDsl::Schema::Circle.new(page, w: 100, h: 100)
            page.add_node(a)
            page.add_node(b)
            page.add_node(DrawioDsl::Schema::Solid.new(page, source: a.id, target: b.id))
            instance.call
          end

          it 'connecting lines should not affect positioning' do
            is_expected.to have_attributes(position_x: 350, position_y: 50)
          end
        end
      end
    end
  end
end
