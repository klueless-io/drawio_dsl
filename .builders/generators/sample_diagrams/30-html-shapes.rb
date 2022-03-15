KManager.action :html_shapes do
  action do

    # :rounded, :shadow, :sketch, :glass
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_11)
      .page('Style-Plain', margin_left: 0, margin_top: 0, rounded: 0, background: '#FFEADB') do
        grid_layout(wrap_at: 8)

        # html = DrawioDsl::Formatters::InterfaceFormatter.new
        #   .header('IPerson')
        #   .field(:first_name, type: :string)
        #   .field(:last_name, type: :string)
        #   .field(:age, type: :integer)
        #   .field(:birthday, type: :date)
        #   .method(:full_name)
        #   .as_html

        # square(
        #   title: html,
        #   style_modifiers: 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
        # )

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
      end
      .cd(:spec)
      .save('.samples/30-html-shapes.drawio')
      .cd(:docs)
      .export_svg('samples/html-shapes', page: 1)
  end
end
