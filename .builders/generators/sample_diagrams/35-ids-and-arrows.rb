KManager.action :bootstrap do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: KConfig.configuration.drawio.theme.random_element_key, bg_theme: :snow)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 2, grid_w: 120, grid_h: 180, direction: :vertical)

        shape_count = 2
        # for 1 to 20 step 2
        (1..shape_count).step(2).each do |i|
          circle(i, title: i, w: 100)
          ellipse(i+1, title: i + 1, w: 100)
        end

        (1..shape_count).step(2).each do |i|
          # line_type = KConfig.configuration.drawio.shape.random_line_key
          # send(line_type, source: i, target: i+1)
          # solid(source: i, target: i+1)
          # double_dashed(source: i, target: i+1)
          double(source: i, target: i+1, stroke: :dash, design: :fat1)
        end

      end
      .cd(:spec)
      .osave('.samples/35-ids-and-arrows.drawio')
  end
end
