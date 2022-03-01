# frozen_string_literal: true

RSpec.describe DrawioDsl::Configuration do
  let(:instance) { described_class.new }

  subject { instance }

  it 'should be an instance of DrawioDsl::Configuration' do
    expect(instance).to be_a(described_class)
  end

  context 'should have configuration' do
    describe '#base_style' do
      subject { instance.base_style }

      it { is_expected.to have_attributes(white_space: :wrap, html: 1) }
    end

    context 'should have elements' do
      describe '.element' do
        subject { instance.element }

        it { is_expected.to have_attributes(type: :element, x: 0, y: 0, w: 20, h: 20, style_modifiers: '') }
      end

      %w[square rectangle circle process ellipse triangle parallelogram hexagon].each do |name|
        describe ".#{name}" do
          it { is_expected.to respond_to(name) }
        end
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
