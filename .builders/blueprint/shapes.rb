KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  table :shapes do
    fields :type, :x, :y, :w, :h, :style_modifiers

    # row :shape      , x: 0, y: 0, w:  20, h:  20, style_modifiers: ''
    row :square     , x: 0, y: 0, w: 160, h: 160, style_modifiers: ''
    row :rectangle  , x: 0, y: 0, w: 200, h: 120, style_modifiers: ''
    row :circle     , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;ellipse'
    row :process    , x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;shape=process'
    row :ellipse    , x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;ellipse'
    row :diamond    , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;rhombus'
    row :hexagon    , x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;shape=hexagon'
    row :cloud      , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=cloud'
    row :note       , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=note'
    row :callout    , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=callout'
  end
end
