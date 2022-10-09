# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::KlassFormatter do
  subject { instance }

  let(:instance) { described_class.new }

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }
  end

  context '#header' do
    let(:name) { 'MyClass' }
    let(:description) { 'My description' }
    let(:namespace) { 'My::Namespace' }
    let(:args) { {} }

    describe '.items.first' do
      subject { instance.items.first }

      before { instance.header(name, description: description, namespace: namespace, **args) }

      it { expect(subject).to include(type: :class, name: name, description: description, namespace: namespace) }

      context 'with args' do
        let(:args) { { foo: 'bar' } }

        it { expect(subject).to include(type: :class, name: name, description: description, namespace: namespace, foo: 'bar') }
      end
    end
  end
end
