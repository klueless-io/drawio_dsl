# frozen_string_literal: true

RSpec.describe DrawioDsl::Configuration do
  let(:instance) { described_class.new }

  subject { instance }

  context 'should have configuration' do
    describe '#base_style' do
      subject { instance.base_style }

      it { is_expected.to have_attributes(white_space: :wrap, html: 1) }
    end

    describe '.source_config' do
      subject { instance.source_config }

      it { is_expected.to be_a(Hash) }
    end

    describe '.strokes' do
      subject { instance.strokes }

      it { is_expected.to be_a(Hash) }

      describe '#stroke' do
        context 'when stroke is defined' do
          subject { instance.stroke(:dashed) }

          it { is_expected.to eq('dashed=1;fixDash=1') }
        end
        context 'when stroke is not defined' do
          subject { instance.stroke(:unknown) }

          it { is_expected.to be_empty }
        end
      end
    end

    describe '.elements' do
      subject { instance.elements }

      it { is_expected.to be_a(Hash) }

      describe '#element' do
        context 'when element is defined' do
          subject { instance.element(:actor) }

          it do
            is_expected.to have_attributes(
              type: :actor,
              x: 0,
              y: 0,
              w: 40,
              h: 50,
              style_modifiers: 'shape=actor'
            )
          end
        end
        context 'when element is not defined' do
          subject { instance.element(:unknown) }

          it { is_expected.to be_nil }
        end
      end
    end

    describe '.lines' do
      subject { instance.lines }

      it { is_expected.to be_a(Hash) }

      describe '#line' do
        context 'when solid is defined' do
          subject { instance.line(:solid) }

          it do
            is_expected.to have_attributes(
              type: :solid,
              x: 0,
              y: 0,
              w: 50,
              h: 50,
              style_modifiers: 'edgeStyle=none;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0'
            )
          end
        end
        context 'when line is not defined' do
          subject { instance.line(:unknown) }

          it { is_expected.to be_nil }
        end
      end
    end

    describe '.texts' do
      subject { instance.texts }

      it { is_expected.to be_a(Hash) }

      describe '#text' do
        context 'when text is defined' do
          subject { instance.text(:h1) }

          it do
            is_expected.to have_attributes(
              type: :h1,
              x: 0,
              y: 0,
              w: 100,
              h: 50,
              style_modifiers: 'text;fontSize=89;fontStyle=1;fillColor=none'
            )
          end
        end
        context 'when text is not defined' do
          subject { instance.text(:unknown) }

          it { is_expected.to be_nil }
        end
      end
    end

    describe '.connector' do
      subject { instance.connector }

      it { is_expected.to be_a(DrawioDsl::Configuration::Connector) }

      describe '.source_config' do
        subject { instance.connector.source_config }

        it { is_expected.to be_a(Hash) }

        describe '#compass_point' do
          context 'when compass_point is defined' do
            subject { instance.connector.compass_point(:e) }

            it { is_expected.to have_attributes(x: 1, y: 0.5) }
          end
          context 'when compass_point is not defined' do
            subject { instance.connector.compass_point(:unknown) }

            it { is_expected.to have_attributes(x: 0, y: 0) }
          end
        end

        describe '#waypoint' do
          context 'when waypoint is defined' do
            subject { instance.connector.waypoint(:straight) }

            it { is_expected.to eq('edgeStyle=none') }
          end
          context 'when waypoint is not defined' do
            subject { instance.connector.waypoint(:unknown) }

            it { is_expected.to be_empty }
          end
        end

        describe '#arrow' do
          context 'when arrow is defined' do
            subject { instance.connector.arrow(:triangle) }

            it { is_expected.to eq('block') }
          end
          context 'when arrow is not defined' do
            subject { instance.connector.arrow(:unknown) }

            it { is_expected.to eq('open') }
          end
        end

        describe '#design' do
          context 'when design is defined' do
            subject { instance.connector.design(:style2) }

            it { is_expected.to eq('shape=link') }
          end
          context 'when design is not defined' do
            subject { instance.connector.design(:unknown) }

            it { is_expected.to be_empty }
          end
        end
      end
    end

    describe '.theme' do
      subject { instance.theme }

      it { is_expected.to be_a(DrawioDsl::Configuration::Theme) }

      describe '.source_config' do
        subject { instance.theme.source_config }

        it { is_expected.to be_a(Hash) }

        describe '#background' do
          context 'when background is defined' do
            subject { instance.theme.background(:style_01) }

            it { is_expected.to have_attributes(type: :style_01, bg_color: '#f5f5f5', font_color: '#aaaaaa') }
          end
          context 'when background is not defined' do
            subject { instance.theme.background(:unknown) }

            it { is_expected.to have_attributes(type: :unknown, bg_color: '#000000', font_color: '#ffffff') }
          end
        end

        describe '#element' do
          context 'when element is defined' do
            subject { instance.theme.element(:style_30) }

            it { is_expected.to have_attributes(type: :style_30, fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#000000', gradient: '#b3b3b3') }
          end
          context 'when element is not defined' do
            subject { instance.theme.element(:unknown) }

            it { is_expected.to have_attributes(type: :unknown, fill_color: '#ffffff', stroke_color: '#000000', font_color: '#000000', gradient: nil) }
          end
        end
      end
    end

    describe '#shapes' do
      subject { instance.shapes }

      it { is_expected.not_to be_nil }

      context 'check one of the shapes' do
        subject { instance.shapes.square }

        it { is_expected.to have_attributes(type: :square) }
      end
    end

    context 'should have themes' do
      describe '.themes' do
        subject { instance.themes }

        it { is_expected.not_to be_nil }
      end

      describe '.themes' do
        subject { instance.themes[:style_01] }

        it { is_expected.to have_attributes(fill_color: '#f5f5f5', stroke_color: '#666666', element_font_color: '#333333', text_font_color: '#aaaaaa', gradient: be_nil) }
      end

      describe '.random_theme' do
        subject { instance.random_theme }

        it { is_expected.to be_a(Symbol) }
      end

      describe '#palette' do
        subject { instance.palette(:style_01) }

        it { is_expected.to have_attributes(fill_color: '#f5f5f5', stroke_color: '#666666', element_font_color: '#333333', text_font_color: '#aaaaaa', gradient: be_nil) }
      end
    end
  end
end
