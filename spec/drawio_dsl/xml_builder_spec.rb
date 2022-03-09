# frozen_string_literal: true

RSpec.describe DrawioDsl::XmlBuilder do
  let(:director) do
    DrawioDsl::Drawio
      .init(nil)
  end
  let(:instance) { described_class.new(director.builder.diagram) }
  let(:build) { instance.build }

  describe '#build' do
    subject { build }

    context 'when the builder is empty' do
      it { is_expected.to include('mxfile host') }
    end

    context 'when two blank pages are added' do
      before do
        director.page('Page 1', id: 'xxx')
        director.page('Page 2', id: 'yyy')
      end

      it do
        # puts subject
        is_expected
          .to include('mxfile host')
          .and match(/<diagram id="xxx" name="Page 1">/)
          .and match(/<mxCell id="page_root_xxx"\/>/)
          .and match(/<mxCell id="node_root_xxx"\/>/)
          .and match(/<diagram id="yyy" name="Page 2">/)
          .and match(/<mxCell id="page_root_yyy"\/>/)
          .and match(/<mxCell id="node_root_yyy"\/>/)
          .and match(/<mxGraphModel .* page="1" .*>/)
          .and match(/<root>/)
      end
    end

    context 'when nodes are added to page' do
      before do
        director.page('Page 1', id: 'xxx') do
          square
          circle
        end
      end

      it do
        # puts subject
        is_expected
          .to include('mxfile host')
          .and match(/<diagram id="xxx" name="Page 1">/)
          .and match(/<mxCell id="page_root_xxx"\/>/)
          .and match(/<mxCell id="node_root_xxx"\/>/)
          .and match(/<mxCell id="xxx-\d" value="" style="whiteSpace=wrap;html=1.*>/)
          .and match(/<mxCell id="xxx-\d" value="" style="ellipse.*>/)
      end
    end
  end

  context 'sample scenarios' do
    context 'basic scenario' do
      before do
        director
          .diagram(theme: :style_01)
          .page('Normal', page_shadow: 1) do
            square(title: 'Square')
            rectangle(title: 'Rectangle')
            rectangle(title: 'Rectangle (Rounded)', rounded: 1)
            circle(title: 'Circle')
            process(title: 'Process')
            ellipse(title: 'Ellipse')
          end
          .page('Sketch', sketch: 1) do
            square
            rectangle
            rectangle(rounded: 1)
          end
      end

      it do
        File.write('spec/.samples/drawio/basic.xml', build)
        File.write('spec/.samples/drawio/basic.drawio', build)
      end
    end
  end
end
