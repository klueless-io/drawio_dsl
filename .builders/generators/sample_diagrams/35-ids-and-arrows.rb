KManager.action :bootstrap do
  action do
    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: KConfig.configuration.drawio.theme.random_element_key, bg_theme: :snow)
      .page('Style-Plain', margin_left: 0, margin_top: 0) do
        grid_layout(wrap_at: 2, grid_w: 400)

        shape_count = 12
        # for 1 to 20 step 2
        (1..shape_count).step(2).each do |i|
          circle(i, title: i)
          ellipse(i+1, title: i + 1)
        end

        (1..shape_count).step(2).each do |i|
          solid(source: i, target: i+1) 
        end

        # # label = '<div style="background-color: #B85450; height: 100%; margin: 0; border: 1px solid red;"><p style="padding: 10px; font-size: 12px;color: #ffffff;width: 150px;"><img style="margin-right: 20px" src="https://picsum.photos/40" /> the quick brown fox jumped over the lazy dog</p></div>'
        # label = ''

      end
      .cd(:spec)
      .osave('.samples/35-ids-and-arrows.drawio')
  end
end
