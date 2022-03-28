def printer(sender, title)
  sender.send(:rectangle2, title: title, w: 75, h: 50, theme: :style_03)
end

def print_filter(sender, title)
  sender.send(:rectangle, title: title, w: 90, h: 50, theme: :style_04)
end

def blank(sender)
  sender.square(w:50, h:50, fill_color: '#fafafa', stroke_color: '#fafafa', font_color: '#333333')
end

def report(sender, title)
  sender.note(title: title, w: 120, h: 120, theme: :style_05)
end

def generator(sender, title)
  sender.process(title: title, w: 120, h: 70, theme: :style_05)
end

def item(sender, title)
  sender.square(title: title, w: 90, h: 90, theme: :style_06)
end

KManager.action :printspeak_architecture_generator do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04)
      .page('Style-Plain', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 1)
        group(title: 'Data Sources (Documents)', theme: :style_01)

        grid_layout(wrap_at: 2, grid_h: 100)

        db_json(:a, title: 'schema.rb'            , description: 'Rails schema.rb is the starting point for building db_schema.json')
        db_json(:b, title: 'db_schema.json'       , description: 'A model of the database schema based on schema.rb')
        db_json(:c, title: 'sql_count (rake/api)' , description: 'Reads the database and counts the number of rows in each table')
        db_json(:d, title: 'sql_count.json'       , description: 'Latest SQL counts from production, normalized into a JSON file across regions')
        db_json(:e, title: 'rubocop (rake/.txt)'  , description: 'Robocop.txt will be used to generate rubocop.json via `rubocop --format progress > robocop.txt`')
        db_json(:f, title: 'rubocop.json'         , description: 'Takes a rubo_cop.txt file parse it so that you can see what issues are in the ruby application')
        db_json(:g, title: 'rake routes:json'     , description: 'Run rake routes:json to build up a model of what we use')
        db_json(:h, title: 'routes.json'          , description: 'Custom routes.json file')
        db_json(:i, title: 'model/**/*.rb'        , description: 'All the models in the application')
        db_json(:j, title: 'controller/**/*.json' , description: 'All the controllers in the application')
        db_json(:k, title: 'domain_model.json'    , description: 'A model of domain based db_schema.json and annotated with model and controller code')

        # connect(:a, :b, :solid)
        solid(source: :a, target: :b)
        solid(source: :c, target: :d)
        solid(source: :e, target: :f)
        solid(source: :g, target: :h)

        solid(source: :b, target: :k)
        solid(source: :d, target: :k)
        solid(source: :f, target: :k)
        solid(source: :g, target: :k)
        solid(source: :h, target: :k)
        solid(source: :i, target: :k)
        solid(source: :j, target: :k)

        # blank(self)

        # square(fill_color: '#fafafa', stroke_color: '#fafafa', font_color: '#333333')
        # square(fill_color: '#fafafa', stroke_color: '#fafafa', font_color: '#333333')

        grid_layout(wrap_at: 1)
        group(title: 'Printers - DB Schema', theme: :style_01)

        grid_layout(wrap_at: 5, grid_w: 90, grid_h: 70)

        # DB Schema
        printer(self, 'stats')
        printer(self, 'tables')
        printer(self, 'foreign_keys')
        printer(self, 'indexes')
        printer(self, 'dictionary')

        grid_layout(wrap_at: 1)
        group(title: 'Printers - Other', theme: :style_01)
        grid_layout(wrap_at: 3, grid_w: 100, grid_h: 70)

        printer(self, 'routes')
        printer(self, 'models')
        printer(self, 'controllers')

        grid_layout(wrap_at: 5, grid_w: 100, grid_h: 70)

        print_filter(self, 'has_ruby')
        print_filter(self, 'missing_ruby')
        print_filter(self, 'has_pk')
        print_filter(self, 'missing_pk')
        print_filter(self, 'low_column')
        print_filter(self, 'fat_column')
        print_filter(self, 'suspected_m2m')
        print_filter(self, 'invalid_types')
        print_filter(self, 'data_columns')
        print_filter(self, 'date_columns')
        # blank(self)

        grid_layout(wrap_at: 1)
        group(title: 'Generators', theme: :style_01)
        
        grid_layout(wrap_at: 4, grid_w: 150, grid_h: 100)
        generator(self, 'Factory data')
        generator(self, 'Model DSL specs (CRUD / Association)')
        generator(self, 'Model API specs')
        generator(self, 'Controller request specs')
        generator(self, 'Query + spec')
        generator(self, 'Decorator + spec')
        generator(self, 'Presentor + spec')
        blank(self)

        grid_layout(wrap_at: 1)
        group(title: 'Reports', theme: :style_01)

        grid_layout(wrap_at: 5, grid_w: 150, grid_h: 150)
        report(self, 'Tests')
        item(self, 'coverage')
        item(self, 'model DSL')
        item(self, 'model API')
        item(self, 'controller request')
        item(self, 'controller commands')
        item(self, 'query')
        item(self, 'decorator')
        item(self, 'presentor')
        blank(self)

        grid_layout(wrap_at: 6, grid_w: 150, grid_h: 150)

        report(self, 'ERD')
        item(self, 'agg roots')
        item(self, 'many to many')
        item(self, 'leaf tables')
        item(self, 'rubocop')
        item(self, 'SQL counts')

        grid_layout(wrap_at: 6, grid_w: 150, grid_h: 150)
        report(self, 'Anti patterns')
        item(self, 'god classes')
        item(self, 'fat controllers')
        item(self, 'fat models')
        item(self, 'fat views vs components')
        item(self, 'interpolated SQL')

        grid_layout(wrap_at: 6, grid_w: 150, grid_h: 150)
        report(self, 'Target patterns')
        item(self, 'decorators')
        item(self, 'presenters')
        item(self, 'queries')
        item(self, 'commands')
        item(self, 'form objects')

        grid_layout(wrap_at: 5, grid_w: 150, grid_h: 150)
        report(self, 'Diff or Conflict')
        item(self, 'factory data <i>missing data/models</i>')
        item(self, 'model DSL specs <i>missing data/associations</i>')
        item(self, 'model API specs <i>missing methods</i>')
        item(self, 'route / controller action <i>mismatch</i>')

        # klass do
        #   format
        #     .header('Container', description: '')
        # end

        # interface(theme: :style_02) do
        #   format
        #     .header('Block Processor', interface_type: 'Subsystems', description: '')
        #     .field(:block, type: :proc)
        #     .field(:block_state, type: :symbol)
        #     .method(:depend_on)
        # end
      
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
