# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
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

    def {{snake ./type}}(**opts, &block)
      builder.add_{{snake ./type}}(**opts, &block)
    end
    {{/each}}
  end
  # :nocov:
end
