KManager.action :project_plan do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(rounded: 1, glass: 1)
      .page('In progress', theme: :style_03, margin_left: 0, margin_top: 0) do

        # h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        # p(x: 350, y: 40, w: 400, h: 80, title: 'Project plan - In progress')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'refactor the shape->text_only (boolean) to category (symbol)')
        todo(title: 'build configuration for line strokes (eg. dashed, dotted)')
        todo(title: 'add new shapes related to line connectors')
        todo(title: 'line connectors need to support autolinking using ids')
      end
      .page('To Do', theme: :style_02, margin_left: 0, margin_top: 0) do

        # h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        # p(x: 350, y: 40, w: 400, h: 80, title: 'Project plan')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'add page background to theme, use it whenever the theme is set at a diagram/page level')
        todo(title: 'move DrawioDsl::Formatters::Factory::FORMATTERS to resource file')
        todo(title: 'move DrawioDsl::Formatters::StyleBuilder::MAPPINGS to resource file')
        todo(title: 'need to setup new project plans')
        todo(title: 'settings style attributes need to de-duplicate, might be best to utilize the new StyleBuilder class')
        todo(title: 'write SVG directly into other projects')
        todo(title: 'add :shape and :text-only to random shape generator')
        todo(title: 'Nodes need to support child nodes')
        todo(title: 'Grid layout does not position itself in relation to the last element')
        todo(title: 'Dynamic sized shapes that expand to the size of their text')
        todo(title: 'Control of text padding left, right, top and bottom')
        todo(title: 'Improve the theme control over text-only shapes')
        todo(title: 'x,y settings do not work for shapes within a grid layout')
        todo(title: 'page layout so that you drop elements on and they are positioned correctly, e.g centered, left, right, etc, maybe a grid layout with a wrap of 1 and a width of the page is sufficient')
      end
      .page('Done', theme: :style_06, margin_left: 0, margin_top: 0) do

        # h5(x: 300, y: 0, w: 400, h: 80, title: 'DrawIO DSL')
        # p(x: 350, y: 40, w: 400, h: 80, title: 'Done')

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'ensure that ids are working as expected')
        todo(title: 'alter the initial parameter of all shapes so that it can be an ID, without named attribute')
        todo(title: 'move project-plan files')
        todo(title: 'alter configure_shape so it sets the default shape key and use that for selecting the default HTML formatter')
        todo(title: 'add todo shape to simplify project plan drawing')
        todo(title: 'introduce .value property to shape and let it use either formatted HTML or plain text title')
        todo(title: 'formatter DSL that can render HTML directly into the value property')
        todo(title: 'formatter DSL for class and interface generation')
        todo(title: 'generate extension based graphics based on drawio extensions.js')
        todo(title: 'active? flag on page defaulting to true. set to false to exclude page from diagram.')
        todo(title: 'first level child nodes need to hang of node 1')
        todo(title: 'node has child nodes and add_node will set a nodes parent')
        todo(title: 'nodes can belong to a parent node, the top level node responds with truthy to root?')
        todo(title: 'add sample diagram for the github readme file')
        todo(title: 'write samples into docs folder and display in readme')
        todo(title: 'add export as .PNG, needs to take a page number as the PNG will not support multiple pages')
        todo(title: 'add export as .SVG, needs to take a page number as the SVG will not support multiple pages')
        todo(title: 'add save as .drawio')

      end
      .cd(:docs)
      .save('project-plan/project.drawio')
      .export_svg('project-plan/project_in_progress', page: 1)
      .export_svg('project-plan/project_todo'       , page: 2)
      .export_svg('project-plan/project_done'       , page: 3)
  end
end
