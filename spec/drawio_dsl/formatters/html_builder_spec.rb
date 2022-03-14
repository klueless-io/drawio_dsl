# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::HtmlBuilder do
  subject { instance }

  let(:instance) { described_class.new }

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }
  end

  context '#empty?' do
    it { is_expected.to be_empty }

    context 'when lines are added' do
      before { instance.add_line('foo') }

      it { is_expected.not_to be_empty }
    end
  end

  context '.element_style_defaults' do
    subject { instance.element_style_defaults }

    it { is_expected.to be_a(Hash) }
    it { is_expected.to be_empty }

    context '#default_for' do
      subject { instance.default_for(tag) }

      let(:tag) { :p }

      context 'when configuration is not provided for tag' do
        it { is_expected.to be_empty }
      end

      context 'when configuration for tag is provided' do
        let(:instance) { described_class.new(p: { margin_top: '4px' }) }

        it { is_expected.to eq(margin_top: '4px') }
      end
    end
  end

  describe '.as_html' do
    subject { instance.as_html }

    it { is_expected.to be_empty }

    context 'when call #add_line once' do
      before { instance.add_line('<p>') }

      it { is_expected.to eq('<p>') }

      context 'when call #add_line twice' do
        before { instance.add_line('</p>') }

        it { is_expected.to eq('<p></p>') }

        context 'when html(new_line: true)' do
          subject { instance.as_html(new_line: true) }

          it { is_expected.to eq("<p>\n</p>") }
        end
      end
    end

    context 'when call #hr' do
      before { instance.hr }

      it { is_expected.to eq('<hr size="1"/>') }
    end

    context 'when call #p' do
      before { instance.p('hello world') }

      it { is_expected.to eq('<p>hello world</p>') }
    end

    context 'when calling #p with defaults pre-configured for p' do
      let(:instance) { described_class.new(p: { margin: '0px', margin_top: '4px' }) }

      before { instance.p('hello world') }

      it { is_expected.to eq('<p style="margin:0px;margin-top:4px">hello world</p>') }
    end

    context 'when call #p with custom attribute' do
      before { instance.p('hello world', text_align: :center) }

      it { is_expected.to eq('<p style="text-align:center">hello world</p>') }
    end

    context 'when call #p with defaults and custom attribute' do
      let(:instance) { described_class.new(p: { margin: '0px', margin_top: '4px' }) }

      before { instance.p('hello world', text_align: :center) }

      it { is_expected.to eq('<p style="margin:0px;margin-top:4px;text-align:center">hello world</p>') }
    end

    context 'when call #b' do
      before { instance.b('hello world') }

      it { is_expected.to eq('<b>hello world</b>') }
    end

    context 'when using groups' do
      before do
        instance.group(:fields).p('field1')
        instance.p('Heading')
        instance.add_placeholder(:fields)
        instance.p('Footer')
        instance.group(:fields).p('field2')
      end

      it {
        is_expected.to eq('<p>Heading</p><p>field1</p><p>field2</p><p>Footer</p>')
      }
    end
  end
end
