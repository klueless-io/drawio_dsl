KManager.action :bootstrap do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder)
      .diagram(theme: :style_06)
      .page('Shapes', margin_left: 0, margin_top: 0, rounded: 1) do
        grid_layout(wrap_at: 40, direction: :vertical, )

        square(w: 300, h: 100, title: 'PREPARATION FOR INVESTIGATION ')
        square(w: 300, h: 100, title: '(source: Hunter & Central Coast Regional Environmental Management Strategy – Investigations guideline) ')
        square(w: 300, h: 100, title: 'Enter report into system')
        square(w: 300, h: 100, title: 'Preliminary Review ')
        square(w: 300, h: 100, title: 'Insufficient Information ')
        square(w: 300, h: 100, title: 'Seek Additional Information ')
        square(w: 300, h: 100, title: 'Identify Possible Breach ')
        square(w: 300, h: 100, title: 'Insufficient evidence or no breach detected ')
        square(w: 300, h: 100, title: 'Plan follow up action ')
        square(w: 300, h: 100, title: 'Establish Jurisdiction - Council or other agency? ')
        square(w: 300, h: 100, title: 'Refer to other agency ')
        square(w: 300, h: 100, title: 'Council Responsibility ')
        square(w: 300, h: 100, title: 'Plan investigation ')
        square(w: 300, h: 100, title: 'Conduct investigation Gather and manage evidence (Evidence Gathering Guideline) ')
        square(w: 300, h: 100, title: 'Prepare recommendations report ')
        square(w: 300, h: 100, title: 'Make decision ')
        square(w: 300, h: 100, title: 'Take action (Enforcement Options Guideline) ')
        square(w: 300, h: 100, title: 'Review investigation ')
        square(w: 300, h: 100, title: 'Close case ')
        square(w: 300, h: 100, title: 'Feedback to complainant ')
      end

    diagram = DrawioDsl::XmlBuilder.new(director.builder.diagram)

    File.write('../spec/.samples/drawio/50-willoughby-council.xml', diagram.build)
    File.write('../spec/.samples/drawio/50-willoughby-council.drawio', diagram.build)
  end
end
