KManager.model :{{command.name}}, namespace: %i[blueprint command] do
  # microapp = import(:handlebars_helpers, :microapp)

  settings do
    name                  :{{command.name}}
    description           "{{command.description}}"
  end
end
