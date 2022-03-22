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

        it { is_expected.to have_attributes(fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#333333', gradient: be_nil) }
      end

      describe '.random_theme' do
        subject { instance.random_theme }

        it { is_expected.to be_a(Symbol) }
      end

      describe '#palette' do
        subject { instance.palette(:style_01) }

        it { is_expected.to have_attributes(fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#333333', gradient: be_nil) }
      end
    end
  end
end
