# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class XmlBuilder
    include KLog::Logging

    attr_reader :diagram

    def initialize(diagram)
      @diagram = diagram
    end

    def build
      xml_builder = Nokogiri::XML::Builder.new do |xml|
        build_diagram(xml)
      end
      xml_builder.to_xml.sub('<?xml version="1.0"?>', '').strip
    end

    private

    def build_diagram(xml)
      xml.mxfile(host: diagram.host) do
        diagram.pages.each do |page|
          build_page(xml, page)
        end
      end
    end

    # rubocop:disable  Metrics/MethodLength, Metrics/AbcSize
    def build_page(xml, page)
      xml.diagram(id: page.id, name: page.name) do
        xml.mxGraphModel(
          dx: 0,
          dy: 0,
          background: page.background,
          grid: page.grid,
          gridSize: page.grid_size,
          guides: page.guides,
          tooltips: page.tooltips,
          connect: page.connect,
          arrows: page.arrows,
          fold: page.fold,
          page: page.page_no,
          pageScale: page.page_scale,
          pageWidth: page.page_width,
          pageHeight: page.page_height,
          math: page.math,
          shadow: page.page_shadow
        ) do
          xml.root do
            # xml.mxCell(id: "#{page.id}-A")
            # xml.mxCell(id: "#{page.id}-B", parent: "#{page.id}-A")
            page.nodes.all.each do |node|
              # puts node.classification
              node.as_xml(xml) if %i[shape anchor].include?(node.classification)
            end
          end
        end
      end
    end
    # rubocop:enable  Metrics/MethodLength, Metrics/AbcSize
  end
end
