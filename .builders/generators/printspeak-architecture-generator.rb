KManager.action :printspeak_architecture_generator do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04)
      .page('Fat Controllers', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 4)

        klass do
          format
            .header('Reports#sales_by_profit')
            .h3('Thin Controller')
            .h5('Param marshalling')
            .p('my_action_params()')
            .h5('Call query')
            .p('MyActionQuery.query(scope, **inputs)')
            .hr
            .h5('Present')
            .p('@vm = MyActionPresenter.new(**outputs)')
        end

        rectangle2(theme: :style_03, title: '<b>Param marshaling</b><br><br>@sales_by_profit_params ||= <br>params.permit(...)<br>&nbsp;&nbsp;.symbolize_keys')
        rectangle2(theme: :style_03, title: '<b>Call Query</b><br><br>SalesByProfitQuery<br>&nbsp;&nbsp;.query(scope, **custom, **params)')
        rectangle2(theme: :style_03, title: '<b>Present</b><br><br>SalesByProfitPresenter<br>&nbsp;&nbsp;.new(**query.outputs)')
      end
      .page('Fat Controllers', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 4)

        klass do
          format
            .header('Reports#sales_by_profit')
            .h3('Fat Controller')
            .h5('Param marshalling')
            .p('params[:date_from]')
            .p('params[:date_to]')
            .p('params[:sort] || "gross_sales"')
            .p('params[:direction] || "desc"')
            .p('params[:filter_str]')
            .h5('Dynamic query construction')
            .p('switch params[:filter_str]')
            .p('invoice_date_query')
            .p('ugly query')
            .hr
            .h5('Query in controller')
            .p('ActiveRecord::Base.connection.execute(query)')
            .hr
            .h5('Build outputs')
            .p('@net_sales_total')
            .p('@vat_total')
            .p('@gross_sales_total')
            .p('@document_data')
            .h5('Composite outputs')
            .p('params[:sort]')
            .p('params[:direction]')
        end


        rectangle2(theme: :style_03, title: '<b>Paramater marshalling</b><br><br>reading the params[] object<br>setting sane defaults<br><i>do not alter and reuse params[]</i>')
        rectangle2(theme: :style_03, title: '<b>Dynamic query construction</b><br><br>query = "select ..."<br><i>ActiveRelation vs interpolation</i>')
        rectangle2(theme: :style_03, title: '<b>Query in controller</b><br><i>Move out to Query object</i>')
        rectangle2(theme: :style_03, title: '<b>Build outputs</b><br>Multiple @instance vars<br><i>single view model @vm</i>')
        rectangle2(theme: :style_03, title: '<b>Composite outputs</b><br>sort, direction, page_no, page_size<br><i>single order, page or list object</i>')
      end
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
      .osave('printspeak-architecture-generator.drawio')
      # .export_svg('printspeak-architecture-generator', page: 1)
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
