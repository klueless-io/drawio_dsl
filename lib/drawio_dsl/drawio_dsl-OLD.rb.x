# frozen_string_literal: true

module KDirector
  module Dsls
    class DrawioXmlBuilder
      include KLog::Logging

      attr_reader :host
      attr_reader :pages

      attr_reader :current_id
      attr_reader :row_index
      attr_reader :row_offset

      def initialize(opts, dom)
        @host = opts[:host] || SecureRandom.alphanumeric(4)
        @pages = dom[:pages] || []
        # puts JSON.pretty_generate(dom)

        @current_id = 10
        @row_index  = 0
        @row_offset = 0
      end

      def build
        xml_builder = Nokogiri::XML::Builder.new do |xml|
          xml.mxfile(host: host) do
            page_index = 0
            pages.each do |page|
              build_page(xml, page, page_index)
              page_index += 1
            end
          end
        end

        xml_builder.to_xml.sub('<?xml version="1.0"?>', '').strip
      end

      private

      def next_id
        result = @current_id
        @current_id += 1
        result
      end

      def next_row
        @row_index += 150
      end

      def current_row_index
        row_index + row_offset
      end

      def reset_row
        @row_index = 0
      end

      def random_text
        return '' if rand(5) == 1

        words = %w[
          substantial
          humor
          jeans
          hover
          encouraging
          glue
          used
          statuesque
          umbrella
          vigorous
          horses
          outgoing
        ]

        # return a random word
        words.sample
      end

      def element_color
        element_colors = %w[
          fillColor=#d0cee2;strokeColor=#56517e;fontColor=#333333;
          fillColor=#FFCCCC;strokeColor=#36393D;fontColor=#333333;
          fillColor=#CDEB8B;strokeColor=#36393D;fontColor=#333333;
          fillColor=#FFFF88;strokeColor=#36393D;fontColor=#333333;
          fillColor=#CCE5FF;strokeColor=#36393D;fontColor=#333333;
          fillColor=#FFCC99;strokeColor=#36393D;fontColor=#333333;
          fillColor=#F9F7ED;strokeColor=#36393D;fontColor=#333333;
          fillColor=#EEEEEE;strokeColor=#36393D;fontColor=#333333;
          fillColor=#BAC8D3;strokeColor=#23445D;fontColor=#333333;
          fillColor=#D0CEE2;strokeColor=#56517E;fontColor=#333333;
          fillColor=#B1DDF0;strokeColor=#10739E;fontColor=#333333;
          fillColor=#B0E3E6;strokeColor=#0E8088;fontColor=#333333;
          fillColor=#FAD9D5;strokeColor=#AE4132;fontColor=#333333;
        ]

        # return a random color
        element_colors.sample
        # nil
      end

      def build_page(xml, page, page_index)
        page_id = SecureRandom.alphanumeric(3).to_s
        @row_offset = 50 # Random.rand(350)

        xml.diagram(id: page_id, name: page[:name]) do
          size_ratio = Random.rand(0.5..3.0)
          size_ratio = 2

          reset_row

          grid = 1
          element_style = ''

          case page_index
          when 1
            element_style = 'sketch=1'
            grid = 0
          when 2
            element_style = 'shadow=1'
          when 3
            element_style = 'sketch=1;shadow=1'
            grid = 0
          end

          # background = "##{SecureRandom.hex(3)}"
          background = '#FFFACD'
          # background = nil

          # background="#FF99CC" backgroundImage="{&quot;src&quot;:&quot;data:page/id,AKs&quot;}" math="0" shadow="1"
          xml.mxGraphModel(dx: 800, dy: 583, background: background, grid: grid, gridSize: 10, guides: 1, tooltips: 1, connect: 1, arrows: 1, fold: 1, page: page_index, pageScale: 1, pageWidth: 1169,
                           pageHeight: 827, math: 0, shadow: 0) do
            xml.root do
              xml.mxCell(id: "#{page_id}-0")
              xml.mxCell(id: "#{page_id}-1", parent: "#{page_id}-0")

              # ------ Row 1 ------

              # Square
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text, style: "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 50  , y: size_ratio * current_row_index, width: size_ratio * 80, height: size_ratio * 80, as: 'geometry')
              end
              # Rectangle
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text, style: "rounded=0;whiteSpace=wrap;html=1;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 170 , y: size_ratio * current_row_index, width: size_ratio * 120, height: size_ratio * 60, as: 'geometry')
              end
              # Rectangle - Rounded
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text, style: "rounded=1;whiteSpace=wrap;html=1;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 330 , y: size_ratio * current_row_index, width: size_ratio * 120, height: size_ratio * 60, as: 'geometry')
              end

              # ------ Row 2 ------

              next_row

              # Circle
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text, style: "ellipse;whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}",
                         vertex: '1') do
                xml.mxGeometry(x: size_ratio * 50  , y: size_ratio * current_row_index, width: size_ratio * 80, height: size_ratio * 80, as: 'geometry')
              end

              # Process
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text,
                         style: "shape=process;whiteSpace=wrap;html=1;aspect=fixed;backgroundOutline=1;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 170  , y: size_ratio * current_row_index, width: size_ratio * 120, height: size_ratio * 80, as: 'geometry')
              end

              # Ellipse
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text, style: "ellipse;whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}",
                         vertex: '1') do
                xml.mxGeometry(x: size_ratio * 330  , y: size_ratio * current_row_index, width: size_ratio * 120, height: size_ratio * 80, as: 'geometry')
              end

              # ------ Row 3 ------

              next_row

              # Rhombus
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text, style: "rhombus;whiteSpace=wrap;html=1;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 50 , y: size_ratio * current_row_index, width: size_ratio * 80, height: size_ratio * 80, as: 'geometry')
              end

              # Parallelogram
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text,
                         style: "shape=parallelogram;perimeter=parallelogramPerimeter;whiteSpace=wrap;html=1;fixedSize=1;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 170  , y: size_ratio * current_row_index, width: size_ratio * 120, height: size_ratio * 60, as: 'geometry')
              end

              # Hexagon
              xml.mxCell(id: "#{page_id}-#{next_id}", parent: "#{page_id}-1", value: random_text,
                         style: "shape=hexagon;perimeter=hexagonPerimeter2;whiteSpace=wrap;html=1;fixedSize=1;#{element_style};#{element_color}", vertex: '1') do
                xml.mxGeometry(x: size_ratio * 330  , y: size_ratio * current_row_index, width: size_ratio * 120, height: size_ratio * 80, as: 'geometry')
              end
            end
          end
        end
      end
    end

    # DrawioDsl is a DSL for draw-io diagrams.
    class DrawioDsl < KDirector::Directors::BaseDirector
      def default_template_base_folder
        'drawio'
      end

      def page(name = nil, **opts, &block)
        page = KDirector::Dsls::DrawioPage.new(self, **opts.merge(name: name))
        page.instance_eval(&block) if block_given?

        self
      end

      def create_diagram(name = nil, **opts)
        xml_builder = DrawioXmlBuilder.new(opts, builder.dom)
        add_file(name, content: xml_builder.build)
        play_actions

        self
      end
    end

    class DrawioPage < KDirector::Directors::ChildDirector
      attr_reader :name
      attr_reader :data

      def initialize(parent, **opts)
        super(parent, **opts)
        @name = opts[:name] || SecureRandom.alphanumeric(4)
        @data = { name: name, elements: [] }

        parent.builder.add(:pages, value: data) # , **repo_info_hash(**defaults))
      end

      def element(name = nil, **opts) # , &block)
        data[:elements] << opts.merge(name: name)
      end

      def square(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value
        element(:square, **opts.merge(style: style))
      end

      def rectangle(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1'

        # available params
        # x, :y, :width, :height, :value, :rounded
        element(:square, **opts.merge(style: style))
      end

      def circle(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value
        element(:circle, **opts.merge(style: style))
      end

      def process(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value

        element(:process, **opts.merge(style: style))
      end

      def ellipse(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value

        element(:ellipse, **opts.merge(style: style))
      end

      def interface(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value

        element(:ellipse, **opts.merge(style: style))
      end

      def object(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value

        element(:ellipse, **opts.merge(style: style))
      end

      def component(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value

        element(:ellipse, **opts.merge(style: style))
      end

      def package(_name = nil, **opts)
        # style = "whiteSpace=wrap;html=1;aspect=fixed;#{element_style};#{element_color}"
        style = 'whiteSpace=wrap;html=1;aspect=fixed'

        # available params
        # x, :y, :width, :height, :value

        element(:ellipse, **opts.merge(style: style))
      end

      def lines(name = nil, **opts); end
      def enum(name = nil, **opts); end
      def box(name = nil, **opts); end
      def down(name = nil, **opts); end
      def right(name = nil, **opts); end
      def left(name = nil, **opts); end
      def up(name = nil, **opts); end
    end
  end
end
