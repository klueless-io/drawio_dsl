# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel element.type}} < Element
      configure_as(:{{snake element.type}})
    end
  end
end
