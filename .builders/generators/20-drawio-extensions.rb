KManager.action :transform_drawio_js do

  action do
    director = DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_10)

      ext = DrawioDsl::DrawioExtensions.new
      ext.build_extensions
      puts ext.sections.length

      ext.sections.select { |s| s[:active] }.each do |section|
        director.page(section[:name]) do
          grid_layout(wrap_at: 5)
          puts section[:name]
          puts section[:shapes]
          section[:shapes].select { |s| s[:active] }.each do |shape|
            square(title: shape[:name], style_modifiers: shape[:style])
            log.kv(:title, shape[:name])
            log.kv(:style, shape[:style])
          end
        end
      end
      director
        .cd(:spec)
        .save('.samples/20-extensions.drawio')
        .cd(:docs)

      markdown = "# Extensions\n\n"

      director.builder.diagram.pages.each_with_index do |page, index|
        page_no = index+1
        puts "Page #{page_no}, #{page.name}"
        # director.export_svg("extensions/#{page.name}", page: page_no)
        markdown += "## #{page.name}\n\n![](./extensions/#{page.name}.svg)\n\n"
      end

      director
        .add('extensions.md', content: markdown)
  end
end
