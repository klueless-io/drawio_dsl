# frozen_string_literal: true

RSpec.shared_context :node_dependencies do
  let(:diagram_args) { {} }
  let(:diagram) { DrawioDsl::Schema::Diagram.new(**diagram_args) }

  let(:page_args) { {} }
  let(:page) { DrawioDsl::Schema::Page.new(diagram, **page_args) }
end
