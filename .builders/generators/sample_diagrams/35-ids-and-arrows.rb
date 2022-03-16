KManager.action :bootstrap do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_06)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 2)

        square(:a, title: '01')
        circle(:b, title: '02')
        rectangle(:c, title: '03')
        ellipse(:d, title: '04')
      end
      .cd(:spec)
      .osave('.samples/35-ids-and-arrows.drawio')
      # .cd(:docs)
      # .export_svg('samples/styles-plain', page: 1)
  end
end
