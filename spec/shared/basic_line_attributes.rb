# frozen_string_literal: true

RSpec.shared_examples :basic_line_attributes do
  context 'with minimal valid attributes' do
    it { is_expected.to have_attributes(id: 1, type: default.type, x: default.x, y: default.y, w: default.w, h: default.h) }
  end

  context 'with valid attributes' do
    let(:args) { { id: 1, x: 10, y: 10, w: 100, h: 100 } }

    it { is_expected.to have_attributes(type: default.type, x: 10, y: 10, w: 100, h: 100) }
  end
end
