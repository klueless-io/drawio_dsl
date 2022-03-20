KManager.action :html_shapes do
  action do

    # :rounded, :shadow, :sketch, :glass
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_11)
      .page('Style-Plain', margin_left: 0, margin_top: 0, rounded: 0, background: '#FFEADB') do
        grid_layout(wrap_at: 8)

        interface(theme: :style_07) do
          format
            .header('IPerson')
            .field(:field1, type: :string)
            .field(:field2, type: :string)
            .method(:full_name, type: :string)
        end

        klass do
          format(:class)
            .header('Person')
            .field(:field1, type: :string)
            .field(:field2, type: :string)
            .field(:age, type: :integer)
            .field(:birthday, type: :date)
            .method(:full_name, type: :string)
        end

        klass(h: 280) do
          format
            .header('Custom HTML')
            .p('David')
            .b('Cruwys')
            .hr
            .h1('h1')
            .h2('h2')
            .h3('h3')
            .h4('h4')
            .h5('h5')
            .h6('h6')
            .ul_s
            .li('li')
            .li('li')
            .ul_e
        end

        interface(theme: :style_07, h: 280) do
          format
            .header('ICustom HTML')
            .p('David')
            .b('Cruwys')
            .hr
            .h1('h1')
            .h2('h2')
            .h3('h3')
            .h4('h4')
            .h5('h5')
            .h6('h6')
            .ul_s
            .li('li')
            .li('li')
            .ul_e
        end
      end
      .cd(:spec)
      .osave('.samples/30-html-shapes.drawio')
      # .cd(:docs)
      # .export_svg('samples/html-shapes', page: 1)
  end
end
