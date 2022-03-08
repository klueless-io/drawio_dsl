KManager.action :todo_drawio_dsl do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(rounded: 1, glass: 1)
      .page('In progress', theme: :style_03, margin_left: 0, margin_top: 0) do

        h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        p(x: 350, y: 40, w: 400, h: 80, title: 'Project plan - In progress')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        square(w: 300, h: 60, title: 'write SVG directly into other projects')
      end
      .page('To Do', theme: :style_02, margin_left: 0, margin_top: 0) do

        h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        p(x: 350, y: 40, w: 400, h: 80, title: 'Project plan')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        square(w: 300, h: 60, title: 'First level child nodes need to hang of node 1')
        square(w: 300, h: 60, title: 'Add page background to theme, use it whenever the theme is set at a diagram/page level')
        square(w: 300, h: 60, title: 'Nodes need to support child nodes')
        square(w: 300, h: 60, title: 'Grid layout does no position itself in relation to the last element')
        square(w: 300, h: 60, title: 'Dynamic sized shapes that expand to the size of their text')
        square(w: 300, h: 60, title: 'Control of text padding left, right, top and bottom')
        square(w: 300, h: 60, title: 'Improve the theme control over text-only shapes')
        square(w: 300, h: 60, title: 'x,y settings do not work for shapes within a grid layout')
        square(w: 300, h: 60, title: 'background color does not work from the diagram object')
        square(w: 300, h: 60, title: 'settings style attributes need to de-duplicate')
        square(w: 300, h: 60, title: 'need to setup new project plans')
        square(w: 300, h: 60, title: 'write SVG directly into other projects')
        square(w: 300, h: 60, title: 'page layout so that you drop elements on and they are positioned correctly, e.g centered, left, right, etc, maybe a grid layout with a wrap of 1 and a width of the page is sufficient')
      end
      .page('Done', theme: :style_06, margin_left: 0, margin_top: 0) do

        h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        p(x: 350, y: 40, w: 400, h: 80, title: 'Done')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        square(w: 300, h: 60, title: 'add save as .drawio')
        square(w: 300, h: 60, title: 'add export as .SVG, needs to take a page number as the SVG will not support multiple pages')

      end
      .cd(:spec)
      .save('project-plans/drawio_dsl.drawio')
      .cd(:docs)
      .export_svg('project_in_progress.svg', page: 1)
      .export_svg('project_todo.svg'       , page: 2)
      .export_svg('project_done.svg'       , page: 3)
  end
end
