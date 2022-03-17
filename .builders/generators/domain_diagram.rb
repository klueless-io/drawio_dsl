KManager.action :domain_diagram do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04)
      .page('Style-Plain', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 6)

        klass do
          format
            .header('Container', description: 'A container acts a base data object for any data that requires tagging')
        end
        interface(theme: :style_02) do
          format
            .header('Block Processor', interface_type: 'MixIn', description: 'Provide data load events, dependency and import management')
        end
        square(title: 'Documents', theme: :style_01)
        interface(theme: :style_02) do
          format
            .header('Block Processor', interface_type: 'MixIn', description: 'Provide data load events, dependency and import management')
            .field(:block, type: :proc)
            .field(:block_state, type: :symbol)
            .method(:depend_on)
        end
      end
      .cd(:docs)
      .save('domain.drawio')
      .export_svg('domain_model', page: 1)
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
