# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Node is a base class for shapes, connections, positioners and layout rules
    #
    class Node
      attr_accessor :id
      attr_accessor :page
      attr_accessor :classification

      def initialize(page, **args)
        @page = page
        @id = args[:id]
        @classification = args[:classification] || :unknown
      end

      def to_h
        {
          id: id,
          classification: classification
        }
      end

      #   def debug(format: :detail)
      #     if format == :detail
      #       debug_detail(to_h)
      #     else
      #       debug_row(classification, id)
      #     end
      #   end

      #   def debug_detail(**key_values)
      #     key_values.each do |key, value|
      #       puts "#{key.to_s.ljust(15)}: #{value}"
      #     end
      #   end

      #
      #   def debug_row(classification, id, type = nil, x = nil, y = nil, width = nil, height = nil)
      #     row = []
      #     row << classification.to_s.ljust(11)
      #     row << id.to_s.ljust(6)
      #     row << (type.nil? ? '' : type).to_s.ljust(15)
      #     row << (x.nil? ? '' : x).to_s.rjust(5)
      #     row << (y.nil? ? '' : y).to_s.rjust(5)
      #     row << (width.nil? ? '' : width).to_s.rjust(5)
      #     row << (height.nil? ? '' : height).to_s.rjust(5)
      #     puts row.join(' | ')
      #   end
    end
  end
end
