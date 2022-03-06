# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  module DrawioShapes
    # rubocop:disable Metrics/CyclomaticComplexity
    def random(**opts)
      case rand({{shape_length}})
      {{#each shapes}}
      when {{@index}}
        {{snake ./type}}(**opts)
      {{/each}}
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity
    {{#each shapes}}

    def {{snake ./type}}(**opts)
      builder.add_{{snake ./type}}(**opts)
    end
    {{/each}}
  end
end
