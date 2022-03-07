# frozen_string_literal: true

# :nocov:
module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  module DomBuilderShapes
    {{#each shapes}}

    def add_{{snake ./type}}(**opts)
      {{snake ./type}} = DrawioDsl::Schema::{{camel ./type}}.new(current_page, **opts)
      add_shape({{snake ./type}})
    end
    {{/each}}
  end
end
# :nocov: