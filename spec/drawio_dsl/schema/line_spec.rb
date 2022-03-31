# frozen_string_literal: true

# class Fake < DrawioDsl::Schema::Element
#   configure_as(:actor)
# end

class FakeStroke < DrawioDsl::Schema::Line
  configure_as(:some_name, stroke: :some_stroke)
end

class FakeDesign < DrawioDsl::Schema::Line
  configure_as(:some_name, design: :double)
end

class FakeWaypoint < DrawioDsl::Schema::Line
  configure_as(:some_name, waypoint: :orthogonal)
end

RSpec.describe DrawioDsl::Schema::Line do
  include_context :node_dependencies

  subject { instance }

  let(:target_class) { described_class }
  let(:instance) { target_class.new(diagram, **args) }
  let(:args) { { id: 1 } }

  context 'line configuration' do
    before { FakeStroke.configure_as(:some_name, stroke: :some_stroke) }

    it 'sets the shape_key' do
      expect(FakeStroke.shape_key).to eq(:some_name)
    end

    it 'sets the default_stroke' do
      expect(FakeStroke.default_stroke).to eq(:some_stroke)
    end

    it 'sets the default_design' do
      expect(FakeDesign.default_design).to eq(:double)
    end

    it 'sets the default_waypoint' do
      expect(FakeWaypoint.default_waypoint).to eq(:orthogonal)
    end
  end

  context 'initialize' do
    context '.source' do
      subject { instance.source }

      it { is_expected.to be_nil }
    end
    context '.target' do
      subject { instance.target }

      it { is_expected.to be_nil }
    end
    context '.exit_point' do
      subject { instance.exit_point }

      it { is_expected.to eq :nw }
    end
    context '.entry_point' do
      subject { instance.entry_point }

      it { is_expected.to eq :ne }
    end
    context '.start_arrow' do
      subject { instance.start_arrow }

      it { is_expected.to eq :none }
    end
    context '.end_arrow' do
      subject { instance.end_arrow }

      it { is_expected.to eq :simple }
    end
    context '.stroke' do
      subject { instance.stroke }

      it { is_expected.to be_nil }

      context 'when solid line' do
        let(:target_class) { DrawioDsl::Schema::Solid }

        it { is_expected.to be_nil }
      end

      context 'when dashed line' do
        let(:target_class) { DrawioDsl::Schema::Dash }

        it { is_expected.to eq(:dash) }
      end
    end
    context '.design' do
      subject { instance.design }

      it { is_expected.to be_nil }
    end
    context '.waypoint' do
      subject { instance.waypoint }

      it { is_expected.to eq(:straight) }
    end
  end
end
