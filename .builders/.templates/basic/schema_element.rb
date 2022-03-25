# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel element.key}} < Element
      configure_as(:{{snake element.key}})
    end
  end
end
