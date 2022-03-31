# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Build the style attribute for shape elements
    #
    # Requirements:
    #   Need to be able to take a string and break it up into style parts
    #   A style part is usually a lowerCamel equals value pair (e.g. fontSize=12)
    #   but sometimes it is just a singular value, (e.g. ellipse)
    #   A string may also contain more then one style part separated by semi-colons
    #   e.g. overflow=fill;fontSize=12;fontFamily=Helvetica
    #
    #   The purpose of this class is to build a style attribute with unique values and
    #   to take inputs from either single key/value pairs or string following the
    #   pattern previously described.
    class StyleBuilder
      def initialize
        @style_parts = []
      end

      def add(value)
        return if value.nil?

        if value.is_a?(Symbol)
          set(value)
          return
        end

        value.split(';') do |v|
          kv = v.to_s.split('=')

          if kv.length == 1
            set(v.to_s)
          else
            set_kv(kv[0], kv[1])
          end
        end
      end

      def add_kv(key, value)
        key = camel_case_lower(key) if key.is_a?(Symbol)

        set_kv(key, value)
      end

      def style
        @style_parts.join(';')
      end

      # def style_attribute
      #   style_value = style
      #   style_value.empty? ? nil : " style=\"#{style_value}\""
      # end

      private

      def camel_case_lower(key)
        key.to_s.split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
      end

      def set(value)
        value = value.to_s.strip
        index = @style_parts.index { |part| part == value }

        @style_parts << value if index.nil?
      end

      def set_kv(key, value)
        key = key.to_s.strip
        value = value.to_s.strip
        index = @style_parts.index { |part| part.start_with?("#{key}=") }

        if index.nil?
          @style_parts << "#{key}=#{value}"
        else
          @style_parts[index] = "#{key}=#{value}"
        end
      end
    end
  end
end
