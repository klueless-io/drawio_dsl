KManager.action :bootstrap do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_06)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        KConfig.configuration.drawio.shapes.members.each do |shape|
          next if shape == :shape

          send(shape, title: shape.to_s, shape: shape)
        end
      end
      .page('Style-Shadow', shadow: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        KConfig.configuration.drawio.shapes.members.each do |shape|
          next if shape == :shape

          send(shape, title: shape.to_s, shape: shape)
        end
      end
      .page('Style-Rounded', rounded: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        KConfig.configuration.drawio.shapes.members.each do |shape|
          next if shape == :shape

          send(shape, title: shape.to_s, shape: shape)
        end
      end
      .page('Style-Glass', glass: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        KConfig.configuration.drawio.shapes.members.each do |shape|
          next if shape == :shape

          send(shape, title: shape.to_s, shape: shape)
        end
      end
      .page('Style-Sketch', sketch: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        KConfig.configuration.drawio.shapes.members.each do |shape|
          next if shape == :shape

          send(shape, title: shape.to_s, shape: shape)
        end
      end
      .cd(:spec)
      .save('.samples/20-styles.drawio')
      .cd(:docs)
      .export_svg('samples/styles-plain', page: 1)
      .export_svg('samples/styles-shadow', page: 2)
      .export_svg('samples/styles-rounded', page: 3)
      .export_svg('samples/styles-glass', page: 4)
      .export_svg('samples/styles-sketch', page: 5)
  end
end
