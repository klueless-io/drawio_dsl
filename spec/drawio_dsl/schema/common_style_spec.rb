# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::CommonStyle do
  subject { instance }

  let(:instance) { described_class.new(**args, &block) }
  let(:args) { {} }
  let(:block) { nil }

  it do
    is_expected.to have_attributes(
      white_space: nil,
      html: nil,
      rounded: nil,
      shadow: nil,
      glass: nil,
      sketch: nil
    )
  end

  context 'with valid attributes' do
    let(:args) do
      {
        white_space: :wrap,
        html: 1,
        rounded: 1,
        shadow: 1,
        glass: 1,
        sketch: 1
      }
    end

    it do
      is_expected.to have_attributes(
        white_space: :wrap,
        html: 1,
        rounded: 1,
        shadow: 1,
        glass: 1,
        sketch: 1
      )
    end
  end

  context 'with block override' do
    let(:block) do
      proc do
        self.white_space = 0
        self.html = 0
        self.rounded = 0
        self.shadow = 0
        self.glass = 0
        self.sketch = 0
        puts 'just finished'
      end
    end

    it do
      puts 'before'

      is_expected.to have_attributes(
        white_space: 0,
        html: 0,
        rounded: 0,
        shadow: 0,
        glass: 0,
        sketch: 0
      )
    end
  end
end
