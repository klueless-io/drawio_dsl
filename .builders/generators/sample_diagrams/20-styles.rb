SHAPES = KConfig.configuration.drawio.shape
TEXT_AND_ELEMENT_KEYS = SHAPES.text_keys + SHAPES.element_keys

KManager.action :styled_shapes do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04, bg_theme: :pale_gray)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        TEXT_AND_ELEMENT_KEYS.each do |shape|
          send(shape, title: shape.to_s)
        end
      end
      .page('Style-Shadow', shadow: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        TEXT_AND_ELEMENT_KEYS.each do |shape|
          send(shape, title: shape.to_s)
        end
      end
      .page('Style-Rounded', rounded: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        TEXT_AND_ELEMENT_KEYS.each do |shape|
          send(shape, title: shape.to_s)
        end
      end
      .page('Style-Glass', glass: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        TEXT_AND_ELEMENT_KEYS.each do |shape|
          send(shape, title: shape.to_s)
        end
      end
      .page('Style-Sketch', sketch: 1, margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        TEXT_AND_ELEMENT_KEYS.each do |shape|
          send(shape, title: shape.to_s)
        end
      end
      .cd(:spec)
      .osave('.samples/20-styled-shapes.drawio')
      .cd(:docs)
      .export_svg('samples/styles-plain', page: 1)
      .export_svg('samples/styles-shadow', page: 2)
      .export_svg('samples/styles-rounded', page: 3)
      .export_svg('samples/styles-glass', page: 4)
      .export_svg('samples/styles-sketch', page: 5)
  end
end
