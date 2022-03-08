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

require_relative 'shapes/shape'
{{#each shapes}}
require_relative 'shapes/{{snake ./type}}'
{{/each}}