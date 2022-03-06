KManager.action :bootstrap do
  action do
    director = DrawioDsl::Drawio
      .init(k_builder)
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

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)


    File.write('../spec/.samples/drawio/10-page-margin.xml', diagram.build)
    File.write('../spec/.samples/drawio/10-page-margin.drawio', diagram.build)
  end
end
