# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel text.key}} < Text
      configure_as(:{{snake text.key}})
    end
  end
end
