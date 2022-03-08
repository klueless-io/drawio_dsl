# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class Drawio < KDirector::Directors::BaseDirector
    default_builder_type(DrawioDsl::DomBuilder)

    attr_reader :last_save_file_name

    def diagram(**opts)
      builder.set_diagram(**opts)

      self
    end

    def page(name = nil, **opts, &block)
      page = DrawioDsl::DrawioPage.new(self, **opts.merge(name: name))
      page.instance_eval(&block) if block_given?

      layout = DrawioDsl::LayoutEngine.new(builder.current_page)
      layout.call
      self
    end

    def save(file_name, **opts)
      diagram = DrawioDsl::XmlBuilder.new(builder.diagram)

      add(file_name, content: diagram.build, **opts)

      @last_save_file_name = k_builder.last_output_file
  
      self
    end

    def osave(file_name, **opts)
      save(file_name, **{ open: :write    }.merge(opts))
    end

    def export_svg(output_file_name, page: 1)
      return unless last_save_file_name
      return unless File.exist?(last_save_file_name)

      page = page - 1 # use zero based index

      output_file_name = "#{output_file_name}.svg" unless output_file_name.end_with?('.svg')

      command = "/Applications/draw.io.app/Contents/MacOS/draw.io '#{last_save_file_name}' -p #{page} -x -o #{output_file_name}"

      run_command(command)

      self
    end

  end

  # DrawioDsl::DrawioPage is created when you call .page on the draw-io DSL.
  class DrawioPage < KDirector::Directors::ChildDirector
    include DrawioDsl::DrawioShapes

    def initialize(parent, **opts)
      super(parent, **opts)

      builder.add_page(**opts)
    end

    def grid_layout(**opts)
      builder.add_grid_layout(**opts)
    end

    def flex_layout(**opts)
      builder.add_flex_layout(**opts)
    end
  end
end
