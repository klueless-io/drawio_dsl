# frozen_string_literal: true

# class Fake < DrawioDsl::Schema::Element
#   configure_as(:actor)
# end

class FakeStroke < DrawioDsl::Schema::Line
  configure_as(:some_name, stroke: :some_stroke)
end

class FakeDouble < DrawioDsl::Schema::Line
  configure_as(:some_name, design: :double)
end

RSpec.describe DrawioDsl::Schema::Line do
  include_context :node_dependencies

  subject { instance }

  let(:target_class) { described_class }
  let(:instance) { target_class.new(diagram, **args) }
  let(:args) { { id: 1 } }

  context 'line configuration' do
    before { FakeStroke.configure_as(:some_name, stroke: :some_stroke) }

    it 'sets the shape key' do
      expect(FakeStroke.shape_key).to eq(:some_name)
    end

    it 'sets the shape stroke ' do
      expect(FakeStroke.default_stroke).to eq(:some_stroke)
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
    context '.c1' do
      subject { instance.c1 }

      it { is_expected.to eq :nw }
    end
    context '.c2' do
      subject { instance.c2 }

      it { is_expected.to eq :ne }
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
    context '.base_modifiers' do
      subject { instance.base_modifiers }

      it { is_expected.to be_empty }

      context 'when solid line' do
        let(:target_class) { DrawioDsl::Schema::Solid }

        it { is_expected.to be_empty }
      end

      context 'when dashed line' do
        let(:target_class) { DrawioDsl::Schema::Dash }

        it { is_expected.to eq('dashed=1;fixDash=1') }
      end
    end
  end
end
