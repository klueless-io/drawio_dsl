KManager.action :ids_and_arrows do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: KConfig.configuration.drawio.theme.random_element_key, bg_theme: :snow)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        # grid_layout(wrap_at: 2, grid_w: 120, grid_h: 200, direction: :vertical)
        grid_layout(wrap_at: 10, grid_w: 160, grid_h: 120)

        shape_count = 20


        (1..shape_count).step(2).each do |i|
          circle(i, title: i, h: 100, w: 100)
          ellipse(i+1, title: i + 1, h: 100, w: 150)
        end

        (1..shape_count).step(2).each do |i|
          # line_type = KConfig.configuration.drawio.shape.random_line_key
          # waypoint = :straight
          waypoint = KConfig.configuration.drawio.connector.random_waypoint_key
          design = :single # :double
          start_point = :e
          end_point = :w
          start_arrow = KConfig.configuration.drawio.connector.random_arrow_key
          end_arrow = KConfig.configuration.drawio.connector.random_arrow_key
          # start_arrow = :box
          # end_arrow = :double_block
          stroke = :solid

          solid(
            source: i,
            target: i+1,
            stroke: stroke,
            design: design,
            start_point: start_point,
            end_point: end_point,
            start_arrow: start_arrow,
            end_arrow: end_arrow,
            waypoint: waypoint
          )
        end
      end
      .cd(:spec)
      .osave('.samples/35-ids-and-arrows.drawio')
  end
end


KManager.opts.exception_style             = :long