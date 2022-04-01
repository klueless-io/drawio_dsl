KManager.action :bootstrap do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_01)
      .page('Horizontal', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, direction: :horizontal)
        h4(title: 'Horizontal')
        circle(:a, title: '01')
        square(:b, title: '02')
        solid(source: :a, target: :b, exit_point: :e, entry_point: :w)
        circle(:c, title: '03')
        solid(source: :b, target: :c, exit_point: :sw, entry_point: :ne)
        square(:d, title: '04', w: 100, h: 100)
        solid(source: :c, target: :d, exit_point: :e, entry_point: :w)
        circle(:e, title: '05')
        solid(source: :d, target: :e, exit_point: :e, entry_point: :w)
        square(:f, title: '06')
        solid(source: :e, target: :f, exit_point: :sw, entry_point: :ne)
        circle(:g, title: '07')
        solid(source: :f, target: :g, exit_point: :e, entry_point: :w)
      end
      .page('Vertical', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, direction: :vertical)
        h4(title: 'Vertical')
        circle(:a, title: '01')
        square(:b, title: '02')
        solid(source: :a, target: :b, exit_point: :s, entry_point: :n)
        circle(:c, title: '03')
        solid(source: :b, target: :c, exit_point: :ne, entry_point: :sw)
        square(:d, title: '04', w: 100, h: 100)
        solid(source: :c, target: :d, exit_point: :s, entry_point: :n)
        circle(:e, title: '05')
        solid(source: :d, target: :e, exit_point: :s, entry_point: :n)
        square(:f, title: '06')
        solid(source: :e, target: :f, exit_point: :ne, entry_point: :sw)
        circle(:g, title: '07')
        solid(source: :f, target: :g, exit_point: :s, entry_point: :n)
      end
      .cd(:spec)
      .osave('.samples/15-grid-direction.drawio')
      .cd(:docs)
      .export_svg('samples/grid-direction-horizontal', page: 1)
      .export_svg('samples/grid-direction-vertical', page: 2)
  end
end
