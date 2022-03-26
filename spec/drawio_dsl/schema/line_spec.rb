# frozen_string_literal: true

# class Fake < DrawioDsl::Schema::Element
#   configure_as(:actor)
# end

RSpec.describe DrawioDsl::Schema::Line do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(diagram, **args) }
  let(:args) { { id: 1 } }

  context 'initialize' do
    context '.source' do
      subject { instance.source }

      it { is_expected.to be_nil }
    end
    context '.target' do
      subject { instance.target }

      it { is_expected.to be_nil }
    end
  end
end
