KManager.action :themes_text_on_page do
  action do

    # :rounded, :shadow, :sketch, :glass
    drawio = DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_03)
      
      KConfig.configuration.drawio.themes.keys.each do |theme|
        drawio.page(theme.to_s, margin_left: 0, margin_top: 0, theme: theme) do
          grid_layout(wrap_at: 3)

          square
          h1(title: theme.to_s)
          h2(title: theme.to_s)
          h3(title: theme.to_s)
          h4(title: theme.to_s)
          h5(title: theme.to_s)
          h6(title: theme.to_s)
          p(title: theme.to_s)
        end
      end

    drawio
      .cd(:spec)
      .osave('.samples/26-themes-text-on-page.drawio')
      .cd(:docs)
      .export_svg('samples/themes-square', page: 1)
      .export_svg('samples/themes-circle', page: 2)
      .export_svg('samples/themes-random', page: 3)

  end
end
