KManager.action :bootstrap do
  action do

    # KConfig.configuration.drawio.square.w = KConfig.configuration.drawio.square.w / 4
    # KConfig.configuration.drawio.square.h = KConfig.configuration.drawio.square.h / 4
    # KConfig.configuration.drawio.circle.w = KConfig.configuration.drawio.circle.w / 4
    # KConfig.configuration.drawio.circle.h = KConfig.configuration.drawio.circle.h / 4
    # KConfig.configuration.drawio.rectangle.w = KConfig.configuration.drawio.rectangle.w / 4
    # KConfig.configuration.drawio.rectangle.h = KConfig.configuration.drawio.rectangle.h / 4

    director = DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_01)
      .page('Grid-Center', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Grid-Top', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, v_align: :top, h_align: :center)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Grid-Bottom', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, v_align: :bottom, h_align: :center)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Grid-Left', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, v_align: :center, h_align: :left)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Grid-Right', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, v_align: :center, h_align: :right)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .cd(:spec)
      .save('.samples/16-grid-alignment.drawio')
      .cd(:docs)
      # note: there is no difference between center and top/bottom/left/right using SVG/PNG
      .export_svg('samples/grid-alignment', page: 1)
  end
end
