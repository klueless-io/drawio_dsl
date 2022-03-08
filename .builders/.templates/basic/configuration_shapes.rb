# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
# :nocov:
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationShapes
    ShapeDefaults   = Struct.new(:type, :text_only, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
    Shapes = Struct.new(
      :shape,
      {{#each shapes}}
      :{{snake ./type}},
      {{/each}}
      keyword_init: true
    )

    def add_shapes
      @shapes = Shapes.new(
        shape: ShapeDefaults.new(type: :shape, text_only: false, x: 0, y: 0, w: 20, h: 20, style_modifiers: ''),
        {{#each shapes}}
        {{snake ./type}}: ShapeDefaults.new(type: :{{snake ./type}}, x: {{./x}}, text_only: {{./text_only}}, y: {{./y}}, w: {{./w}}, h: {{./h}}, style_modifiers: '{{{./style_modifiers}}}'){{#if @last}}{{^}},{{/if}}
        {{/each}}
      )
    end
  end
end
# :nocov:
