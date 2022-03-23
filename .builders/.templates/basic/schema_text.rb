# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel text.type}} < Text
      configure_as(:{{snake text.type}})
    end
  end
end
