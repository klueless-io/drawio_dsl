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

        add('schema/_.rb.txt', template_file: 'schema_require.rb', shapes: shapes)

        shapes.each do |shape|
          add("schema/shapes/#{shape['type']}.rb",
            template_file: 'schema_shape.rb',
            shape: shape)
        end

        cd(:spec)

        shapes.each do |shape|
          add("schema/shapes/#{shape['type']}_spec.rb",
            template_file: 'schema_shape_spec.rb',
            shape: shape)
        end

      end

    # # director.play_actions
    # director.builder.debug
    # director.debug
    # director.k_builder.debug
  end
end
