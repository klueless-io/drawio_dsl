KManager.action :requires do
  # NOT yet working on file change
  # depend_on(:domain_shapes_kdoc)

  # init do
  #   # context.shapes = import_data(:domain_shapes_kdoc, as: :ostruct)
  # end

  action do
    shapes_file = k_builder.target_folders.get_filename(:data, 'shapes.json')
    shapes = JSON.parse(File.read(shapes_file))
    puts 'david'
    KDirector::Dsls::BasicDsl
      .init(k_builder,
        on_exist:                   :write,                      # %i[skip write compare]
        on_action:                  :execute                    # %i[queue execute]
      )
      .blueprint(
        active: true,
        name: :bin_hook,
        description: 'initialize repository',
        on_exist: :write) do

        cd(:lib)

        add('schema/_.rb.txt', template_file: 'schema_require.rb', shapes: shapes)
      end


    # # director.play_actions
    # director.builder.debug
    # director.debug
    # director.k_builder.debug
  end
end
