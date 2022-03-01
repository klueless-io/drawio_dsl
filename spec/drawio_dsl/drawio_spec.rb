# frozen_string_literal: true

KConfig.configure(:drawio_spec) do |config|
  base_folder = File.expand_path("#{Dir.tmpdir}/#{Time.now.to_i}#{rand(1000)}/")

  config.target_folders.add(:app, base_folder)
end

KConfig.configure(:drawio_sample_spec) do |config|
  folder = File.expand_path('spec/.samples/drawio', Dir.pwd)

  config.target_folders.add(:samples, folder)
end

RSpec.describe DrawioDsl::Drawio do
  let(:director) { described_class.init(k_builder, nil, **opts) }
  let(:k_builder) { KBuilder::BaseBuilder.init(KConfig.configuration(config_key)) }
  let(:config_key) { :drawio_spec }
  let(:opts) { {} }

  describe 'initialize' do
    describe '.k_builder' do
      subject { director.k_builder }

      it { is_expected.to eq(k_builder) }
    end

    describe '.builder' do
      subject { director.builder }

      it { is_expected.to be_a(DrawioDsl::Builder) }
    end
  end

  describe '#page' do
    context 'with name' do
      let(:name) { 'Normal' }

      before { director.page(name) }

      it {
        puts JSON.pretty_generate(director.builder.diagram.to_h)
      }

      # context 'with block' do
      #   subject { director.page(name) { square } }

      #   it { is_expected.to be_a(DrawioDsl::Page) }
      # end
    end
  end

  context 'scenarios' do
    before do
      director
        .diagram(
          theme: :style_01 # TODO
        )
        .page('Normal') do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Sketch', sketch: 1) do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Shadow', shadow: 1) do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Shadow+Sketch', shadow: 1, sketch: 1) do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Round+Glass', glass: 1, rounded: 1) do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('All', shadow: 1, glass: 1, sketch: 1, rounded: 1) do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
    end

    fit do
      puts JSON.pretty_generate(director.builder.diagram.to_h)
      File.write('/Users/davidcruwys/dev/kgems/drawio_dsl/spec/.samples/drawio/sample.json', JSON.pretty_generate(director.builder.diagram.to_h))
      # director.builder.debug
    end
  end
end
