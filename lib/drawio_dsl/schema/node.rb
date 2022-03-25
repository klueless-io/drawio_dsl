# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Node is a base class for shapes, connections, positioners and layout rules
    #
    class Node
      attr_accessor :id
      attr_accessor :page
      attr_accessor :parent
      attr_accessor :classification
      attr_accessor :key
      attr_accessor :nodes

      def initialize(page, **args)
        @page = page
        @id = args[:id]
        @parent = args[:parent]
        @classification = args[:classification] || :unknown
        @key = args[:key] || :unknown
        @nodes = NodeList.new
      end

      def to_h
        result = {
          id: id,
          parent_id: parent&.id,
          classification: classification,
          key: key
        }
        result[:nodes] = nodes.to_h if nodes.any?
        result
      end

      def root?
        parent.nil? || parent.is_a?(DrawioDsl::Schema::Page)
      end

      def add_node(node)
        @nodes.add(self, node)
        node
      end

      # :nocov:
      # rubocop:disable Metrics/AbcSize
      def debug(format: :detail)
        if format == :detail
          debug_detail(to_h)
        else
          debug_row(classification, id)
        end
      end

      def debug_detail(**key_values)
        key_values.each do |key, value|
          puts "#{key.to_s.ljust(15)}: #{value}"
        end
      end

      # rubocop:disable Metrics/ParameterLists
      def debug_row(classification, id, key = nil, x = nil, y = nil, width = nil, height = nil)
        row = []
        row << classification.to_s.ljust(11)
        row << id.to_s.ljust(6)
        row << (key.nil? ? '' : key).to_s.ljust(15)
        row << (x.nil? ? '' : x).to_s.rjust(5)
        row << (y.nil? ? '' : y).to_s.rjust(5)
        row << (width.nil? ? '' : width).to_s.rjust(5)
        row << (height.nil? ? '' : height).to_s.rjust(5)
        puts row.join(' | ')
      end
      # rubocop:enable Metrics/ParameterLists
      # :nocov:
    end
    # rubocop:enable Metrics/AbcSize
  end
end
