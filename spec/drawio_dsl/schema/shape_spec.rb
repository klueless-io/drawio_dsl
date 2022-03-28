# frozen_string_literal: true

class Fake < DrawioDsl::Schema::Element
  configure_as(:actor)
end

RSpec.describe DrawioDsl::Schema::Shape do
  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }
  # let(:default) { KConfig.configuration.drawio.shapes.shape }

  let(:diagram_args) { {} }
  let(:diagram) { DrawioDsl::Schema::Diagram.new(**diagram_args) }

  let(:page_args) { {} }
  let(:page) { DrawioDsl::Schema::Page.new(diagram, **page_args) }

  shared_examples :configure_shape do
    before { described_class.configure_shape(name, category) }

    it 'sets the shape defaults' do
      expect(described_class.shape_defaults).not_to be_nil
    end

    it 'sets the shape key' do
      expect(described_class.shape_key).to eq(name)
    end

    it 'sets the shape category' do
      expect(described_class.shape_category).to eq(category)
    end
  end

  context 'class methods' do
    describe '.configure_shape' do
      context 'when shape is an element' do
        it_behaves_like :configure_shape do
          let(:name) { :square }
          let(:category) { :element }
        end

        # context 'when using base element class' do
        #   let(:instance) { DrawioDsl::Schema::Element.new(page) }
        #   fit do
        #     is_expected.to have_attributes(
        #       key: :square,
        #       x: 0,
        #       y: 0,
        #       w: 160,
        #       h: 160,
        #       style_modifiers: ''
        #     )
        #   end
        # end
      end

      context 'when shape is an line' do
        it_behaves_like :configure_shape do
          let(:name) { :solid }
          let(:category) { :line }
        end
      end

      context 'when shape is an text' do
        it_behaves_like :configure_shape do
          let(:name) { :h1 }
          let(:category) { :text }
        end
      end

      context 'when the shape is not found in the configuration' do
        let(:name) { :unknown }

        it 'sets the shape defaults' do
          expect(Fake.shape_defaults).not_to be_nil
        end
      end
    end
  end

  describe '.base_modifiers' do
    let(:instance) { Fake.new(diagram, **args) }

    subject { instance.base_modifiers }

    it { is_expected.to be_empty }
  end

  describe '.style' do
    subject { instance.style }

    let(:instance) { Fake.new(diagram, **args) }

    context 'when not present' do
      it do
        is_expected.to start_with("whiteSpace=#{page.style.white_space};html=#{page.style.html}")
      end
    end

    context 'when page style attributes are customized' do
      let(:args) { { white_space: 'xxx', html: 'xxx', rounded: 'xxx', shadow: 'xxx', sketch: 'xxx', glass: 'xxx' } }

      it do
        is_expected.to start_with('whiteSpace=xxx;html=xxx;rounded=xxx;shadow=xxx;sketch=xxx;glass=xxx')
      end
    end

    context 'when diagram style attributes are customized' do
      let(:diagram_args) { { white_space: 'yyy', html: 'yyy', rounded: 'yyy', shadow: 'yyy', sketch: 'yyy', glass: 'yyy' } }

      it do
        is_expected.to start_with('whiteSpace=yyy;html=yyy;rounded=yyy;shadow=yyy;sketch=yyy;glass=yyy')
      end
    end
  end

  describe '#format' do
    let(:instance) { Fake.new(diagram, **args) }

    context 'when format type is unknown' do
      subject { instance.format(:unknown) }

      it { is_expected.to be_a(DrawioDsl::Formatters::BaseFormatter) }

      describe '#as_html' do
        subject { instance.format(:unknown).as_html }

        it { is_expected.to be_a(String).and be_empty }
      end
    end

    context 'when format type is class' do
      subject { instance.format(:class) }

      it { is_expected.to be_a(DrawioDsl::Formatters::KlassFormatter) }

      describe '#as_html' do
        subject { instance.as_html }

        let(:instance) { Fake.new(diagram, **args).format(:class) }

        before { instance.header('hello world') }

        it { is_expected.to be_a(String).and eq('<p style="margin:0px;margin-left:4px;margin-bottom:4px;text-align:center"><b>hello world</b></p><hr size="1"/>') }
      end
    end

    context 'when format type is inferred from underlying shape' do
      let(:instance) { DrawioDsl::Schema::Interface.new(diagram) }

      subject { instance.format }

      it { is_expected.to be_a(DrawioDsl::Formatters::InterfaceFormatter) }
    end
  end
end
