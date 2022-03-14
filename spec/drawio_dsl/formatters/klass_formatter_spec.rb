# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::KlassFormatter do
  subject { instance }

  let(:instance) { described_class.new }

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }
  end
end
