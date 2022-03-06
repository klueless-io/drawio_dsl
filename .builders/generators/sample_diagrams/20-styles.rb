KManager.action :bootstrap do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder)
      .diagram(theme: :style_06)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 4)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Style-Shadow', shadow: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 4)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Style-Rounded', rounded: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 4)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Style-Glass', glass: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 4)
        circle
        square
        circle
        square
        circle
        square
        circle
      end
      .page('Style-Sketch', sketch: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 4)
        circle
        square
        circle
        square
        circle
        square
        circle
      end

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)

    File.write('../spec/.samples/drawio/20-styles.xml', diagram.build)
    File.write('../spec/.samples/drawio/20-styles.drawio', diagram.build)
  end
end
