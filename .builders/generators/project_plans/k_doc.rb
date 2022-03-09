KManager.action :todo_drawio_dsl do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(rounded: 1, glass: 1)
      .page('In progress', theme: :style_03, margin_left: 0, margin_top: 0) do

        # h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        # p(x: 350, y: 40, w: 400, h: 80, title: 'Project plan - In progress')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        square(w: 300, h: 60, title: '')
      end
      .page('To Do', theme: :style_02, margin_left: 0, margin_top: 0) do

        # h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        # p(x: 350, y: 40, w: 400, h: 80, title: 'Project plan')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

      end
      .page('Done', theme: :style_06, margin_left: 0, margin_top: 0) do

        # h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        # p(x: 350, y: 40, w: 400, h: 80, title: 'Done')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

      end
      .cd(:spec)
      .save('project-plans/k_doc.drawio')
      # .cd(:k_doc_docs)
      # .export_svg('project_in_progress', page: 1)
      # .export_svg('project_todo'       , page: 2)
      # .export_svg('project_done'       , page: 3)
  end
end
