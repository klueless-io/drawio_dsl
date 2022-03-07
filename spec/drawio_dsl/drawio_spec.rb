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

      it { is_expected.to be_a(DrawioDsl::DomBuilder) }
    end
  end

  describe '#page' do
    context 'with a block' do
      before do
        director.page('page1') do
          grid_layout
          square
          flex_layout
          circle
        end
      end

      context 'has a page' do
        subject { director.builder.diagram.pages.first }

        it { is_expected.to have_attributes(name: 'page1') }

        context 'with two shapes' do
          subject { director.builder.diagram.pages.first.shapes }

          it { is_expected.to have_attributes(count: 2) }
        end
      end
    end
  end

  context 'scenarios' do
    let(:config_key) { :drawio_sample_spec }

    before do
      director
        .diagram(
          theme: :style_01 # TODO
        )
        .page('Grid Layout Horizontal', margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 3, v_align: :bottom, h_align: :right)
          # square(title: '01')
          # circle(title: '02')
          # rectangle(title: '03')
          # ellipse(title: '04')
          # process(title: '05')
          diamond(title: '06')
          hexagon(title: '07')
          cloud(title: '08')
          note(title: '09')
          callout(title: '10')
        end

      # .page('Grid Layout Horizontal', margin_top: 0, margin_left: 0) do
      #   grid_layout(wrap_at: 3, v_align: :bottom, h_align: :right)
      #   square(title: 'Square')
      #   circle(title: 'Circle')
      #   rectangle(title: 'Rectangle')
      #   ellipse(title: 'Ellipse')
      #   process(title: 'Process')
      #   square
      #   circle
      #   rectangle
      #   ellipse
      #   process
      # end
      # .page('Grid Layout Vertical') do
      #   grid_layout(direction: :vertical)
      #   square(title: 'Square')
      #   circle(title: 'Circle')
      #   rectangle(title: 'Rectangle')
      #   ellipse(title: 'Ellipse')
      #   process(title: 'Process')
      #   square
      #   square
      #   square
      #   square
      #   square
      #   square
      #   square
      # end

      # .apply_layout
      # .page('Normal') do
      #   flex_layout
      #   square
      #   rectangle
      #   rectangle(rounded: 1)
      #   circle
      #   process
      #   ellipse
      # end
      # .page('Sketch', sketch: 1) do
      #   square
      #   rectangle
      #   rectangle(rounded: 1)
      #   circle
      #   process
      #   ellipse
      # end
      # .page('Shadow', shadow: 1) do
      #   square
      #   rectangle
      #   rectangle(rounded: 1)
      #   circle
      #   process
      #   ellipse
      # end
      # .page('Shadow+Sketch', shadow: 1, sketch: 1) do
      #   square
      #   rectangle
      #   rectangle(rounded: 1)
      #   circle
      #   process
      #   ellipse
      # end
      # .page('Round+Glass', glass: 1, rounded: 1) do
      #   square
      #   rectangle
      #   rectangle(rounded: 1)
      #   circle
      #   process
      #   ellipse
      # end
      # .page('All', shadow: 1, glass: 1, sketch: 1, rounded: 1) do
      #   square
      #   rectangle
      #   rectangle(rounded: 1)
      #   circle
      #   process
      #   ellipse
      # end

      # .cd(:samples)
      # .add('a.txt')
      # .play_actions
      # .build('xm')
    end

    it do
      json = JSON.pretty_generate(director.builder.diagram.to_h)
      build = DrawioDsl::XmlBuilder.new(director.builder.diagram).build
      File.write('spec/.samples/drawio/sample.json', json)
      File.write('spec/.samples/drawio/sample.xml', build)
      File.write('spec/.samples/drawio/sample.drawio', build)
    end
  end
end
