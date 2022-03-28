# frozen_string_literal: true

module DrawioDsl
  module Schema
    class DoubleDot < Line
      configure_as(:double_dot, stroke: :dot, design: :double)
    end
  end
end
