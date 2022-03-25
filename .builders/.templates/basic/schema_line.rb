# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel line.key}} < Line
      configure_as(:{{snake line.key}})
    end
  end
end
