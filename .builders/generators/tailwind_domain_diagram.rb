KManager.action :domain_model do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04)
      .page('Domain Modal', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 6, grid_w: 220, grid_h: 180)

        shape_element = :rectangle2 # hexagon, diamond, ellipse
        shape_element_w = 75
        shape_element_h = 50
        shape_element_theme = :style_03

        # need a blank
        # square(fill_color: '#fafafa', stroke_color: '#fafafa', font_color: '#333333')

        square(title: 'Tailwind GEM', theme: :style_01) 

        square(title: 'Configuration', theme: :style_01) 

        klass(w: 200, description: 'Configuration container for the Tailwind DSL') do
          format
            .header('Configuration')
            .field(:collections       , type: 'A&lt;Collection&gt;')   # winter, summer
            .field(:themes            , type: 'A&lt;Theme&gt;')   # light, dark, red, blue
            .field(:data_shapes       , type: 'A&lt;DataShape&gt;')   # obj, heading_paragraph_list, image_heading_paragraph_list
            .field(:component_groups  , type: 'A&lt;ComponentGroup&gt;')   # nav, footer, header, hero, price
        end

        klass(w: 200, description: 'Configuration for collection', note: 'other words could be - brands / set / design / collection') do
          format
            .header('Collection')
            .field(:name, type: :String)
            .field(:description, type: :String)
            .field(:component_groups  , type: 'A&lt;ComponentGroup&gt;')   # winter, summer
            .field(:default_themes    , type: 'A&lt;Theme&gt;')   # light, dark
        end

        klass(w: 200, description: 'Configuration for theme', note: 'light, dark, red, green') do
          format
            .header('Theme')
            .field(:key, type: :Symbol)
            .field(:name, type: :String) # The name will default to the titleized version of the key
            .field(:description, type: :String)
        end

        klass(w: 200, description: 'Configuration for component group', note: 'nav, , footer, header, hero, price') do
          format
            .header('ComponentGroup')
            .field(:key, type: :Symbol)
            .field(:name, type: :String)
            .field(:description, type: :String)
            .field(:collection, type: :Collection) # belongs_to (foreign_key)
            .field(:components  , type: 'A&lt;Component&gt;')   # 01, 02, 03
        end

        klass(w: 200, description: 'Configuration for component', note: '01, 02, 03') do
          format
            .header('Component')
            .field(:key, type: :Symbol)
            .field(:name, type: :String)
            .field(:description, type: :String)
            .field(:data_shape, type: :DataShape)
        end

        klass(w: 200, description: 'Configuration for data shape', note: 'object, key_value array') do
          format
            .header('DataShape')
            .field(:key, type: :Symbol)
            .field(:name, type: :String)
            .field(:description, type: :String)
        end

        square(title: 'Schema', theme: :style_01) 

        # website -> root<Page> (start of sitemap)
        #         -> page -> pages [about, contact, news, products, services, terms, privacy] -> news -> news_item
        #         -> page -> components -> component -> data_shape

        klass(w: 200, description: '') do
          format
            .header('WebSite')
            .field(:key, type: :Symbol)
            .field(:name, type: :String)
            .field(:description, type: :String)
            .field(:target_folder, type: :String)
            .field(:base_collection, type: :Collection) # belongs_to (foreign_key)
            .field(:theme, type: :Theme)  # belongs_to (foreign_key)
            .field(:root, type: :Page)
            .method(:favourite_components, type: 'A&lt;Component&gt;') # these are the components have been used in the site and implicitly become favourite
        end

        klass(w: 200, description: '') do
          format
            .header('Page')
            .field(:key, type: :Symbol)
            .field(:name, type: :String)
            .field(:description, type: :String)
            .field(:sub_folder, type: :String)
            .field(:level, type: :Integer) # level 1 will hold root (home page) and top level pages (about, contact, etc)
            .field(:pages, type: 'A&lt;Page&gt;')   # 01, 02, 03
            .field(:components, type: 'A&lt;Component&gt;')   # 01, 02, 03
        end

        klass(w: 200, description: '') do
          format
            .header('Component')
            .field(:key, type: :Symbol)
            .field(:name, type: :String)
            .field(:description, type: :String)
            .field(:component_group, type: :ComponentGroup) # belongs_to (foreign_key)
            .field(:data_shape, type: :DataShape)
        end

        square(title: 'Tailwind Generator', theme: :style_01)

        # MVC pattern
        # Model (data shape) -> View (component html) -> Controller (tailwind generator)

        square(title: 'Tailwind DSL', theme: :style_01)

        klass(w: 200, description: 'DSL for tailwind websites') do
          format
            .header('TailwindDsl')
            .method(:website)
            .method(:page)
            .method(:component)
            .method(:save)
        end

        square(title: 'DataBuilder', theme: :style_01)

        klass(w: 200, description: 'Base for any Data Builder') do
          format
            .header('BaseDataBuilder')
            .field(:obj, type: :Hash)
        end

        # page('home') do
        #   component('nav') do
        #     data
        #       .logo('xmen.png')
        #       .menu('About', 'about.html')
        #       .menu('Contact', 'contact.html')
        #       .menu('News', 'news.html')
        #   end

        interface(description: 'Create an instance of a DataBuilder for the target component', theme: :style_02) do
          format
            .header('Factory', interface_type: 'MixIn')
            .method(:data)
            .method(:data_instance)
        end


        # grid_layout(wrap_at: 12, grid_w: 90, grid_h: 70)

        # send(shape_element, title: 'actor'         , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'actor2'        , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'callout'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'callout2'      , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'callout3'      , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'callout4'      , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'circle'        , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'cloud'         , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'container'     , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'container2'    , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'container3'    , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'container4'    , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'cross'         , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'database'      , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'db_json'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'diamond'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'document'      , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'ellipse'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'embed_col200'  , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'embed_col50'   , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'embed_row'     , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'envelop'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'face'          , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'h1'            , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'h2'            , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'h3'            , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'h4'            , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'h5'            , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'h6'            , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'hexagon'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'interface'     , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'klass'         , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'line'          , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'note'          , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'p'             , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'process'       , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'rectangle'     , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'rectangle2'    , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'shape'         , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'square'        , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'step'          , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'tick'          , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'todo'          , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)
        # send(shape_element, title: 'triangle'      , w: shape_element_w, h: shape_element_h, theme: shape_element_theme)

      end
      .cd(:docs)
      .save('tailwind_domain_model.drawio')
      .save_json('tailwind_domain_model')
      .export_svg('tailwind_domain_model', page: 1)
  end
end

KManager.opts.app_name                    = 'tailwind_domain_model'
KManager.opts.sleep                       = 2
KManager.opts.reboot_on_kill              = 0
KManager.opts.reboot_sleep                = 4
KManager.opts.exception_style             = :short
KManager.opts.show.time_taken             = true
KManager.opts.show.finished               = true
KManager.opts.show.finished_message       = 'FINISHED :)'