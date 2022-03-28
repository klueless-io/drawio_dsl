# frozen_string_literal: true

module DrawioDsl
  module Schema
    class DoubleDash < Line
      configure_as(:double_dash, stroke: :dash, design: :double)
    end
  end
end
