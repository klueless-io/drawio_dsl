# frozen_string_literal: true

module DrawioDsl
  module Schema
    class {{camel line.key}} < Line
      configure_as(:{{snake line.key}}{{#if line.stroke}}, stroke: :{{line.stroke}}{{/if}})
    end
  end
end
