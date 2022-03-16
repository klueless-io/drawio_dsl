def rnd(max)
  Random.rand(0..max) == 0 ? 1 : 0
end
KManager.action :bootstrap do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_01)
      .page('Samples') do
        grid_layout(wrap_at: 5)

        # KConfig.configuration.drawio.shapes.select { |shape| shape.type != :shape && !shape.text_only }.each do |shape|
        #   # print random number between 0 and 1
        #   send(shape.type, theme: KConfig.configuration.drawio.random_theme, title: shape.type.to_s, shape: shape, rounded: rnd(2), gloss: rnd(2), sketch: rnd(8))
        # end

        for jersy_number in 67..112
          team_color = :style_02
          team_color = :style_03 if jersy_number % 3 == 0
          team_color = :style_04 if jersy_number % 12 == 0

          if jersy_number % 20 == 0
            cloud(title: jersy_number, theme: team_color)
          else
            actor(title: jersy_number, theme: team_color)
          end
        end
      

      end
      .cd(:spec)
      .osave('.samples/05-samples.drawio')
      # .cd(:docs)
      # .export_svg('samples/samples', page: 1)
  end
end
