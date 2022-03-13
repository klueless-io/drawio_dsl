# frozen_string_literal: true

module DrawioDsl
  module Schema
    class NodeList
      attr_reader :nodes

      def initialize
        @nodes = []
      end

      def add(parent, node)
        node.parent = parent
        @nodes << node
      end

      def all
        @nodes
      end

      def shapes
        @nodes.select { |node| node.is_a?(DrawioDsl::Schema::Shape) }
      end

      def layouts
        @nodes.select { |node| node.is_a?(DrawioDsl::Schema::Layout) }
      end

      def length
        @nodes.length
      end

      def empty?
        @nodes.empty?
      end

      def any?
        @nodes.any?
      end

      def first
        @nodes.first
      end

      def as_xml(xml)
        nodes.each do |node|
          node.as_xml(xml) if node.respond_to?(:as_xml)
        end
      end

      def to_h
        @nodes.map(&:to_h)
      end
    end
  end
end
