# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema do
  let(:args) { {} }

  let(:diagram) { DrawioDsl::Schema::Diagram.new(**diagram_args) }
  let(:diagram_args) { {} }

  let(:page) { DrawioDsl::Schema::Page.new(diagram, **page_args) }
  let(:page_args) { {} }

  let(:element) { DrawioDsl::Schema::Element.new(page, **element_args) }
  let(:element_args) { {} }

  subject { instance }

  describe DrawioDsl::Schema::Diagram do
    let(:instance) { diagram }

    context '.host' do
      subject { instance.host }

      it { is_expected.not_to be_nil }

      context 'when host is present' do
        let(:diagram_args) { { host: 'host' } }

        it { is_expected.to eq('host') }
      end
    end

    context '.theme' do
      subject { instance.theme }

      it { is_expected.not_to be_nil }
    end

    it 'should have pages' do
      expect(instance.pages).to eq []
    end

    context '.style' do
      subject { instance.style }

      context 'when not present' do
        let(:base_style) { KConfig.configuration.drawio.base_style }

        it do
          is_expected.to have_attributes(
            white_space: base_style.white_space,
            html: base_style.html,
            rounded: base_style.rounded,
            shadow: base_style.shadow,
            sketch: base_style.sketch,
            glass: base_style.glass
          )
        end

        # fit { puts JSON.pretty_generate(instance.to_h) }
      end

      context 'when style attributes are present' do
        let(:diagram_args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

        it { is_expected.to have_attributes(white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx') }
      end
    end

    context '.palette' do
      subject { instance.palette }

      context 'when theme is present' do
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
    end
  end

  describe DrawioDsl::Schema::Page do
    let(:instance) { page }

    let(:page_args) { { id: 1, name: 'Page 1' } }

    it { is_expected.to have_attributes(id: 1, name: 'Page 1') }

    it 'should have elements' do
      expect(instance.elements).to eq []
    end

    context '.theme' do
      subject { instance.theme }

      it { is_expected.not_to be_nil }
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

        # fit { puts JSON.pretty_generate(instance.to_h) }
      end

      context 'when page style attributes are customized' do
        let(:page_args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

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
        let(:page_args) { { theme: :style_02 } }

        it do
          is_expected.to have_attributes(
            fill_color: '#dae8fc',
            stroke_color: '#6c8ebf',
            font_color: nil,
            gradient: nil
          )
        end
      end
    end
  end

  describe DrawioDsl::Schema::Element do
    let(:instance) { element }

    let(:element_args) { { id: 1 } }

    it { is_expected.to have_attributes(id: 1) }

    context '.style' do
      subject { instance.style }

      context 'when not present' do
        it do
          is_expected.to start_with("whiteSpace=#{page.style.white_space};html=#{page.style.html}")
        end
      end

      context 'when page style attributes are customized' do
        let(:page_args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

        it do
          is_expected.to start_with('whiteSpace=xxx;html=xxx;rounded=xxx;shadow=xxx;sketch=xxx;glass=xxx')
        end
      end

      context 'when diagram style attributes are customized' do
        let(:diagram_args) { { white_space: 'yyy', html: 'yyy', rounded: 'yyy', shadow: 'yyy', sketch: 'yyy', glass: 'yyy' } }

        it do
          is_expected.to start_with('whiteSpace=yyy;html=yyy;rounded=yyy;shadow=yyy;sketch=yyy;glass=yyy')
        end
      end
    end
  end

  context 'elements on a page' do
    let(:instance) { described_class.new(page, **args) }
    let(:args) { { id: 1 } }

    describe DrawioDsl::Schema::Element do
      context 'with minimal valid attributes' do
        it { is_expected.to have_attributes(id: 1, type: :element, x: 0, y: 0, w: 20, h: 20) }
      end

      context 'with valid attributes' do
        let(:args) { { id: 1, type: :square, x: 10, y: 10, w: 100, h: 100 } }

        it { is_expected.to have_attributes(type: :square, x: 10, y: 10, w: 100, h: 100) }
      end
    end

    describe DrawioDsl::Schema::Square do
      context 'with minimal valid attributes' do
        it { is_expected.to have_attributes(id: 1, type: :square, x: 0, y: 0, w: 160, h: 160) }
      end

      context 'with valid attributes' do
        let(:args) { { id: 1, type: :square, x: 10, y: 10, w: 100, h: 100 } }

        it { is_expected.to have_attributes(type: :square, x: 10, y: 10, w: 100, h: 100) }
      end
    end

    describe DrawioDsl::Schema::Rectangle do
      context 'with minimal valid attributes' do
        it { is_expected.to have_attributes(id: 1, type: :rectangle, x: 0, y: 0, w: 240, h: 120) }
      end

      context 'with valid attributes' do
        let(:args) { { id: 1, type: :rectangle, x: 10, y: 10, w: 100, h: 100 } }

        it { is_expected.to have_attributes(type: :rectangle, x: 10, y: 10, w: 100, h: 100) }
      end
    end

    describe DrawioDsl::Schema::Circle do
      context 'with minimal valid attributes' do
        it { is_expected.to have_attributes(id: 1, type: :circle, x: 0, y: 0, w: 160, h: 160) }
      end

      context 'with valid attributes' do
        let(:args) { { id: 1, type: :circle, x: 10, y: 10, w: 100, h: 100 } }

        it { is_expected.to have_attributes(type: :circle, x: 10, y: 10, w: 100, h: 100) }
      end
    end

    describe DrawioDsl::Schema::Process do
      context 'with minimal valid attributes' do
        it { is_expected.to have_attributes(id: 1, type: :process, x: 0, y: 0, w: 240, h: 120) }
      end

      context 'with valid attributes' do
        let(:args) { { id: 1, type: :process, x: 10, y: 10, w: 100, h: 100 } }

        it { is_expected.to have_attributes(type: :process, x: 10, y: 10, w: 100, h: 100) }
      end
    end

    describe DrawioDsl::Schema::Ellipse do
      context 'with minimal valid attributes' do
        it { is_expected.to have_attributes(id: 1, type: :ellipse, x: 0, y: 0, w: 240, h: 120) }
      end

      context 'with valid attributes' do
        let(:args) { { id: 1, type: :ellipse, x: 10, y: 10, w: 100, h: 100 } }

        it { is_expected.to have_attributes(type: :ellipse, x: 10, y: 10, w: 100, h: 100) }
      end
    end
  end
end
