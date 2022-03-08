# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Shape do
  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  let(:default) { KConfig.configuration.drawio.shapes.shape }

  let(:diagram_args) { {} }
  let(:diagram) { DrawioDsl::Schema::Diagram.new(**diagram_args) }

  let(:page_args) { {} }
  let(:page) { DrawioDsl::Schema::Page.new(diagram, **page_args) }

  context 'class methods' do
    describe '.configure_shape' do
      before { described_class.configure_shape(name) }

      context 'when the shape configuration is valid' do
        let(:name) { :square }

        it 'sets the shape defaults' do
          expect(described_class.shape_defaults).not_to be_nil
        end
      end

      context 'when the shape is not found in the configuration' do
        let(:name) { :unknown }

        it 'sets the shape defaults' do
          expect(described_class.shape_defaults).not_to be_nil
        end
      end
    end
  end

  context '.style' do
    subject { instance.style }

    context 'when not present' do
      it do
        is_expected.to start_with("whiteSpace=#{page.style.white_space};html=#{page.style.html}")
      end
    end

    context 'when page style attributes are customized' do
      let(:args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

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
