# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::DefaultPalette do
  subject { instance }

  let(:diagram_args) { { theme: :style_01 } }
  let(:diagram) { DrawioDsl::Schema::Diagram.new(**diagram_args) }

  let(:instance) { described_class.new(diagram, **args, &block) }
  let(:args) { {} }
  let(:block) { nil }

  it do
    is_expected.to have_attributes(
      fill_color: nil,
      stroke_color: nil,
      font_color: nil,
      gradient: nil
    )
  end

  context 'with valid attributes' do
    let(:args) do
      {
        fill_color: '#aaffff',
        stroke_color: '#bbffff',
        font_color: '#ccffff',
        gradient: '#ddffff'
      }
    end

    it do
      is_expected.to have_attributes(
        fill_color: '#aaffff',
        stroke_color: '#bbffff',
        font_color: '#ccffff',
        gradient: '#ddffff'
      )
    end
  end

  context 'with block override' do
    let(:block) do
      proc do |diagram|
        theme_palette = KConfig.configuration.drawio.theme.element(diagram.theme)

        # Inherit from theme when specific palette options are not specified.
        @fill_color   ||= theme_palette.fill_color
        @stroke_color ||= theme_palette.stroke_color
        @font_color   ||= theme_palette.font_color
        @gradient     ||= theme_palette.gradient
      end
    end

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
