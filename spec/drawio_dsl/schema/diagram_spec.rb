# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::Diagram do
  let(:instance) { DrawioDsl::Schema::Diagram.new(**args) }
  let(:args) { {} }

  context '.host' do
    subject { instance.host }

    it { is_expected.not_to be_nil }

    context 'when host is present' do
      let(:args) { { host: 'host' } }

      it { is_expected.to eq('host') }
    end
  end

  context '.theme' do
    subject { instance.theme }

    it { is_expected.not_to be_nil }
  end

  context '.bg_theme' do
    subject { instance.bg_theme }

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
      let(:args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

      it { is_expected.to have_attributes(white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx') }
    end
  end

  context '.palette' do
    subject { instance.palette }

    context 'when theme is present' do
      let(:args) { { theme: :style_01 } }

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

  describe '.to_h' do
    subject { instance.to_h }

    it { is_expected.not_to be_nil }
  end
end
