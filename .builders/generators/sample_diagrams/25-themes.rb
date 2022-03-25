KManager.action :themes do
  action do

    # :rounded, :shadow, :sketch, :glass
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_06)
      .page('Squares', margin_left: 0, margin_top: 0, rounded: 1, background: '#FFEADB') do
        grid_layout(wrap_at: 8)

        KConfig.configuration.drawio.theme.element_keys.each do |theme|
          square(title: theme.to_s, theme: theme)
        end
      end
      .page('Circles', margin_left: 0, margin_top: 0, rounded: 1, background: '#FFEADB') do
        grid_layout(wrap_at: 8)

        KConfig.configuration.drawio.theme.element_keys.each do |theme|
          circle(title: theme.to_s, theme: theme)
        end
      end
      .page('Randoms', margin_left: 0, margin_top: 0, rounded: 1, background: '#FFEADB') do
        grid_layout(wrap_at: 8)

        KConfig.configuration.drawio.theme.element_keys.each do |theme|
          random(title: theme.to_s, theme: theme)
        end
      end
      .cd(:spec)
      .osave('.samples/25-themes.drawio')
      .cd(:docs)
      .export_svg('samples/themes-square', page: 1)
      .export_svg('samples/themes-circle', page: 2)
      .export_svg('samples/themes-random', page: 3)

  end
end
