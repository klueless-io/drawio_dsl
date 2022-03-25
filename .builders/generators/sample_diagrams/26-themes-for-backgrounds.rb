KManager.action :themes_for_backgrounds do
  action do

    favourites = KConfig.configuration.drawio.theme.favourite_background_keys
    all = KConfig.configuration.drawio.theme.background_keys.each_slice(15).to_a.take(2)
    groups = [favourites] + all

    groups.each_with_index do |group, index|
      drawio = DrawioDsl::Drawio
        .init(k_builder, on_exist: :write, on_action: :execute)
        .diagram

      group.each do |theme|
        drawio
          .page(theme.to_s, margin_left: 0, margin_top: 0, bg_theme: theme) do
          grid_layout(wrap_at: 2, grid_w: 500, grid_h: 120)

          h1(title: theme.to_s)
          h6(title: theme.to_s)
          h2(title: theme.to_s)
          h5(title: theme.to_s)
          h3(title: theme.to_s)
          h4(title: theme.to_s)
          p(title: theme.to_s)
          square(w:90, h: 90, theme: theme)
          
          grid_layout(wrap_at: 6, grid_w: 140, grid_h: 100)
          square(w:90, h: 90)
          circle(w:90, h: 90)
          actor(w:90, h: 90)
          tick(w:90, h: 90)
          cross(w:90, h: 90)
          cloud(w:90, h: 90)
        end
      end

      drawio
        .cd(:spec)
        .osave(".samples/26-themes-text-on-page-set-#{index}#{index == 0 ? '-favourite' : ''}.drawio")
    end
  end
end
