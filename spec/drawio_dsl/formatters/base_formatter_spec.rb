# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::BaseFormatter do
  subject { instance }

  let(:instance) { described_class.new }

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }
  end

  context 'when building some HTML' do
    subject { instance.as_html }

    before do
      instance.html.add_line('<p>')
      instance.html.add_line('hello world')
      instance.html.add_line('</p>')
      instance.html.p('hello world')
    end

    it { is_expected.to eq('<p>hello world</p><p>hello world</p>') }
  end

  describe '#items' do
    subject { instance.items }

    it { is_expected.to eq([]) }

    context 'when adding some items' do
      before do
        instance.hr
        instance.b('be bold')
        instance.p('hello world')
        instance.h1('main heading')
        instance.h2('sub heading')
        instance.h3('sub sub heading')
        instance.h4('sub sub sub heading')
        instance.h5('sub sub sub sub heading')
        instance.h6('sub sub sub sub sub heading')
      end

      it do
        is_expected.to eq(
          [
            { type: :hr },
            { type: :b, content: 'be bold' },
            { type: :p, content: 'hello world' },
            { type: :h1, content: 'main heading' },
            { type: :h2, content: 'sub heading' },
            { type: :h3, content: 'sub sub heading' },
            { type: :h4, content: 'sub sub sub heading' },
            { type: :h5, content: 'sub sub sub sub heading' },
            { type: :h6, content: 'sub sub sub sub sub heading' }
          ]
        )
      end
    end
  end
end
