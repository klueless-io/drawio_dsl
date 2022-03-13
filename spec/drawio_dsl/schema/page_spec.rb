# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Page do
  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1, name: 'Page 1' } }

  let(:diagram_args) do
    {
      white_space: :xxx,
      html: 9,
      rounded: 9,
      shadow: 9,
      sketch: 9,
      glass: 9
    }
  end

  let(:diagram) { DrawioDsl::Schema::Diagram.new(**diagram_args) }

  describe '#initialize' do
    context 'has sane defaults' do
      let(:args) { {} }

      it do
        is_expected.to have_attributes(
          id: nil,
          name: nil,
          theme: diagram.theme,
          margin_left: 50,
          margin_top: 50,
          grid: 0,
          grid_size: 10,
          guides: 1,
          tooltips: 1,
          connect: 1,
          arrows: 1,
          fold: 1,
          page_no: 1,
          page_scale: 1,
          page_width: 1169, # A4
          page_height: 827, # A4
          background: '#FFFACD',
          page_shadow: 0,
          math: 0
        )
      end
    end

    context 'with valid attributes' do
      let(:args) do
        { id: 8, name: 'Page 8', theme: :style_25, margin_left: 85, margin_top: 25, grid: 8, grid_size: 25, guides: 5, tooltips: 5, connect: 5, arrows: 5, fold: 5, page_no: 2, page_scale: 2,
          page_width: 855, page_height: 655, background: '#FFFACD', page_shadow: 8, math: 8 }
      end

      it do
        is_expected.to have_attributes(
          id: 8,
          name: 'Page 8',
          theme: :style_25,
          margin_left: 85,
          margin_top: 25,
          grid: 8,
          grid_size: 25,
          guides: 5,
          tooltips: 5,
          connect: 5,
          arrows: 5,
          fold: 5,
          page_no: 2,
          page_scale: 2,
          page_width: 855,
          page_height: 655,
          background: '#FFFACD',
          page_shadow: 8,
          math: 8
        )
      end

      describe '.to_h' do
        subject { instance.to_h }

        it do
          is_expected.to eq(
            id: 8,
            name: 'Page 8',
            position_x: 0,
            position_y: 0,
            theme: :style_25,
            palette: {
              fill_color: '#fad9d5',
              stroke_color: '#ae4132',
              font_color: '#333333',
              gradient: nil
            },
            style: {
              white_space: :xxx,
              html: 9,
              rounded: 9,
              shadow: 9,
              sketch: 9,
              glass: 9
            },
            settings: {
              margin_left: 85,
              margin_top: 25,
              grid: 8,
              grid_size: 25,
              guides: 5,
              tooltips: 5,
              connect: 5,
              arrows: 5,
              fold: 5,
              page_no: 2,
              page_scale: 2,
              page_width: 855,
              page_height: 655,
              background: '#FFFACD',
              page_shadow: 8,
              math: 8
            },
            nodes: []
          )
        end
      end
    end
  end
  # {
  #   id: 'page_root_8',
  #   classification: :anchor,
  #   nodes: [
  #     {
  #       id: 'node_root_8',
  #       classification: :anchor
  #     }
  #   ]
  # },

  describe '.position_x' do
    subject { instance.position_x }

    it { is_expected.to eq(0) }
  end

  describe '.position_y' do
    subject { instance.position_y }

    it { is_expected.to eq(0) }
  end

  describe '.nodes' do
    subject { instance.nodes }

    it { is_expected.to be_a(DrawioDsl::Schema::NodeList) }

    describe '.empty?' do
      subject { instance.nodes }

      it { is_expected.to be_empty }
    end
  end

  describe '#add_node' do
    subject { node }

    let(:command) { instance.add_node(node) }
    let(:node) { DrawioDsl::Schema::Node.new(instance, id: 'page_root') }

    it { expect { command }.to change { instance.nodes.length }.from(0).to(1) }
    it { is_expected.to be_root }

    context 'new node belongs to a parent' do
      subject { node.parent }

      before { command }

      it { is_expected.to eq(instance).and be_a(DrawioDsl::Schema::Page) }
    end
  end

  context '.style' do
    subject { instance.style }

    context 'when not present' do
      it do
        is_expected.to have_attributes(
          white_space: diagram.style.white_space,
          html: diagram.style.html,
          rounded: diagram.style.rounded,
          shadow: diagram.style.shadow,
          sketch: diagram.style.sketch,
          glass: diagram.style.glass
        )
      end
    end

    context 'when page style attributes are customized' do
      let(:args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

      it { is_expected.to have_attributes(white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx') }
    end

    context 'when diagram style attributes are customized' do
      let(:diagram_args) { { white_space: 'yyy', html: 'yyy', rounded: 'yyy', shadow: 'yyy', sketch: 'yyy', glass: 'yyy' } }

      it { is_expected.to have_attributes(white_space: 'yyy', html: 'yyy', rounded: 'yyy', shadow: 'yyy', sketch: 'yyy', glass: 'yyy') }
    end
  end

  context '.palette' do
    subject { instance.palette }

    context 'when theme is present on diagram' do
      let(:diagram_args) { { theme: :style_01 } }

      it do
        is_expected.to have_attributes(
          fill_color: '#f5f5f5',
          stroke_color: '#666666',
          font_color: '#333333',
          gradient: nil
        )
      end
    end

    context 'when theme is present on page' do
      let(:args) { { theme: :style_02 } }

      it do
        is_expected.to have_attributes(
          fill_color: '#dae8fc',
          stroke_color: '#6c8ebf',
          font_color: '#333333',
          gradient: nil
        )
      end
    end
  end
end
