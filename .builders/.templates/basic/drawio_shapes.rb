# frozen_string_literal: true

module DrawioDsl
  # List of DSL methods for each common shape
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand({{shape_length}})
      {{#each shapes}}
      when {{@index}}
        {{snake ./type}}(**opts)
      {{/each}}
      end
    end
    {{#each shapes}}

    def {{snake ./type}}(id = nil, **opts, &block)
      builder.add_{{snake ./type}}(id, **opts, &block)
    end
    {{/each}}
  end
  # :nocov:
end
