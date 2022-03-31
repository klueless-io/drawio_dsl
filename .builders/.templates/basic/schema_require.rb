# frozen_string_literal: true

require_relative 'common_style'
require_relative 'default_palette'
require_relative 'diagram'
require_relative 'node'
require_relative 'node_list'
require_relative 'page'

require_relative 'layouts/layout'
require_relative 'layouts/flex_layout'
require_relative 'layouts/grid_layout'

require_relative 'style_builder'
require_relative 'shape'
require_relative 'element'
require_relative 'line'
require_relative 'text'

# Block elements such as actor, callout, square, circle, etc.
{{#each elements}}
require_relative 'elements/{{snake ./key}}'
{{/each}}

# Connector lines
{{#each lines}}
require_relative 'lines/{{snake ./key}}'
{{/each}}

# Text elements such as h1, h2, p, etc.
{{#each texts}}
require_relative 'texts/{{snake ./key}}'
{{/each}}

# Virtual elements have internal uses
require_relative 'virtual/anchor'
