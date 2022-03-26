KManager.action :requires do

  action do
    shapes_file = k_builder.target_folders.get_filename(:app, 'config/configuration.json')
    shapes_configuration = JSON.parse(File.read(shapes_file))
    shapes = shapes_configuration['shape']
    lookup = shapes['lookup']
    elements = shapes['elements']
    lines = shapes['lines']
    texts = shapes['texts']

    # strokes = shapes_configuration['strokes']

    KDirector::Dsls::BasicDsl
      .init(k_builder,
        on_exist:                   :write,                      # %i[skip write compare]
        on_action:                  :execute                    # %i[queue execute]
      )
      .blueprint(
        active: true,
        on_exist: :write) do

        cd(:lib)

        add('schema/_.rb',
          template_file: 'schema_require.rb',
          elements: elements,
          lines: lines,
          texts: texts)

        elements.each do |element|
          add("schema/elements/#{element['key']}.rb",
            template_file: 'schema_element.rb',
            element: element)
        end

        lines.each do |line|
          add("schema/lines/#{line['key']}.rb",
            template_file: 'schema_line.rb',
            line: line)
        end

        texts.each do |text|
          add("schema/texts/#{text['key']}.rb",
            template_file: 'schema_text.rb',
            text: text)
        end

        add("drawio_shapes.rb"        , template_file: 'drawio_shapes.rb'       , shapes: lookup, shape_length: lookup.length)
        add("dom_builder_shapes.rb"   , template_file: 'dom_builder_shapes.rb'  , shapes: lookup)

        cd(:spec)

        # build spec for each shape
        elements.each do |element|
          add("schema/elements/#{element['key']}_spec.rb",
            template_file: 'schema_element_spec.rb',
            element: element)
        end

        lines.each do |line|
          add("schema/lines/#{line['key']}_spec.rb",
            template_file: 'schema_line_spec.rb',
            line: line)
        end

        texts.each do |text|
          add("schema/texts/#{text['key']}_spec.rb",
            template_file: 'schema_text_spec.rb',
            text: text)
        end

        cd(:app)
        run_command('rubocop -a')

      end
  end
end

