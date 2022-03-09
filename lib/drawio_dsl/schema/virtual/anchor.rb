# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Provides an anchor point on the page for elements to hang from
    class Anchor < Node
      def initialize(page, **args)
        args[:classification] = :anchor
        super(page, **args)
      end

      # xml.mxCell(id: "#{page.id}-A")
      # xml.mxCell(id: "#{page.id}-B", parent: "#{page.id}-A")

      def as_xml(xml)
        if parent
          xml.mxCell(id: id, parent: parent.id)
        else
          xml.mxCell(id: id)
        end
      end
    end
  end
end
