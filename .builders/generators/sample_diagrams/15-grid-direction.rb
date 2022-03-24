KManager.action :bootstrap do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_01)
      .page('Horizontal', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, direction: :horizontal)
        h4(title: 'Horizontal')
        circle(title: '01')
        square(title: '02')
        circle(title: '03')
        square(title: '04')
        circle(title: '05')
        square(title: '06')
        circle(title: '07')
      end
      .page('Vertical', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, direction: :vertical)
        h4(title: 'Vertical')
        circle(title: '01')
        square(title: '02')
        circle(title: '03')
        square(title: '04')
        circle(title: '05')
        square(title: '06')
        circle(title: '07')
      end
      .cd(:spec)
      .save('.samples/15-grid-direction.drawio')
      .cd(:docs)
      .export_svg('samples/grid-direction-horizontal', page: 1)
      .export_svg('samples/grid-direction-vertical', page: 2)
  end
end
