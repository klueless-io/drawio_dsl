# frozen_string_literal: true

# :nocov:
module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  module DomBuilderShapes
    {{#each shapes}}

    def add_{{snake ./key}}(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      {{snake ./key}} = DrawioDsl::Schema::{{camel ./key}}.new(current_page, **opts, &block)
      add_shape({{snake ./key}})
    end
    {{/each}}
  end
end
# :nocov: