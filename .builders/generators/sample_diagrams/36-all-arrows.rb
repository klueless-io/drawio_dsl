KManager.action :all_arrows do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: KConfig.configuration.drawio.theme.random_element_key, bg_theme: :snow)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        # grid_layout(wrap_at: 2, grid_w: 120, grid_h: 200, direction: :vertical)
        grid_layout(wrap_at: 10, grid_w: 170, grid_h: 120)

        KConfig.configuration.drawio.connector.arrow_keys.each_with_index do |arrow_key, index|
          circle(index, title: arrow_key, h: 100, w: 100)
          ellipse(index+100, title: arrow_key, h: 100, w: 150)
        end

        KConfig.configuration.drawio.connector.arrow_keys.each_with_index do |arrow_key, index|
          solid(
            source: index,
            target: index+100,
            start_point: :e,
            end_point: :w,
            start_arrow: arrow_key,
            end_arrow: arrow_key)
        end

      end
      .cd(:spec)
      .osave('.samples/36-all-arrows.drawio')
  end
end


KManager.opts.exception_style             = :long