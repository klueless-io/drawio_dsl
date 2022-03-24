KManager.action :bootstrap do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_01)
      .page('PgMargin-default') do
        grid_layout(wrap_at: 4)
        square(title: 'Page Margin 50, 50 (Default)')
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('PgMargin-0-0', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 4)
        square(title: 'Page Margin 0, 0')
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('PgMargin-90-70', margin_left: 90, margin_top: 70) do
        grid_layout(wrap_at: 4)
        square(title: 'Page Margin 90, 70')
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .cd(:spec)
      .osave('.samples/10-page-margin.drawio')
  end
end
