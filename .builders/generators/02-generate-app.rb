KManager.action :requires do

  action do
    shapes_file = k_builder.target_folders.get_filename(:data, 'shapes.json')
    shapes = JSON.parse(File.read(shapes_file))

    KDirector::Dsls::BasicDsl
      .init(k_builder,
        on_exist:                   :write,                      # %i[skip write compare]
        on_action:                  :execute                    # %i[queue execute]
      )
      .blueprint(
        active: true,
        on_exist: :write) do

        cd(:lib)

        add('schema/_.rb', template_file: 'schema_require.rb', shapes: shapes)

        shapes.each do |shape|
          add("schema/shapes/#{shape['type']}.rb",
            template_file: 'schema_shape.rb',
            shape: shape)
        end

        add("drawio_shapes.rb"        , template_file: 'drawio_shapes.rb'       , shapes: shapes, shape_length: shapes.length)
        add("dom_builder_shapes.rb"   , template_file: 'dom_builder_shapes.rb'  , shapes: shapes)
        add("configuration_shapes.rb" , template_file: 'configuration_shapes.rb', shapes: shapes)

        cd(:spec)

        shapes.each do |shape|
          add("schema/shapes/#{shape['type']}_spec.rb",
            template_file: 'schema_shape_spec.rb',
            shape: shape)
        end

      end
  end
end
