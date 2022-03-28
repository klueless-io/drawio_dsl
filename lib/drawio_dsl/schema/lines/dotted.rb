# frozen_string_literal: true

module DrawioDsl
  module Schema
    class Dotted < Line
      configure_as(:dotted, stroke: :dotted)
    end
  end
end
