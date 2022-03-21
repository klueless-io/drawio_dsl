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

      # if last_save_file_name is nil then you are not in execute mode
      @last_save_file_name = k_builder.last_output_file

      self
    end

    def osave(file_name, **opts)
      save(file_name, **{ open: :write }.merge(opts))
    end

    def save_json(file_name, **opts)
      return unless last_save_file_name
      return unless File.exist?(last_save_file_name)

      file_name = "#{file_name}.json" unless file_name.end_with?('.json')

      add(file_name, content: JSON.pretty_generate(builder.dom), **opts)

      self
    end

    def osave_json(file_name, **opts)
      save_json(file_name, **{ open: :write }.merge(opts))
    end

    def export_svg(output_file_name, page: 1)
      return unless last_save_file_name
      return unless File.exist?(last_save_file_name)

      page -= 1 # use zero based index

      output_file_name = "#{output_file_name}.svg" unless output_file_name.end_with?('.svg')

      command = "/Applications/draw.io.app/Contents/MacOS/draw.io '#{last_save_file_name}' -p #{page} -x -o #{output_file_name}"

      run_command(command)

      self
    end

    def export_png(output_file_name, page: 1)
      return unless last_save_file_name
      return unless File.exist?(last_save_file_name)

      page -= 1 # use zero based index

      output_file_name = "#{output_file_name}.png" unless output_file_name.end_with?('.png')

      command = "/Applications/draw.io.app/Contents/MacOS/draw.io '#{last_save_file_name}' -p #{page} -x -o #{output_file_name}"

      run_command(command)

      self
    end
  end
end
