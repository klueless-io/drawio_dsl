KManager.action :bootstrap do
  action do
    director = DrawioDsl::Drawio
      .init(k_builder,
        on_exist:                   :skip,                      # %i[skip write compare]
        on_action:                  :queue                      # %i[queue execute]
      )

    File.write('spec/.samples/drawio/10-layout.xml', director.build)
    File.write('spec/.samples/drawio/10-layout.drawio', director.build)
  end
end

KManager.opts.app_name                    = 'drawio_dsl'
KManager.opts.sleep                       = 2
KManager.opts.reboot_on_kill              = 0
KManager.opts.reboot_sleep                = 4
KManager.opts.exception_style             = :short
KManager.opts.show.time_taken             = true
KManager.opts.show.finished               = true
KManager.opts.show.finished_message       = 'FINISHED :)'
