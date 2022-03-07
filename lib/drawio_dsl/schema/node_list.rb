# frozen_string_literal: true

module DrawioDsl
  module Schema
    class NodeList
      attr_reader :nodes

      def initialize
        @nodes = []
      end

      def add(node)
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

      def to_h
        @nodes.map(&:to_h)
      end
    end
  end
end
