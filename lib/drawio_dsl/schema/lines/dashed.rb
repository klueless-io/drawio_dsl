# frozen_string_literal: true

module DrawioDsl
  module Schema
    class Dashed < Line
      configure_as(:dashed, stroke: :dashed)
    end
  end
end
