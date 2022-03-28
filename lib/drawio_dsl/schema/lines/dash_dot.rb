# frozen_string_literal: true

module DrawioDsl
  module Schema
    class DashDot < Line
      configure_as(:dash_dot, stroke: :dash_dot)
    end
  end
end
