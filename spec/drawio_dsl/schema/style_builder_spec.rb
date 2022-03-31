# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::StyleBuilder do
  subject { instance.style }

  let(:instance) { described_class.new }

  describe '#initialize' do
    context '.style' do
      it { is_expected.to be_empty }
    end
  end

  describe '#add' do
    before { instance.add(value) }

    context 'with nil' do
      let(:value) { nil }

      it { is_expected.to be_empty }
    end

    context 'when simple value is provided' do
      let(:value) { 'hello' }

      it { is_expected.to eq('hello') }
    end

    context 'when multiple values provided' do
      let(:value) { 'hello ; world ; hello' }

      it { is_expected.to eq('hello;world') }
    end

    context 'when a key/value pair is provided' do
      let(:value) { 'hello=world' }

      it { is_expected.to eq('hello=world') }
    end

    context 'when multiple key/value pairs are provided' do
      let(:value) { 'hello=world;foo=bar' }

      it { is_expected.to eq('hello=world;foo=bar') }
    end

    context 'when multiple key/value pairs are provided with duplication' do
      let(:value) { 'hello=world;foo=bar;hello=bar' }

      it { is_expected.to eq('hello=bar;foo=bar') }
    end
  end

  describe '#add_kv' do
    context 'with a (symbol) :key and value' do
      let(:key) { :some_key }
      let(:value) { :some_value }

      before { instance.add_kv(key, value) }

      it { is_expected.to eq('someKey=some_value') }
    end

    context 'with a (string) key and value' do
      let(:key) { 'sOmE_Key' }
      let(:value) { :some_value }

      before { instance.add_kv(key, value) }

      it { is_expected.to eq('sOmE_Key=some_value') }
    end

    context 'when key already exists' do
      let(:key) { :some_key }

      before do
        instance.add_kv(key, 111)
        instance.add_kv(key, 222)
      end

      it { is_expected.to eq('someKey=222') }
    end

    context 'when adding multiple key/value pairs' do
      before do
        instance.add_kv(:some_key, 111)
        instance.add_kv(:some_other_key, 222)
      end

      it { is_expected.to eq('someKey=111;someOtherKey=222') }
    end
  end
end
