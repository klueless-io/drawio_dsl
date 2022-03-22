KManager.action :printspeak_architecture_generator do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04)
      .page('Style-Plain', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 6)

        group(title: 'Data Sources (Documents)', theme: :style_01)

        db_json(title: 'schema.rb', description: 'Rails schema.rb is the starting point for building db_schema.json')
        db_json(title: 'db_schema.json', description: 'A model of the database schema based on schema.rb')
        db_json(title: 'sql_count.json', description: 'Latest SQL counts from production, normalized into a JSON file across regions')
        db_json(title: 'robocop.txt', description: 'Robocop.txt will be used to generate rubocop.json via `rubocop --format progress > robocop.txt`')
        db_json(title: 'rubocop.json', description: 'Takes a rubo_cop.txt file parse it so that you can see what issues are in the ruby application')
        db_json(title: 'domain_model.json', description: 'A model of domain based db_schema.json and annotated with model and controller code')
        db_json(title: 'data_context.json', description: 'A model of the data context based on domain_model.json and data_context.json')
        db_json(title: 'routes.json', description: 'Run rails routes and build up a model of what we use')

        klass do
          format
            .header('Container', description: '')
        end


        interface(theme: :style_02) do
          format
            .header('Block Processor', interface_type: 'Subsystems', description: '')
            .field(:block, type: :proc)
            .field(:block_state, type: :symbol)
            .method(:depend_on)
        end
      end
      .cd(:docs)
      .save('printspeak-architecture-generator.drawio')
      .export_svg('printspeak-architecture-generator', page: 1)
  end
end

KManager.opts.app_name                    = 'domain_diagram'
KManager.opts.sleep                       = 2
KManager.opts.reboot_on_kill              = 0
KManager.opts.reboot_sleep                = 4
KManager.opts.exception_style             = :short
KManager.opts.show.time_taken             = true
KManager.opts.show.finished               = true
KManager.opts.show.finished_message       = 'FINISHED :)'
