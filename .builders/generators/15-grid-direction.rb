KManager.action :bootstrap do
  action do

    # KConfig.configuration.drawio.square.w = KConfig.configuration.drawio.square.w / 4
    # KConfig.configuration.drawio.square.h = KConfig.configuration.drawio.square.h / 4
    # KConfig.configuration.drawio.circle.w = KConfig.configuration.drawio.circle.w / 4
    # KConfig.configuration.drawio.circle.h = KConfig.configuration.drawio.circle.h / 4
    # KConfig.configuration.drawio.rectangle.w = KConfig.configuration.drawio.rectangle.w / 4
    # KConfig.configuration.drawio.rectangle.h = KConfig.configuration.drawio.rectangle.h / 4

    director = DrawioDsl::Drawio
      .init(k_builder)
      .diagram(theme: :style_01)
      .page('Horizontal', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 3, direction: :horizontal)
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
        circle(title: '01')
        square(title: '02')
        circle(title: '03')
        square(title: '04')
        circle(title: '05')
        square(title: '06')
        circle(title: '07')
      end

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)

    File.write('../spec/.samples/drawio/15-grid-direction.xml', diagram.build)
    File.write('../spec/.samples/drawio/15-grid-direction.drawio', diagram.build)
  end
end
