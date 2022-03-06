# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationShapes
    def add_shapes
      @shapes = Shapes.new(
        {{#each shapes}}
        {{snake ./type}}: ShapeDefaults.new(type: :{{snake ./type}}, x: {{./x}}, y: {{./y}}, w: {{./w}}, h: {{./h}}, style_modifiers: '{{{./style_modifiers}}}'){{#if @last}}{{^}},{{/if}}
        {{/each}}
      )
    end
  end
end
