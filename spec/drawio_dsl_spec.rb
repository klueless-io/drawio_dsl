# frozen_string_literal: true

RSpec.describe DrawioDsl do
  it 'has a version number' do
    expect(DrawioDsl::VERSION).not_to be nil
  end

  it 'has a standard error' do
    expect { raise DrawioDsl::Error, 'some message' }
      .to raise_error('some message')
  end
end
