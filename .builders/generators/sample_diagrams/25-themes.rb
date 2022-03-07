KManager.action :bootstrap do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder)
      .diagram(theme: :style_06)
      .page('Style-Plain', margin_left: 0, margin_top: 0, rounded: 1, background: '#FFEADB') do
        grid_layout(wrap_at: 8)

        square(title: 'The quick brown fox jumps over the lazy dog')
        circle(title: 'Mary had a little lamb')

        KConfig.configuration.drawio.themes.keys.each do |theme|
          random(title: theme.to_s, theme: theme)
        end
      end

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)

    File.write('../spec/.samples/drawio/25-themes.xml', diagram.build)
    File.write('../spec/.samples/drawio/25-themes.drawio', diagram.build)
  end
end
