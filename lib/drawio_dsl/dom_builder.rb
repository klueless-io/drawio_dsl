# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class DomBuilder
    include DomBuilderShapes

    attr_reader :actions
    attr_reader :last_action

    attr_reader :focus_node
    attr_reader :current_page

    # attr_reader :current_layout_rule
    # attr_reader :current_shape

    def initialize
      @actions = []
      @last_action = {}
    end

    def reset
      @actions = []
      @last_action = {}
      set_diagram
      # set_layout_engine
    end

    def queue_action(action)
      @actions << action
      @last_action = action
    end

    def set_diagram(**opts)
      @diagram = DrawioDsl::Schema::Diagram.new(**opts)
    end

    def diagram
      return @diagram if defined? @diagram

      set_diagram
    end

    # rubocop:disable Metrics/AbcSize
    def add_page(**opts)
      @current_page = DrawioDsl::Schema::Page.new(diagram, **opts)
      current_page.id = SecureRandom.alphanumeric(3) unless current_page.id

      # add anchor nodes
      page_anchor = DrawioDsl::Schema::Anchor.new(self, id: "page_root_#{current_page.id}", type: :page_root)
      node_anchor = DrawioDsl::Schema::Anchor.new(self, id: "node_root_#{current_page.id}", type: :node_root)
      page_anchor.add_node(node_anchor)

      @focus_node = node_anchor

      # page_anchor.nodes.add(node_anchor)
      current_page.add_node(page_anchor)

      diagram.pages << @current_page
      @current_page
    end
    # rubocop:enable Metrics/AbcSize

    # ----------------------------------------------------------------------
    # Layout provides rules for positioning components
    # ----------------------------------------------------------------------

    def add_grid_layout(**opts)
      rule = DrawioDsl::Schema::GridLayout.new(current_page, **opts)
      add_layout(rule)
    end

    def add_flex_layout(**opts)
      rule = DrawioDsl::Schema::FlexLayout.new(current_page, **opts)
      add_layout(rule)
    end

    def add_layout(rule)
      # @current_layout_rule = rule

      rule.id = "rule-#{current_page.nodes.length + 1}" unless rule.id

      # current_page.nodes.add(rule)
      focus_node.nodes.add(focus_node, rule)

      rule
    end

    # ----------------------------------------------------------------------
    # Shapes represent visual components
    # ----------------------------------------------------------------------

    def add_shape(shape)
      # @current_shape = shape

      shape.id = "#{current_page.id}-#{focus_node.nodes.length + 1}" unless shape.id

      # current_page.nodes.add(shape)
      focus_node.nodes.add(focus_node, shape)

      shape
    end

    # :nocov:
    def debug
      puts JSON.pretty_generate(actions)
      puts JSON.pretty_generate(diagram.to_h)
    end
    # :nocov:

    def dom
      diagram.to_h
    end
  end
end
