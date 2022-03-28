# frozen_string_literal: true

module DrawioDsl
  module Schema
    class Dot < Line
      configure_as(:dot, stroke: :dot)
    end
  end
end
