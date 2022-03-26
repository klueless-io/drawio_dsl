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

    describe '.shape' do
      subject { instance.shape }

      it { is_expected.to be_a(DrawioDsl::Configuration::Shape) }

      describe '.source_config' do
        subject { instance.shape.source_config }

        it { is_expected.to be_a(Hash) }

        describe '#element' do
          context 'when element is defined' do
            subject { instance.shape.element(:actor) }

            it do
              is_expected.to have_attributes(
                key: :actor,
                x: 0,
                y: 0,
                w: 40,
                h: 50,
                style_modifiers: 'shape=actor'
              )
            end
          end

          context 'when element is not defined' do
            subject { instance.shape.element(:unknown) }

            it { is_expected.to eq(instance.shape.default_element) }
          end

          describe '@default_element' do
            subject { instance.shape.default_element }

            it do
              is_expected.to have_attributes(
                key: :square,
                x: 0,
                y: 0,
                w: 160,
                h: 160,
                style_modifiers: ''
              )
            end
          end

          describe '#element_keys' do
            subject { instance.shape.element_keys }

            it { is_expected.to be_a(Array) }
          end

          describe '#random_element_key' do
            subject { instance.shape.random_element_key }

            it { is_expected.to be_a(Symbol) }
          end
        end

        describe '#line' do
          context 'when line is defined' do
            subject { instance.line(:solid) }

            it do
              is_expected.to have_attributes(
                key: :solid,
                x: 0,
                y: 0,
                w: 50,
                h: 50,
                style_modifiers: 'edgeStyle=none;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0'
              )
            end
          end

          context 'when line is not defined' do
            subject { instance.shape.line(:unknown) }

            it { is_expected.to eq(instance.shape.default_line) }
          end

          describe '@default_line' do
            subject { instance.shape.default_line }

            it do
              is_expected.to have_attributes(
                key: :solid,
                x: 0,
                y: 0,
                w: 50,
                h: 50,
                style_modifiers: 'edgeStyle=none;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0'
              )
            end
          end

          describe '#line_keys' do
            subject { instance.shape.line_keys }

            it { is_expected.to be_a(Array) }
          end

          describe '#random_line_key' do
            subject { instance.shape.random_line_key }

            it { is_expected.to be_a(Symbol) }
          end
        end

        describe '#text' do
          context 'when text is defined' do
            subject { instance.shape.text(:h1) }

            it do
              is_expected.to have_attributes(
                key: :h1,
                x: 0,
                y: 0,
                w: 100,
                h: 50,
                style_modifiers: 'text;fontSize=89;fontStyle=1;fillColor=none'
              )
            end
          end

          context 'when text is not defined' do
            subject { instance.shape.text(:unknown) }

            it { is_expected.to eq(instance.shape.default_text) }
          end

          describe '@default_text' do
            subject { instance.shape.default_text }

            it do
              is_expected.to have_attributes(
                key: :p,
                x: 0,
                y: 0,
                w: 100,
                h: 50,
                style_modifiers: 'text;fontSize=16;fontStyle=1;fillColor=none'
              )
            end
          end

          describe '#text_keys' do
            subject { instance.shape.text_keys }

            it { is_expected.to be_a(Array) }
          end

          describe '#random_text_key' do
            subject { instance.shape.random_text_key }

            it { is_expected.to be_a(Symbol) }
          end
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
            subject { instance.theme.background(:navy) }

            it { is_expected.to have_attributes(key: :navy, bg_color: '#000080', font_color: '#FFFFFF', favourite: false) }

            context 'when favourite is set' do
              subject { instance.theme.background(:teal) }

              it { is_expected.to have_attributes(key: :teal, bg_color: '#008080', font_color: '#FFFFFF', favourite: true) }
            end
          end

          context 'when background is not defined' do
            subject { instance.theme.background(:unknown) }

            it { is_expected.to have_attributes(key: :unknown, bg_color: '#000000', font_color: '#FFFFFF', favourite: false) }
          end

          describe '#background_keys' do
            subject { instance.theme.background_keys }

            it { is_expected.to be_a(Array) }
          end

          describe '#favourite_background_keys' do
            subject { instance.theme.favourite_background_keys }

            it { is_expected.to be_a(Array).and include(:teal) }
            it { is_expected.not_to include(:navy) }
          end

          describe '#random_background_key' do
            subject { instance.theme.random_background_key }

            it { is_expected.to be_a(Symbol) }
          end
        end

        describe '#element' do
          context 'when element is defined' do
            subject { instance.theme.element(:style_30) }

            it { is_expected.to have_attributes(key: :style_30, fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#000000', gradient: '#b3b3b3') }
          end
          context 'when element is not defined' do
            subject { instance.theme.element(:unknown) }

            it { is_expected.to have_attributes(key: :unknown, fill_color: '#ffffff', stroke_color: '#000000', font_color: '#000000', gradient: nil) }
          end
        end

        describe '#random_element_key' do
          subject { instance.theme.random_element_key }

          it { is_expected.to be_a(Symbol) }
        end

        describe '#element_keys' do
          subject { instance.theme.element_keys }

          it { is_expected.to be_a(Array) }
        end
      end
    end
  end
end
