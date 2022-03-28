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

require_relative 'shape'
require_relative 'element'
require_relative 'line'
require_relative 'text'

# Block elements such as actor, callout, square, circle, etc.
require_relative 'elements/actor'
require_relative 'elements/actor2'
require_relative 'elements/callout'
require_relative 'elements/callout2'
require_relative 'elements/callout3'
require_relative 'elements/callout4'
require_relative 'elements/circle'
require_relative 'elements/cloud'
require_relative 'elements/container'
require_relative 'elements/container2'
require_relative 'elements/container3'
require_relative 'elements/container4'
require_relative 'elements/cross'
require_relative 'elements/envelop'
require_relative 'elements/database'
require_relative 'elements/db_json'
require_relative 'elements/diamond'
require_relative 'elements/document'
require_relative 'elements/ellipse'
require_relative 'elements/group'
require_relative 'elements/hexagon'
require_relative 'elements/interface'
require_relative 'elements/klass'
require_relative 'elements/note'
require_relative 'elements/process'
require_relative 'elements/rectangle'
require_relative 'elements/rectangle2'
require_relative 'elements/square'
require_relative 'elements/step'
require_relative 'elements/tick'
require_relative 'elements/todo'
require_relative 'elements/face'
require_relative 'elements/triangle'
require_relative 'elements/embed_row'
require_relative 'elements/embed_col50'
require_relative 'elements/embed_col200'

# Connector lines
require_relative 'lines/solid'
require_relative 'lines/dashed'
require_relative 'lines/dotted'
require_relative 'lines/dash_dot'
require_relative 'lines/dash_dot_dot'
require_relative 'lines/dot_dot_dot'
require_relative 'lines/long_dash'
require_relative 'lines/dash_long_dash'
require_relative 'lines/dashed24'
require_relative 'lines/dashed32'
require_relative 'lines/dashed44'

# Text elements such as h1, h2, p, etc.
require_relative 'texts/h1'
require_relative 'texts/h2'
require_relative 'texts/h3'
require_relative 'texts/h4'
require_relative 'texts/h5'
require_relative 'texts/h6'
require_relative 'texts/p'

# Virtual elements have internal uses
require_relative 'virtual/anchor'
