# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::InterfaceFormatter do
  subject { instance }

  let(:instance) { described_class.new }

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }
  end

  describe 'as_html' do
    subject { instance.as_html(new_line: true) }

    context 'when header only' do
      before do
        instance.header('IPerson')
      end

      # it { is_expected.to eq('<p >hello world</p>') }
      # it { is_expected.to eq('<p style="text-align:center"><i>Interface</i></p><p style="text-align:center"><i>IPerson</i></p>') }
      # it { is_expected.to eq('<p style="margin:0px;margin-top:4px">hello world</p>') }
      # it { File.write('spec/drawio_dsl/formatters/interface_formatter_spec.html', "<html>\n#{subject}\n</html>") }
    end

    context 'when header and fields' do
      before do
        instance.header('IPerson')
        instance.field(:first_name, type: :string)
        instance.field(:last_name, type: :string)
        instance.field(:age, type: :integer)
      end

      # it { is_expected.to eq('<p >hello world</p>') }
      # it { is_expected.to eq('<p style="text-align:center"><i>Interface</i></p><p style="text-align:center"><i>IPerson</i></p>') }
      # it { is_expected.to eq('<p style="margin:0px;margin-top:4px">hello world</p>') }
      # fit { File.write('spec/drawio_dsl/formatters/interface_formatter_spec.html', "<html>\n#{subject}\n</html>") }
    end

    context 'when header and fields and methods' do
      before do
        instance.header('IPerson')
        instance.field(:first_name, type: :string)
        instance.field(:last_name, type: :string)
        instance.field(:age, type: :integer)
        instance.method(:full_name)
      end

      # # it { is_expected.to eq('<p >hello world</p>') }
      # it { is_expected.to eq('<p style="text-align:center"><i>Interface</i></p><p style="text-align:center"><i>IPerson</i></p>') }
      # # it { is_expected.to eq('<p style="margin:0px;margin-top:4px">hello world</p>') }
      # fit { File.write('spec/drawio_dsl/formatters/interface_formatter_spec.html', "<html>\n#{subject}\n</html>") }
    end
  end
end
