# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel shape.type}} < Shape
      configure_shape(:{{snake shape.type}})
    end
  end
end
