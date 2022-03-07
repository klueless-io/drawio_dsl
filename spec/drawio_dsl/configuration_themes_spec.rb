# frozen_string_literal: true

RSpec.describe DrawioDsl::ConfigurationThemes do
  let(:instance) { Class.new { extend DrawioDsl::ConfigurationThemes } }

  describe '.themes' do
    subject { instance.themes }

    it { is_expected.to be_nil }

    context 'when themes are added' do
      before do
        instance.add_themes
      end

      it { is_expected.not_to be_nil }

      context 'check one of the themes' do
        subject { instance.themes[:style_01] }

        it { is_expected.to have_attributes(fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#333333', gradient: be_nil) }
      end
    end
  end
end
