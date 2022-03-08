KManager.action :todo_drawio_dsl do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_03)
      .page('To Do', margin_left: 0, margin_top: 0, rounded: 1) do
        grid_layout(direction: :vertical, grid_h: 120, grid_w: 400, wrap_at: 10, grid: 0)

        h5(w: 400, h: 80, title: 'DrawIO DSL')
        p(w: 400, h: 80, title: 'Project plan')
        square(w: 300, h: 80, title: 'Enter report into system')
        square(w: 300, h: 80, title: 'Preliminary Review')
      end

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)

    director
      .cd(:spec)
      .add('project-plans/drawio_dsl.drawio', content: diagram.build)

  end
end
