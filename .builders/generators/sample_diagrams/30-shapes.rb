KManager.action :bootstrap do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder)
      .diagram(theme: :style_06)
      .page('Shapes', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 5)

        KConfig.configuration.drawio.shapes.members.each do |shape|
          next if shape == :shape

          send(shape, title: shape.to_s, shape: shape)
        end
      end

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)

    File.write('../spec/.samples/drawio/30-shapes.xml', diagram.build)
    File.write('../spec/.samples/drawio/30-shapes.drawio', diagram.build)
  end
end
