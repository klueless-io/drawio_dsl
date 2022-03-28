# frozen_string_literal: true

module DrawioDsl
  module Schema
    class Dash < Line
      configure_as(:dash, stroke: :dash)
    end
  end
end
