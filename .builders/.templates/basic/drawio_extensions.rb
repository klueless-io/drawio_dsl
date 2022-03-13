# frozen_string_literal: true

module DrawioDsl
  # :nocov:
  class DrawIoExtensions

    attr_reader :sections
    attr_reader :current_section

    def initialize
      @sections = []
    end

    def section(name)
      @current_section = {
        name: name,
        shapes: []
      }
      @sections << current_section
      
      yield if block_given?
    end

    def shape(name, style, original_name)
      shape = {
        name: name,
        style: style,
        original_name: original_name
      }
      current_section[:shapes] << shape
      shape
    end

    def to_h
      {
        sections: @sections.map(&:to_h)
      }
    end

    # This methods was generated using Extensions.js
    # This generation can be improved over time and the code to do the generation
    # can be found in the .builders/generators/10-transform-drawio-js.rb.
    # original source: ~/dev/tools/drawio-desktop/drawio/src/main/webapp/js/diagramly/Extensions.js
    def build_extensions
      # Constants
{{{constants}}}
      {{#each sections}}
      section :{{snake ./name}} do
        {{#each ./shapes}}
        shape :{{padr (snake ./name) 60}}, "{{{./style}}}", "{{./name}}"
        {{/each}}
      end
      {{/each}}
    end
  end
  # :nocov:
end
