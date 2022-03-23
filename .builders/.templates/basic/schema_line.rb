# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel line.type}} < Line
      configure_as(:{{snake line.type}})
    end
  end
end
