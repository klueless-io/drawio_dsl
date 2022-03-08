KManager.action :bootstrap do
  action do

    # :rounded, :shadow, :sketch, :glass
    director = DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_03)
      .page('Shapes', margin_left: 0, margin_top: 0, rounded: 1) do
        grid_layout(direction: :vertical, grid_h: 120, grid_w: 400, wrap_at: 10, grid: 0)

        h5(w: 400, h: 80, title: 'Preparation for Investigation')
        p(w: 400, h: 80, title: '(<b>source</b>: <i>Hunter & Central Coast Regional Environmental Management Strategy – Investigations guideline</i>)')
        square(w: 300, h: 80, title: 'Enter report into system')
        square(w: 300, h: 80, title: 'Preliminary Review')
        square(w: 300, h: 80, title: 'Insufficient Information')
        square(w: 300, h: 80, title: 'Seek Additional Information')
        square(w: 300, h: 80, title: 'Identify Possible Breach')
        square(w: 300, h: 80, title: 'Insufficient evidence or no breach detected')
        square(w: 300, h: 80, title: 'Plan follow up action')
        square(w: 300, h: 80, title: 'Establish Jurisdiction - Council or other agency?')
        square(w: 300, h: 80, title: 'Refer to other agency')
        square(w: 300, h: 80, title: 'Council Responsibility')
        square(w: 300, h: 80, title: 'Plan investigation')
        square(w: 300, h: 80, title: 'Conduct investigation Gather and manage evidence (Evidence Gathering Guideline)')
        square(w: 300, h: 80, title: 'Prepare recommendations report')
        square(w: 300, h: 80, title: 'Make decision')
        square(w: 300, h: 80, title: 'Take action (Enforcement Options Guideline)')
        square(w: 300, h: 80, title: 'Review investigation')
        square(w: 300, h: 80, title: 'Close case')
        square(w: 300, h: 80, title: 'Feedback to complainant')

        grid_layout(wrap_at: 40, direction: :vertical, grid_w: 250, grid_h: 150, wrap_at: 5)

        square(theme: :style_02, w: 240, h: 140, title: '1. Complaint received by Council gets recorded into the system.')
        square(theme: :style_02, w: 240, h: 140, title: '2. Council Officer will review the nature of the complaint and consider what evidence or information it has.')
        square(theme: :style_02, w: 240, h: 140, title: '3. If the information given thus far is insufficient Officer can go back to complainant and seek additional information.')
        square(theme: :style_02, w: 240, h: 140, title: '4. With that information Council should be in a position to identify whether there has been a breach.')
        square(theme: :style_02, w: 240, h: 140, title: '5. If there has been a breach: establish whether it&apos;s a matter for which the Council has jurisdiction (ie is it a piece of legislation for which the Council has the authority to enforce?).')
        square(theme: :style_02, w: 240, h: 140, title: '6. If not: Council can refer that matter to another agency; such as Police, Fisheries, Transport NSW, EPA etc')
        square(theme: :style_02, w: 240, h: 140, title: '7. If it is the Councils responsibility then Council needs to plan out the investigation. That will be through: gathering and collecting evidence through statements, observations, interviews, samples, items of interest.')
        square(theme: :style_02, w: 240, h: 140, title: '8. The Council Officer should prepare a recommendations report which will: <br/>* go through the history of the matter <br/>* go through the investigations that have happened <br/>* go through the evidence that the Council has and then provide a recommendation as to the future action to be taken')
        square(theme: :style_02, w: 240, h: 140, title: '9. Once the Council has that evidence and is in a position that it thinks it can MAKE A DECISION')
        square(theme: :style_02, w: 240, h: 140, title: '10. TAKE ACTION: Once a decision is made as to the action that should happen in respect of the breach the council can then decide as to what the appropriate action is: WARNING, CIVIL, CRIMINAL and then proceed from there => it is important to keep the complainant informed throughout the entire process to be able to explain why you have taken the course you&apos;ve taken and to be able to justify it')

      end
      .cd(:spec)
      .save('.samples/50-willoughby-council.drawio')
      .cd(:docs)
      .export_svg('samples/willoughby-council', page: 1)
  end
end
