# frozen_string_literal: true

t = true
f = false

cs = 'mxCompositeShape'
defaultFontSize = '13'
defaultLucidFont = 'Liberation Sans'
scale = 0.75
dx = 0
dy = 0

arcSize = 6
edgeStyle = 'html=1;jettySize=18;'
vertexStyle = 'html=1;overflow=block;blockSpacing=1;whiteSpace=wrap;'
labelStyle = 'text;html=1;resizable=0;labelBackgroundColor=default;align=center;verticalAlign=middle;'
containerStyle = 'container=1;pointerEvents=0;collapsible=0;recursiveResize=0;'
groupStyle = 'group;dropTarget=0;pointerEvents=0;'

c = 'verticalLabelPosition=bottom;verticalAlign=top;fillColor=#036897;strokeColor=#ffffff'
s = 'shape=mxgraph.'
ss = 'strokeColor=none;shape=mxgraph.'
ssAzure = 'verticalLabelPosition=bottom;verticalAlign=top;' + ss;
cs = 'mxCompositeShape'
azur19 = 'aspect=fixed;html=1;points=[];align=center;verticalAlign=top;image;image=img/lib/mscae/'
gcpIcon = 'html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;shape=mxgraph.gcp2.'
kupIcon = 'html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;shape=mxgraph.kubernetes.icon;prIcon='

KConfig.configure(:drawio_spec) do |config|
  base_folder = File.expand_path("#{Dir.tmpdir}/#{Time.now.to_i}#{rand(1000)}/")

  config.target_folders.add(:app, base_folder)
end

KConfig.configure(:drawio_sample_spec) do |config|
  folder = File.expand_path('spec/.samples/drawio', Dir.pwd)

  config.target_folders.add(:samples, folder)
end

RSpec.describe DrawioDsl::Drawio do
  let(:director) { described_class.init(k_builder, nil, **opts) }
  let(:k_builder) { KBuilder::BaseBuilder.init(KConfig.configuration(config_key)) }
  let(:config_key) { :drawio_spec }
  let(:opts) { {} }

  describe 'initialize' do
    describe '.k_builder' do
      subject { director.k_builder }

      it { is_expected.to eq(k_builder) }
    end

    describe '.builder' do
      subject { director.builder }

      it { is_expected.to be_a(DrawioDsl::DomBuilder) }
    end
  end

  describe '#page' do
    context 'with a block' do
      before do
        director.page('page1') do
          grid_layout
          square
          circle
          flex_layout
          circle
        end
      end

      context 'has a page' do
        subject { page_element }

        let(:page_element) { director.builder.diagram.pages.first }
        let(:page_anchor_element) { page_element.nodes.first }
        let(:node_anchor_element) { page_anchor_element.nodes.first }

        it { is_expected.to have_attributes(name: 'page1') }

        describe 'has a page anchor' do
          subject { page_anchor_element }

          it { is_expected.to be_a(DrawioDsl::Schema::Anchor).and have_attributes(type: :page_root) }
        end

        describe 'has a node anchor' do
          subject { node_anchor_element }

          it { is_expected.to be_a(DrawioDsl::Schema::Anchor).and have_attributes(type: :node_root) }
        end

        context 'with two layouts' do
          subject { node_anchor_element.nodes.layouts }

          it { is_expected.to have_attributes(count: 2) }
        end

        context 'with three shapes' do
          subject { node_anchor_element.nodes.shapes }

          it { is_expected.to have_attributes(count: 3) }
        end
      end
    end
  end

  context 'scenarios' do
    let(:config_key) { :drawio_sample_spec }

    before do
      director
        .diagram(
          theme: :style_01 # TODO
        )
        .page('Standard', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'DefaultTextBlockNew', style_modifiers: 'strokeColor=none;fillColor=none')
          square(title: 'DefaultTextBlock', style_modifiers: 'strokeColor=none;fillColor=none')
          square(title: 'DefaultSquareBlock', style_modifiers: '')
          square(title: 'RectangleBlock', style_modifiers: '')
          square(title: 'DefaultNoteBlock', style_modifiers: 'shape=note;size=15')
          square(title: 'DefaultNoteBlockV2', style_modifiers: 'shape=note;size=15')
          square(title: 'HotspotBlock', style_modifiers: 'strokeColor=none;fillColor=none')
          square(title: 'ImageSearchBlock2', style_modifiers: 'shape=image')
          square(title: 'UserImage2Block', style_modifiers: 'shape=image')
          square(title: 'ExtShapeBoxBlock', style_modifiers: '')
          square(title: 'DefaultStickyNoteBlock', style_modifiers: 'shadow=1')
        end
        .page('Flowchart', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'ProcessBlock', style_modifiers: '')
          square(title: 'DecisionBlock', style_modifiers: 'rhombus')
          square(title: 'TerminatorBlock', style_modifiers: 'rounded=1;arcSize=50')
          square(title: 'PredefinedProcessBlock', style_modifiers: 'shape=process')
          square(title: 'DocumentBlock', style_modifiers: 'shape=document;boundedLbl=1')
          square(title: 'MultiDocumentBlock', style_modifiers: s + 'flowchart.multi-document')
          square(title: 'ManualInputBlock', style_modifiers: 'shape=manualInput;size=15')
          square(title: 'PreparationBlock', style_modifiers: 'shape=hexagon;perimeter=hexagonPerimeter2')
          square(title: 'DataBlock', style_modifiers: 'shape=parallelogram;perimeter=parallelogramPerimeter;anchorPointDirection=0')
          square(title: 'DataBlockNew', style_modifiers: 'shape=parallelogram;perimeter=parallelogramPerimeter;anchorPointDirection=0')
          square(title: 'DatabaseBlock', style_modifiers: 'shape=cylinder3;size=4;anchorPointDirection=0;boundedLbl=1;')
          square(title: 'DirectAccessStorageBlock', style_modifiers: 'shape=cylinder3;direction=south;size=10;anchorPointDirection=0;boundedLbl=1;')
          square(title: 'InternalStorageBlock', style_modifiers: cs)
          square(title: 'PaperTapeBlock', style_modifiers: 'shape=tape;size=0.2')
          square(title: 'ManualOperationBlockNew', style_modifiers: 'shape=trapezoid;perimeter=trapezoidPerimeter;anchorPointDirection=0;flipV=1')
          square(title: 'DelayBlock', style_modifiers: 'shape=delay')
          square(title: 'StoredDataBlock', style_modifiers: 'shape=cylinder3;boundedLbl=1;size=15;lid=0;direction=south;')
          square(title: 'MergeBlock', style_modifiers: 'triangle;direction=south;anchorPointDirection=0')
          square(title: 'ConnectorBlock', style_modifiers: 'ellipse')
          square(title: 'OrBlock', style_modifiers: s + 'flowchart.summing_function')
          square(title: 'SummingJunctionBlock', style_modifiers: s + 'flowchart.or')
          square(title: 'DisplayBlock', style_modifiers: 'shape=display')
          square(title: 'OffPageLinkBlock', style_modifiers: 'shape=offPageConnector')
          square(title: 'BraceNoteBlock', style_modifiers: cs)
          square(title: 'NoteBlock', style_modifiers: cs)
        end
        .page('Containers', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'AdvancedSwimLaneBlock', style_modifiers: cs)
          square(title: 'AdvancedSwimLaneBlockRotated', style_modifiers: cs)
          square(title: 'RectangleContainerBlock', style_modifiers: containerStyle)
          square(title: 'DiamondContainerBlock', style_modifiers: 'shape=rhombus;' + containerStyle)
          square(title: 'RoundedRectangleContainerBlock', style_modifiers: 'rounded=1;absoluteArcSize=1;arcSize=24;' + containerStyle)
          square(title: 'CircleContainerBlock', style_modifiers: 'ellipse;' + containerStyle)
          square(title: 'PillContainerBlock', style_modifiers: 'shape=mxgraph.flowchart.terminator;' + containerStyle)
          square(title: 'BraceBlock', style_modifiers: cs)
          square(title: 'BracketBlock', style_modifiers: cs)
          square(title: 'BraceBlockRotated', style_modifiers: cs)
          square(title: 'BracketBlockRotated', style_modifiers: cs)
        end
        .page('Geometric shapes', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'IsoscelesTriangleBlock', style_modifiers: 'shape=mxgraph.basic.acute_triangle;dx=0.5;anchorPointDirection=0')
          square(title: 'RightTriangleBlock', style_modifiers: s + 'basic.orthogonal_triangle')
          square(title: 'PentagonBlock', style_modifiers: s + 'basic.pentagon')
          square(title: 'HexagonBlock', style_modifiers: 'shape=hexagon;perimeter=hexagonPerimeter2')
          square(title: 'OctagonBlock', style_modifiers: s + 'basic.octagon2;dx=15;')
          square(title: 'CrossBlock', style_modifiers: 'shape=cross;size=0.6')
          square(title: 'CloudBlock', style_modifiers: 'ellipse;shape=cloud')
          square(title: 'HeartBlock', style_modifiers: s + 'basic.heart')
          square(title: 'RightArrowBlock', style_modifiers: cs)
          square(title: 'DoubleArrowBlock', style_modifiers: cs)
          square(title: 'CalloutBlock', style_modifiers: s + 'basic.rectangular_callout')
          square(title: 'CalloutSquareBlock', style_modifiers: cs)
          square(title: 'ShapeCircleBlock', style_modifiers: 'ellipse')
          square(title: 'ShapePolyStarBlock', style_modifiers: s + 'basic.star')
          square(title: 'ShapeDiamondBlock', style_modifiers: 'rhombus')
        end
        .page('Misc', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'UI2HotspotBlock', style_modifiers: 'opacity=50;strokeColor=none')
        end
        .page('Android', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'AndroidIconCheck', style_modifiers: s + 'ios7.misc.check')
          square(title: 'AndroidIconCancel', style_modifiers: s + 'atlassian.x')
          square(title: 'AndroidIconCollapse', style_modifiers: s + 'ios7.misc.up')
          square(title: 'AndroidIconExpand', style_modifiers: s + 'ios7.misc.down')
          square(title: 'AndroidIconNext', style_modifiers: s + 'ios7.misc.right')
          square(title: 'AndroidIconPrevious', style_modifiers: s + 'ios7.misc.left')
          square(title: 'AndroidIconRefresh', style_modifiers: 'ios7.icons.repeat')
          square(title: 'AndroidIconInformation', style_modifiers: s + 'ios7.icons.info')
          square(title: 'AndroidIconSearch', style_modifiers: s + 'ios7.icons.looking_glass')
          square(title: 'AndroidIconSettings', style_modifiers: s + 'ios7.icons.volume;direction=south')
          square(title: 'AndroidIconTrash', style_modifiers: s + 'ios7.icons.trashcan')
          square(title: 'AndroidIconEmail', style_modifiers: s + 'mockup.misc.mail2')
          square(title: 'AndroidIconNew', style_modifiers: s + 'ios7.misc.flagged')
  

        end
        .page('iOS mockups', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'iOSDeviceiPhoneSE', style_modifiers: s + 'ios7.misc.iphone')
          square(title: 'iOSDeviceiPhone6s', style_modifiers: s + 'ios7.misc.iphone')
          square(title: 'iOSDeviceiPhone6sPlus', style_modifiers: s + 'ios7.misc.iphone')
          square(title: 'iOSDeviceiPadPortrait', style_modifiers: s + 'ios7.misc.ipad7inch')
          square(title: 'iOSDeviceiPadLandscape', style_modifiers: s + 'ios7.misc.ipad7inch')
          square(title: 'iOSDeviceiPadProPortrait', style_modifiers: s + 'ios7.misc.ipad7inch')
          square(title: 'iOSDeviceiPadProLandscape', style_modifiers: s + 'ios7.misc.ipad10inch')
        end
        .page('iOS UI components', active: t, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'iOSButton', style_modifiers: 'fillColor=none;strokeColor=none;')
          square(title: 'iOSSegmentedControl', style_modifiers: cs)
          square(title: 'iOSStepper', style_modifiers: s + 'ios7.misc.adjust')
          square(title: 'iOSToggle', style_modifiers: s + 'ios7ui.onOffButton;buttonState=on;strokeColor2=#aaaaaa;fillColor2=#ffffff')
          square(title: 'iOSSlider', style_modifiers: cs)
          square(title: 'iOSProgressBar', style_modifiers: cs)
          square(title: 'iOSPageControls', style_modifiers: cs)
          square(title: 'iOSStatusBar', style_modifiers: cs)
          square(title: 'iOSSearchBar', style_modifiers: cs)
          square(title: 'iOSNavBar', style_modifiers: cs)
          square(title: 'iOSTabs', style_modifiers: cs)
          square(title: 'iOSUniversalKeyboard', style_modifiers: s + 'ios.iKeybLett')
          square(title: 'iOSDatePicker', style_modifiers: cs)
          square(title: 'iOSTimePicker', style_modifiers: cs)
          square(title: 'iOSCountdownPicker', style_modifiers: cs)
          square(title: 'iOSBasicCell', style_modifiers: cs)
          square(title: 'iOSSubtitleCell', style_modifiers: cs)
          square(title: 'iOSRightDetailCell', style_modifiers: cs)
          square(title: 'iOSLeftDetailCell', style_modifiers: cs)
          square(title: 'iOSTableGroupedSectionBreak', style_modifiers: cs)
          square(title: 'iOSTablePlainHeaderFooter', style_modifiers: cs)
        end
        .page('Mind Map', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'MindMapBlock', style_modifiers: '')
          square(title: 'MindMapStadiumBlock', style_modifiers: 'arcSize=50')
          square(title: 'MindMapCloud', style_modifiers: 'shape=cloud')
          square(title: 'MindMapCircle', style_modifiers: 'ellipse')
          square(title: 'MindMapIsoscelesTriangleBlock', style_modifiers: 'shape=triangle;direction=north')
          square(title: 'MindMapDiamondBlock', style_modifiers: 'shape=rhombus')
          square(title: 'MindMapPentagonBlock', style_modifiers: s + 'basic.pentagon')
          square(title: 'MindMapHexagonBlock', style_modifiers: 'shape=hexagon;perimeter=hexagonPerimeter2')
          square(title: 'MindMapOctagonBlock', style_modifiers: s + 'basic.octagon2;dx=10;')
          square(title: 'MindMapCrossBlock', style_modifiers: s + 'basic.cross2;dx=20')
        end
        .page('UML Class Diagram', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'UMLActorBlock', style_modifiers: 'shape=umlActor;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;whiteSpace=nowrap')
          square(title: 'UMLUseCaseBlock', style_modifiers: 'ellipse')
          square(title: 'UMLCircleContainerBlock', style_modifiers: 'ellipse;' + containerStyle)
          square(title: 'UMLRectangleContainerBlock', style_modifiers: containerStyle)
          square(title: 'UMLOptionLoopBlock', style_modifiers: s + 'sysml.package2;xSize=90;overflow=fill')
          square(title: 'UMLAlternativeBlock2', style_modifiers: s + 'sysml.package2;xSize=90;overflow=fill')
          square(title: 'UMLStartBlock', style_modifiers: 'ellipse;fillColor=#000000')
          square(title: 'UMLStateBlock', style_modifiers: cs)
          square(title: 'UMLDecisionBlock', style_modifiers: 'shape=rhombus;')
          square(title: 'UMLHForkJoinBlock', style_modifiers: 'fillColor=#000000')
          square(title: 'UMLVForkJoinBlock', style_modifiers: 'fillColor=#000000')
          square(title: 'UMLFlowFinalBlock', style_modifiers: s + 'flowchart.or')
          square(title: 'UMLHistoryStateBlock', style_modifiers: 'ellipse')
          square(title: 'UMLEndBlock', style_modifiers: s + 'bpmn.shape;outline=end;symbol=terminate;strokeColor=#000000;fillColor=#ffffff')
          square(title: 'UMLObjectBlock', style_modifiers: '')
          square(title: 'UMLSendSignalBlock', style_modifiers: s + 'sysml.sendSigAct')
          square(title: 'UMLReceiveSignalBlock', style_modifiers: s + 'sysml.accEvent;flipH=1')
          square(title: 'UMLAcceptTimeEventActionBlock', style_modifiers: s + 'sysml.timeEvent')
          square(title: 'UMLOffPageLinkBlock', style_modifiers: s + 'sysml.sendSigAct;direction=south')
          square(title: 'UMLMultiLanePoolBlock', style_modifiers: cs)
          square(title: 'UMLMultiLanePoolRotatedBlock', style_modifiers: cs)
          square(title: 'UMLMultidimensionalSwimlane', style_modifiers: cs)
          square(title: 'UMLActivationBlock', style_modifiers: '')
          square(title: 'UMLDeletionBlock', style_modifiers: s + 'sysml.x;strokeWidth=4')
          square(title: 'UMLSeqEntityBlock', style_modifiers: s + 'electrical.radio.microphone_1;direction=north')
          square(title: 'UMLComponentBlock', style_modifiers: 'shape=component;align=left;spacingLeft=36')
          square(title: 'UMLComponentBlockV2', style_modifiers: 'shape=component;align=left;spacingLeft=36')
          square(title: 'UMLNodeBlock', style_modifiers: 'shape=cube;size=20;flipH=1;verticalAlign=top;spacingTop=22;spacingLeft=5')
          square(title: 'UMLNodeBlockV2', style_modifiers: 'shape=cube;size=20;flipH=1;verticalAlign=top;spacingTop=22;spacingLeft=5')
          square(title: 'UMLComponentInterfaceBlock', style_modifiers: 'ellipse')
          square(title: 'UMLComponentInterfaceBlockV2', style_modifiers: 'ellipse')
          square(title: 'UMLComponentBoxBlock', style_modifiers: cs)
          square(title: 'UMLComponentBoxBlockV2', style_modifiers: cs)
          square(title: 'UMLAssemblyConnectorBlock', style_modifiers: cs)
          square(title: 'UMLAssemblyConnectorBlockV2', style_modifiers: cs)
          square(title: 'UMLProvidedInterfaceBlock', style_modifiers: cs)
          square(title: 'UMLProvidedInterfaceBlockV2', style_modifiers: cs)
          square(title: 'UMLRequiredInterfaceBlock', style_modifiers: 'shape=requires;direction=north')
          square(title: 'UMLRequiredInterfaceBlockV2', style_modifiers: 'shape=requires;direction=north')
          square(title: 'UMLSwimLaneBlockV2', style_modifiers: cs)
          square(title: 'UMLSwimLaneBlock', style_modifiers: 'swimlane;startSize=25;dropTarget=0;fontStyle=0' + containerStyle)
          square(title: 'UMLEntityBlock', style_modifiers: '')
          square(title: 'UMLWeakEntityBlock', style_modifiers: 'shape=ext;double=1')
          square(title: 'UMLAttributeBlock', style_modifiers: 'ellipse')
          square(title: 'UMLMultivaluedAttributeBlock', style_modifiers: 'shape=doubleEllipse')
          square(title: 'UMLRelationshipBlock', style_modifiers: 'shape=rhombus')
          square(title: 'UMLWeakRelationshipBlock', style_modifiers: 'shape=rhombus;double=1')
        end
        .page('Shipments', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'VSMExternalShipmentAirplaneBlock', style_modifiers: s + 'lean_mapping.airplane_7')
          square(title: 'VSMExternalShipmentForkliftBlock', style_modifiers: s + 'lean_mapping.move_by_forklift')
          square(title: 'VSMExternalShipmentTruckBlock', style_modifiers: s + 'lean_mapping.truck_shipment;align=left;')
          square(title: 'VSMExternalShipmentBoatBlock', style_modifiers: s + 'lean_mapping.boat_shipment;verticalAlign=bottom;')
  

        end
        .page('Value Stream Mapping', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'VSMKaizenBurstBlock', style_modifiers: s + 'lean_mapping.kaizen_lightening_burst')
          square(title: 'VSMOperatorBlock', style_modifiers: s + 'lean_mapping.operator;flipV=1')
          square(title: 'VSMTimelineBlock', style_modifiers: cs)
          square(title: 'VSMQualityProblemBlock', style_modifiers: s + 'lean_mapping.quality_problem')
          

        end
        .page('Kanban', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'VSMProductionKanbanSingleBlock', style_modifiers: 'shape=card;size=18;flipH=1;')
          square(title: 'VSMProductionKanbanBatchBlock', style_modifiers: cs)
          square(title: 'VSMWithdrawalKanbanBlock', style_modifiers: s + 'lean_mapping.withdrawal_kanban')
          square(title: 'VSMSignalKanbanBlock', style_modifiers: 'shape=triangle;direction=south;anchorPointDirection=0')
          square(title: 'VSMKanbanPostBlock', style_modifiers: s + 'lean_mapping.kanban_post')
        end
        .page('Arrows', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'VSMShipmentArrow', style_modifiers: 'shape=singleArrow;arrowWidth=0.5;arrowSize=0.13')
          square(title: 'VSMPushArrow', style_modifiers: s + 'lean_mapping.push_arrow')
          square(title: 'VSMElectronicInformationArrow', style_modifiers: cs)
        end
        .page('EC2', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'AWSElasticComputeCloudBlock2', style_modifiers: cs)
          square(title: 'AWSInstanceBlock2', style_modifiers: ss + 'aws3.instance')
          square(title: 'AWSInstancesBlock2', style_modifiers: ss + 'aws3.instances;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAMIBlock2', style_modifiers: ss + 'aws3.ami;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDBonInstanceBlock2', style_modifiers: ss + 'aws3.db_on_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSInstanceCloudWatchBlock2', style_modifiers: ss + 'aws3.instance_with_cloudwatch;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElasticIPBlock2', style_modifiers: ss + 'aws3.elastic_ip;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSHDFSClusterBlock2', style_modifiers: ss + 'aws3.hdfs_cluster;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAutoScalingBlock2', style_modifiers: ss + 'aws3.auto_scaling;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEC2OptimizedInstance2', style_modifiers: ss + 'aws3.optimized_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonEC2(Spotinstance)', style_modifiers: ss + 'aws3.spot_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonECR', style_modifiers: ss + 'aws3.ecr;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonECS', style_modifiers: ss + 'aws3.ecs;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSLambda2', style_modifiers: ss + 'aws3.lambda;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElasticLoadBalancing', style_modifiers: ss + 'aws3.elastic_load_balancing;verticalLabelPosition=bottom;align=center;verticalAlign=top')

        end
        .page('Networking', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'AWSElasticLoadBlock2', style_modifiers: ss + 'aws3.classic_load_balancer;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDirectConnectBlock3', style_modifiers: ss + 'aws3.direct_connect;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElasticNetworkBlock2', style_modifiers: ss + 'aws3.elastic_network_interface;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRoute53Block2', style_modifiers: cs)
          square(title: 'AWSHostedZoneBlock2', style_modifiers: ss + 'aws3.hosted_zone;fontColor=#ffffff;fontStyle=1')
          square(title: 'AWSRouteTableBlock2', style_modifiers: 'strokeColor=none;shape=mxgraph.aws3.route_table;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSVPCBlock2', style_modifiers: ss + 'aws3.vpc;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSVPNConnectionBlock2', style_modifiers: ss + 'aws3.vpn_connection;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSVPNGatewayBlock2', style_modifiers: ss + 'aws3.vpn_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCustomerGatewayBlock2', style_modifiers: ss + 'aws3.customer_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCustomerGatewayBlock3', style_modifiers: ss + 'aws3.customer_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSInternetGatewayBlock2', style_modifiers: ss + 'aws3.internet_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRouterBlock2', style_modifiers: ss + 'aws3.router;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRouterBlock3', style_modifiers: ss + 'aws3.router;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonVPC(endpoints)', style_modifiers: ss + 'aws3.endpoints;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonVPC(flowlogs)', style_modifiers: ss + 'aws3.flow_logs;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonVPC(VPCNATgateway)', style_modifiers: ss + 'aws3.vpc_nat_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSVPCPeering3', style_modifiers: ss + 'aws3.vpc_peering;verticalLabelPosition=bottom;align=center;verticalAlign=top')

        end
        .page('S3', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'AWSSimpleStorageBlock2', style_modifiers: ss + 'aws3.s3;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSBucketBlock2', style_modifiers: ss + 'aws3.bucket;fontStyle=1;fontColor=#ffffff')
          square(title: 'AWSBuckethWithObjectsBlock2', style_modifiers: ss + 'aws3.bucket_with_objects;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSObjectBlock2', style_modifiers: ss + 'aws3.object;fontStyle=1;fontColor=#ffffff')
          square(title: 'AWSImportExportBlock2', style_modifiers: ss + 'aws3.import_export;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSStorageGatewayBlock2', style_modifiers: ss + 'aws3.storage_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElasticBlockStorageBlock2', style_modifiers: ss + 'aws3.volume;fontStyle=1;fontColor=#ffffff')
          square(title: 'AWSVolumeBlock3', style_modifiers: ss + 'aws3.volume;fontStyle=1;fontColor=#ffffff')
          square(title: 'AWSSnapshotBlock2', style_modifiers: ss + 'aws3.snapshot;fontStyle=1;fontColor=#ffffff')
          square(title: 'AWSGlacierArchiveBlock3', style_modifiers: ss + 'aws3.archive;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSGlacierVaultBlock3', style_modifiers: ss + 'aws3.vault;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonEFS', style_modifiers: ss + 'aws3.efs;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSGlacierBlock2', style_modifiers: ss + 'aws3.glacier;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSImportExportSnowball', style_modifiers: ss + 'aws3.snowball;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSStorageGatewayCachedVolumn2', style_modifiers: ss + 'aws3.cached_volume;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSStorageGatewayNon-CachedVolumn2', style_modifiers: ss + 'aws3.non_cached_volume;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSStorageGatewayVirtualTapeLibrary2', style_modifiers: ss + 'aws3.virtual_tape_library;verticalLabelPosition=bottom;align=center;verticalAlign=top')

        end
        .page('Content Delivery', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSCloudFrontBlock2', style_modifiers: ss + 'aws3.cloudfront;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDownloadDistBlock2', style_modifiers: ss + 'aws3.download_distribution;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSStreamingBlock2', style_modifiers: ss + 'aws3.streaming_distribution;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEdgeLocationBlock2', style_modifiers: ss + 'aws3.edge_location;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Database', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSItemBlock2', style_modifiers: ss + 'aws3.item;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSItemsBlock2', style_modifiers: ss + 'aws3.items;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAttributeBlock2', style_modifiers: ss + 'aws3.attribute;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAttributesBlock2', style_modifiers: ss + 'aws3.attributes;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRDBSBlock2', style_modifiers: cs)
          square(title: 'AWSRDSInstanceBlock2', style_modifiers: ss + 'aws3.rds_db_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRDSStandbyBlock2', style_modifiers: ss + 'aws3.rds_db_instance_standby_multi_az;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRDSInstanceReadBlock2', style_modifiers: ss + 'aws3.rds_db_instance_read_replica;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOracleDBBlock2', style_modifiers: ss + 'aws3.oracle_db_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSMySQLDBBlock2', style_modifiers: ss + 'aws3.mysql_db_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDynamoDBBlock2', style_modifiers: ss + 'aws3.dynamo_db;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSSimpleDatabaseBlock3', style_modifiers: ss + 'aws2.database.simpledb;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSSimpleDatabaseDomainBlock3', style_modifiers: ss + 'aws2.database.simpledb_domain;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSTableBlock2', style_modifiers: ss + 'aws3.table;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRedShiftBlock3', style_modifiers: ss + 'aws3.redshift;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElastiCacheNodeBlock2', style_modifiers: ss + 'aws3.cache_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElastiCacheBlock2', style_modifiers: ss + 'aws3.elasticache;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDynamoDBGlobalSecondaryIndexes2', style_modifiers: ss + 'aws3.global_secondary_index;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonElastiCacheMemcache2', style_modifiers: ss + 'aws3.memcached;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonElastiCacheRedis2', style_modifiers: ss + 'aws3.redis;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRDSMSSQLInstance2', style_modifiers: ss + 'aws3.ms_sql_instance_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSMSSQLDBBlock3', style_modifiers: ss + 'aws3.ms_sql_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRDSMySQLDBInstance2', style_modifiers: ss + 'aws3.mysql_db_instance_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRDSOracleDBInstance2', style_modifiers: ss + 'aws3.oracle_db_instance_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRDSReplicasetswithPIOP2', style_modifiers: ss + 'aws3.piop;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRDSPostgreSQL2', style_modifiers: ss + 'aws3.postgre_sql_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRDSMasterSQL2', style_modifiers: ss + 'aws3.sql_master;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRDSSlaveSQL2', style_modifiers: ss + 'aws3.sql_slave;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRedshift(densecomputenode)', style_modifiers: ss + 'aws3.dense_compute_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRedshift(densestoragenode)', style_modifiers: ss + 'aws3.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSDatabaseMigrationService', style_modifiers: ss + 'aws3.database_migration_service;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Security Identity', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
        
          square(title: 'AWSACM', style_modifiers: ss + 'aws3.certificate_manager;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonInspector', style_modifiers: ss + 'aws3.inspector;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSCloudHSM', style_modifiers: ss + 'aws3.cloudhsm;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDirectoryService2', style_modifiers: ss + 'aws3.directory_service;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSKMS', style_modifiers: ss + 'aws3.kms;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSWAF', style_modifiers: ss + 'aws3.waf;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSACM(certificate-manager)', style_modifiers: ss + 'aws3.certificate_manager_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('App Services', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSSESBlock2', style_modifiers: ss + 'aws3.ses;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEmailBlock2', style_modifiers: ss + 'aws3.email;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSSNSBlock2', style_modifiers: ss + 'aws3.sns;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSSQSBlock3', style_modifiers: ss + 'aws3.sqs;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSQueueBlock2', style_modifiers: ss + 'aws3.queue;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSMessageBlock2', style_modifiers: ss + 'aws3.message;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDeciderBlock2', style_modifiers: ss + 'aws3.decider;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSSWFBlock2', style_modifiers: ss + 'aws3.swf;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSWorkerBlock2', style_modifiers: ss + 'aws3.worker;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCloudSearchBlock2', style_modifiers: ss + 'aws3.cloudsearch;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCloudSearchMetadataBlock3', style_modifiers: ss + 'aws3.search_documents;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElasticTranscoder3', style_modifiers: ss + 'aws3.elastic_transcoder;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonAPIGateway', style_modifiers: ss + 'aws3.api_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAppStream2', style_modifiers: ss + 'aws3.appstream;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Deployment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSCloudFormationBlock2', style_modifiers: ss + 'aws3.cloudformation;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDataPipelineBlock3', style_modifiers: ss + 'aws3.data_pipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDataPipelineBlock2', style_modifiers: ss + 'aws3.data_pipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSTemplageBlock2', style_modifiers: ss + 'aws3.template;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSStackBlock2', style_modifiers: ss + 'aws3.stack_aws_cloudformation;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSBeanStockBlock2', style_modifiers: ss + 'aws3.elastic_beanstalk;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSApplicationBlock2', style_modifiers: ss + 'aws3.application;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSBeanstalkDeploymentBlock3', style_modifiers: ss + 'aws3.deployment;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMBlock3', style_modifiers: ss + 'aws3.iam;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMSTSBlock3', style_modifiers: ss + 'aws3.sts;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMAddonBlock2', style_modifiers: ss + 'aws3.add_on;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCloudWatchBlock3', style_modifiers: ss + 'aws3.cloudwatch;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCloudWatchAlarmBlock2', style_modifiers: ss + 'aws3.alarm;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMSecurityTokenService2', style_modifiers: ss + 'aws3.sts_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMDataEncryptionKey2', style_modifiers: ss + 'aws3.data_encryption_key;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMEncryptedData2', style_modifiers: ss + 'aws3.encrypted_data;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIAM(long-termsecuritycredential)', style_modifiers: ss + 'aws3.long_term_security_credential;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMMFAToken2', style_modifiers: ss + 'aws3.mfa_token;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMPermissions2', style_modifiers: ss + 'aws3.permissions_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSIAMRoles2', style_modifiers: ss + 'aws3.role;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIAM(temporarysecuritycredential)', style_modifiers: ss + 'aws3.long_term_security_credential;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCloudTrail2', style_modifiers: ss + 'aws3.cloudtrail;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSConfig2', style_modifiers: ss + 'aws3.config;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksBlock3', style_modifiers: ss + 'aws3.opsworks;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSServiceCatalog', style_modifiers: ss + 'aws3.service_catalog;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSTrustedAdvisor2', style_modifiers: ss + 'aws3.trusted_advisor;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksApps2', style_modifiers: ss + 'aws3.apps;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksDeployments2', style_modifiers: ss + 'aws3.deployments;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksInstances2', style_modifiers: ss + 'aws3.instances_2;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksLayers2', style_modifiers: ss + 'aws3.layers;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksMonitoring2', style_modifiers: ss + 'aws3.monitoring;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksPermissions2', style_modifiers: ss + 'aws3.permissions;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksResources2', style_modifiers: ss + 'aws3.resources;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSOpsWorksStack2', style_modifiers: ss + 'aws3.stack_aws_opsworks;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('On-Demand', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSMechanicalTurkBlock3', style_modifiers: ss + 'aws3.mechanical_turk;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSHumanITBlock2', style_modifiers: ss + 'aws3.human_intelligence_tasks_hit;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAssignmentTaskBlock2', style_modifiers: ss + 'aws3.requester;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSWorkersBlock2', style_modifiers: ss + 'aws3.users;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRequesterBlock2', style_modifiers: ss + 'aws3.assignment_task;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('SDKs', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSAndroidBlock3', style_modifiers: ss + 'aws3.android;fillColor=#96BF3D;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSiOSBlock3', style_modifiers: ss + 'aws3.android;fillColor=#CFCFCF;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSJavaBlock3', style_modifiers: ss + 'aws3.android;fillColor=#EE472A;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSJavaScript', style_modifiers: ss + 'aws3.android;fillColor=#205E00;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSNetBlock3', style_modifiers: ss + 'aws3.android;fillColor=#115193;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSNodeJSBlock3', style_modifiers: ss + 'aws3.android;fillColor=#8CC64F;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSPHPBlock3', style_modifiers: ss + 'aws3.android;fillColor=#5A69A4;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSPythonBlock3', style_modifiers: ss + 'aws3.android;fillColor=#FFD44F;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSRubyBlock3', style_modifiers: ss + 'aws3.android;fillColor=#AE1F23;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSXamarin', style_modifiers: ss + 'aws3.android;fillColor=#4090D7;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCLIBlock3', style_modifiers: ss + 'aws3.cli;fillColor=#444444;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEclipseToolkitBlock3', style_modifiers: ss + 'aws3.toolkit_for_eclipse;fillColor=#342074;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSVisualStudioToolkitBlock3', style_modifiers: ss + 'aws3.toolkit_for_visual_studio;fillColor=#53B1CB;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSWindowsPowershellToolkitBlock3', style_modifiers: ss + 'aws3.toolkit_for_windows_powershell;fillColor=#737373;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Analytics', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSAmazonElasticsearchService', style_modifiers: ss + 'aws3.elasticsearch_service;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSElasticMapReduceBlock2', style_modifiers: ss + 'aws3.emr;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSClusterBlock2', style_modifiers: ss + 'aws3.emr_cluster;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEMREngine2', style_modifiers: ss + 'aws3.emr_engine;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEMRMapRM3Engine2', style_modifiers: ss + 'aws3.emr_engine_mapr_m3;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEMRMapRM5Engine2', style_modifiers: ss + 'aws3.emr_engine_mapr_m5;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSEMRMapRM7Engine2', style_modifiers: ss + 'aws3.emr_engine_mapr_m7;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSKinesis2', style_modifiers: ss + 'aws3.kinesis;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonKinesis(AmazonKinesisAnalytics)', style_modifiers: ss + 'aws3.kinesis;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSKinesisEnabledApp2', style_modifiers: ss + 'aws3.kinesis_enabled_app;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonKinesis(AmazonKinesisFirehose)', style_modifiers: ss + 'aws3.kinesis_firehose;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonKinesis(AmazonKinesisStreams)', style_modifiers: ss + 'aws3.kinesis_streams;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonMachineLearning', style_modifiers: ss + 'aws3.machine_learning;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonQuickSight', style_modifiers: ss + 'aws3.quicksight;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Mobile Services', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSCognito2', style_modifiers: ss + 'aws3.cognito;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSMobileAnalytics2', style_modifiers: ss + 'aws3.mobile_analytics;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSDeviceFarm', style_modifiers: ss + 'aws3.device_farm;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSMobileHub', style_modifiers: ss + 'aws3.mobile_hub;gradientColor=#AD688A;gradientDirection=east;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSTopicBlock2', style_modifiers: ss + 'aws3.topic_2;fontStyle=1;fontColor=#ffffff;verticalAlign=top;spacingTop=-5')
          square(title: 'AWSEmailNotificationBlock2', style_modifiers: ss + 'aws3.email_notification;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSHTTPNotificationBlock2', style_modifiers: ss + 'aws3.http_notification;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Developer Tools', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSAWSCodeCommit', style_modifiers: ss + 'aws3.codecommit;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSCodeDeploy2', style_modifiers: ss + 'aws3.codedeploy;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSCodePipeline', style_modifiers: ss + 'aws3.codepipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Enterprise Application', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSWorkDocs2', style_modifiers: ss + 'aws3.workdocs;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonWorkMail', style_modifiers: ss + 'aws3.workmail;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonWorkSpaces2', style_modifiers: ss + 'aws3.workspaces;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('Internet of Things', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSAWSIoT', style_modifiers: ss + 'aws3.aws_iot;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(action)', style_modifiers: ss + 'aws3.action;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(actuator)', style_modifiers: ss + 'aws3.actuator;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(certificate)', style_modifiers: ss + 'aws3.certificate;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(desiredstate)', style_modifiers: ss + 'aws3.desired_state;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(hardwareboard)', style_modifiers: ss + 'aws3.hardware_board;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(HTTP2protocol)', style_modifiers: ss + 'aws3.http_2_protocol;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(HTTPprotocol)', style_modifiers: ss + 'aws3.http_protocol;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(MQTTprotocol)', style_modifiers: ss + 'aws3.mqtt_protocol;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(policy)', style_modifiers: ss + 'aws3.policy;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(reportedstate)', style_modifiers: ss + 'aws3.reported_state;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(rule)', style_modifiers: ss + 'aws3.rule;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(sensor)', style_modifiers: ss + 'aws3.sensor;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(servo)', style_modifiers: ss + 'aws3.servo;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(shadow)', style_modifiers: ss + 'aws3.shadow;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(simulator)', style_modifiers: ss + 'aws3.simulator;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingbank)', style_modifiers: ss + 'aws3.bank;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingbicycle)', style_modifiers: ss + 'aws3.bicycle;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingcamera)', style_modifiers: ss + 'aws3.camera;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingcar)', style_modifiers: ss + 'aws3.car;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingcart)', style_modifiers: ss + 'aws3.cart;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingcoffeepot)', style_modifiers: ss + 'aws3.coffee_pot;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingdoorlock)', style_modifiers: ss + 'aws3.door_lock;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingfactory)', style_modifiers: ss + 'aws3.factory;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thinggeneric)', style_modifiers: ss + 'aws3.generic;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thinghouse)', style_modifiers: ss + 'aws3.house;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thinglightbulb)', style_modifiers: ss + 'aws3.lightbulb;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingmedicalemergency)', style_modifiers: ss + 'aws3.medical_emergency;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingpoliceemergency)', style_modifiers: ss + 'aws3.police_emergency;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingthermostat)', style_modifiers: ss + 'aws3.thermostat;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingtravel)', style_modifiers: ss + 'aws3.travel;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingutility)', style_modifiers: ss + 'aws3.utility;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(thingwindfarm)', style_modifiers: ss + 'aws3.windfarm;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAWSIoT(topic)', style_modifiers: ss + 'aws3.topic;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('AWS General', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSCloudBlock2', style_modifiers: ss + 'aws3.cloud;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSVPCloudBlock3', style_modifiers: ss + 'aws3.virtual_private_cloud;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSUserBlock2', style_modifiers: ss + 'aws3.user;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSUsersBlock2', style_modifiers: ss + 'aws3.users;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSClientBlock2', style_modifiers: ss + 'aws3.management_console;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSMobileClientBlock2', style_modifiers: ss + 'aws3.mobile_client;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSGenericDatabaseBlock3', style_modifiers: ss + 'aws3.generic_database;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDiskBlock3', style_modifiers: ss + 'aws3.disk;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSTapeStorageBlock3', style_modifiers: ss + 'aws3.tape_storage;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSMediaBlock2', style_modifiers: ss + 'aws3.multimedia;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSDataCenterBlock2', style_modifiers: ss + 'aws3.corporate_data_center;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSServerBlock2', style_modifiers: ss + 'aws3.traditional_server;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSInternetBlock2', style_modifiers: ss + 'aws2.non-service_specific.internet;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSForumsBlock3', style_modifiers: ss + 'aws3.forums;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSManagementBlock2', style_modifiers: ss + 'aws3.management_console;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonElasticCacheNode2', style_modifiers: ss + 'aws3.cache_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRedshiftDW1Cluster2', style_modifiers: ss + 'aws3.dense_compute_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRedshiftDW2Cluster2', style_modifiers: ss + 'aws3.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRedshiftSSDFamilyCluster2', style_modifiers: ss + 'aws3.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSAmazonRoute53RouteTable2', style_modifiers: ss + 'aws3.route_table;verticalLabelPosition=bottom;align=center;verticalAlign=top')
          square(title: 'AWSSubnetBlock2', style_modifiers: ss + 'aws3.permissions;verticalLabelPosition=bottom;align=center;verticalAlign=top')
        end
        .page('AWS Containers', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AWSRoundedRectangleContainerBlock2', style_modifiers: cs)
          square(title: 'AWSRoundedRectangleContainerBlock', style_modifiers: cs)
        end
        .page('Azure Cloud', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'ACAccessControlBlock', style_modifiers: ssAzure + 'azure.access_control')
          square(title: 'ACAPIAppsBlock', style_modifiers: ssAzure + 'mscae.cloud.api_app')
          square(title: 'ACAPIManagementBlock', style_modifiers: ssAzure + 'mscae.cloud.api_management')
          square(title: 'ACAppInsightsBlock', style_modifiers: ssAzure + 'mscae.cloud.application_insights')
          square(title: 'ACAppServicesBlock', style_modifiers: ssAzure + 'mscae.cloud.app_service')
          square(title: 'ACAutoscalingBlock', style_modifiers: ssAzure + 'azure.autoscale')
          square(title: 'ACAzureActiveDirectoryBlock', style_modifiers: ssAzure + 'azure.azure_active_directory')
          square(title: 'ACAzurealertBlock', style_modifiers: ssAzure + 'azure.azure_alert')
          square(title: 'ACAzureAutomationBlock', style_modifiers: ssAzure + 'azure.automation')
          square(title: 'ACAzureBatchBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_batch')
          square(title: 'ACAzureRedisBlock', style_modifiers: ssAzure + 'azure.azure_cache')
          square(title: 'ACAzureFilesBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_files_service')
          square(title: 'ACAzureloadbalancerBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_automatic_load_balancer')
          square(title: 'ACAzureMarketplaceBlock', style_modifiers: ssAzure + 'azure.azure_marketplace')
          square(title: 'ACAzureRightManagementRMSBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_rights_management_rms')
          square(title: 'ACAzureSDKBlock', style_modifiers: ssAzure + 'azure.azure_sdk')
          square(title: 'ACAzureSearchBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_search')
          square(title: 'ACAzureSQLdatabaseBlock', style_modifiers: ssAzure + 'azure.sql_database_sql_azure')
          square(title: 'ACAzuresubscriptionBlock', style_modifiers: ssAzure + 'azure.azure_subscription')
          square(title: 'ACAzureWebsitesBlock', style_modifiers: ssAzure + 'azure.azure_website')
          square(title: 'ACBackupServiceBlock', style_modifiers: ssAzure + 'azure.backup_service')
          square(title: 'ACBitbucketcodesourceBlock', style_modifiers: ssAzure + 'azure.bitbucket_code_source')
          square(title: 'ACBizTalkServicesBlock', style_modifiers: ssAzure + 'azure.biztalk_services')
          square(title: 'ACCloudServiceBlock', style_modifiers: ssAzure + 'azure.cloud_service')
          square(title: 'ACCodePlexBlock', style_modifiers: ssAzure + 'azure.codeplex_code_source')
          square(title: 'ACContentDeliveryNetworkBlock', style_modifiers: ssAzure + 'azure.content_delivery_network')
          square(title: 'ACDataFactoryBlock', style_modifiers: ssAzure + 'mscae.cloud.data_factory')
          square(title: 'ACDocumentDBBlock', style_modifiers: ssAzure + 'mscae.cloud.documentdb')
          square(title: 'ACDropboxcodesourceBlock', style_modifiers: ssAzure + 'azure.dropbox_code_source')
          square(title: 'ACEventsHubBlock', style_modifiers: ssAzure + 'mscae.cloud.event_hubs')
          square(title: 'ACExpressRouteBlock', style_modifiers: ssAzure + 'azure.express_route')
          square(title: 'ACGitHubBlock', style_modifiers: ssAzure + 'azure.github_code')
          square(title: 'ACGitrepositoryBlock', style_modifiers: ssAzure + 'azure.git_repository')
          square(title: 'ACHDInsightBlock', style_modifiers: ssAzure + 'mscae.cloud.hdinsight')
          square(title: 'ACHealthmonitoringBlock', style_modifiers: ssAzure + 'azure.health_monitoring')
          square(title: 'ACHealthyBlock', style_modifiers: ssAzure + 'azure.healthy')
          square(title: 'ACHybridConnectionBlock', style_modifiers: ssAzure + 'mscae.cloud.hybrid_connections')
          square(title: 'ACBizTalkhybridconnectionBlock', style_modifiers: ssAzure + 'mscae.cloud.hybrid_connection_manager')
          square(title: 'ACKeyVaultBlock', style_modifiers: ssAzure + 'mscae.cloud.key_vault')
          square(title: 'ACLogicAppBlock', style_modifiers: ssAzure + 'mscae.cloud.logic_app')
          square(title: 'ACMachineLearningBlock', style_modifiers: ssAzure + 'mscae.cloud.machine_learning')
          square(title: 'ACMediaServicesBlock', style_modifiers: ssAzure + 'azure.media_service')
          square(title: 'ACMicrosoftaccountBlock', style_modifiers: ssAzure + 'mscae.cloud.microsoft_account')
          square(title: 'ACMicrosoftAzureBlock', style_modifiers: ssAzure + 'mscae.cloud.microsoft_azure')
          square(title: 'ACMobileEngagementBlock', style_modifiers: ssAzure + 'mscae.cloud.mobile_engagement')
          square(title: 'ACMobileServicesBlock', style_modifiers: ssAzure + 'mscae.cloud.mobile_app')
          square(title: 'ACMultiFactorAuthBlock', style_modifiers: ssAzure + 'azure.multi_factor_authentication')
          square(title: 'ACMySQLdatabaseBlock', style_modifiers: ssAzure + 'azure.mysql_database')
          square(title: 'ACNotificationHubsBlock', style_modifiers: ssAzure + 'azure.notification_hub')
          square(title: 'ACNotificationtopicBlock', style_modifiers: ssAzure + 'azure.notification_topic')
          square(title: 'ACOperationalInsightsBlock', style_modifiers: ssAzure + 'mscae.cloud.operational_insights')
          square(title: 'ACOSimageBlock', style_modifiers: ssAzure + 'azure.operating_system_image')
          square(title: 'ACRemoteAppBlock', style_modifiers: ssAzure + 'mscae.cloud.remoteapp')
          square(title: 'ACrpdRemotingfileBlock', style_modifiers: ssAzure + 'azure.rdp_remoting_file')
          square(title: 'ACSchedulerBlock', style_modifiers: ssAzure + 'azure.scheduler')
          square(title: 'ACServiceBusBlock', style_modifiers: ssAzure + 'azure.service_bus')
          square(title: 'ACServiceBusQueueBlock', style_modifiers: ssAzure + 'azure.service_bus_queues')
          square(title: 'ACServiceBusRelayBlock', style_modifiers: ssAzure + 'azure.service_bus_relay')
          square(title: 'ACServiceBusTopicBlock', style_modifiers: ssAzure + 'azure.service_bus_topics_and_subscriptions')
          square(title: 'ACServiceEndpointBlock', style_modifiers: ssAzure + 'mscae.cloud.service_endpoint')
          square(title: 'ACServicepackageBlock', style_modifiers: ssAzure + 'mscae.cloud.service_package')
          square(title: 'ACSiteRecoveryBlock', style_modifiers: ssAzure + 'azure.hyper_v_recovery_manager')
          square(title: 'ACSQLdatabasegenericBlock', style_modifiers: ssAzure + 'azure.sql_database')
          square(title: 'ACSQLdatasyncBlock', style_modifiers: ssAzure + 'azure.sql_datasync')
          square(title: 'ACSQLreportingdeprecatedBlock', style_modifiers: ssAzure + 'azure.sql_reporting')
          square(title: 'ACStartuptaskBlock', style_modifiers: ssAzure + 'azure.startup_task')
          square(title: 'ACStorageAzureBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_storage')
          square(title: 'ACStorageblobBlock', style_modifiers: ssAzure + 'azure.storage_blob')
          square(title: 'ACStoragequeueBlock', style_modifiers: ssAzure + 'azure.storage_queue')
          square(title: 'ACStoragetableBlock', style_modifiers: ssAzure + 'azure.storage_table')
          square(title: 'ACStorSimpleBlock', style_modifiers: ssAzure + 'azure.storsimple')
          square(title: 'ACStreamAnalyticsBlock', style_modifiers: ssAzure + 'mscae.cloud.stream_analytics')
          square(title: 'ACTrafficManagerBlock', style_modifiers: ssAzure + 'azure.traffic_manager')
          square(title: 'ACAlienBlock', style_modifiers: ssAzure + 'azure.unidentified_code_object')
          square(title: 'ACVHDBlock', style_modifiers: ssAzure + 'azure.vhd')
          square(title: 'ACVHDdatadiskBlock', style_modifiers: ssAzure + 'azure.vhd_data_disk')
          square(title: 'ACVirtualmachineBlock', style_modifiers: ssAzure + 'azure.virtual_machine')
          square(title: 'ACVirtualmachinecontainerBlock', style_modifiers: ssAzure + 'mscae.cloud.virtual_machine_container')
          square(title: 'ACVirtualnetworkBlock', style_modifiers: ssAzure + 'azure.virtual_network')
          square(title: 'ACVisualStudioOnlineBlock', style_modifiers: ssAzure + 'azure.visual_studio_online')
          square(title: 'ACVMsymbolonlyBlock', style_modifiers: ssAzure + 'azure.virtual_machine_feature')
          square(title: 'ACWebJobsBlock', style_modifiers: ssAzure + 'mscae.cloud.webjobs')
          square(title: 'ACWebroleBlock', style_modifiers: ssAzure + 'azure.web_role')
          square(title: 'ACWebrolesBlock', style_modifiers: ssAzure + 'azure.web_roles')
          square(title: 'ACWorkaccountBlock', style_modifiers: ssAzure + 'mscae.cloud.work_account')
          square(title: 'ACWorkerroleBlock', style_modifiers: ssAzure + 'azure.worker_role')
          square(title: 'ACWorkerrolesBlock', style_modifiers: ssAzure + 'azure.worker_roles')
          square(title: 'ADNSBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_dns')
          square(title: 'ACLoadBalancerBlock', style_modifiers: ssAzure + 'mscae.cloud.azure_load_balancer_feature')
          square(title: 'ACResourceGroupBlock', style_modifiers: ssAzure + 'mscae.cloud.resource_group')
          square(title: 'ACVPNGatewayBlock', style_modifiers: ssAzure + 'mscae.cloud.vpn_gateway')
        end
        .page('Azure Enterprise', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AEActiveDirectoryFSPBlock', style_modifiers: ssAzure + 'mscae.enterprise.d')
          square(title: 'AEADFSBlock', style_modifiers: ssAzure + 'mscae.enterprise.ad_fs')
          square(title: 'AEAndroidPhoneBlock', style_modifiers: ssAzure + 'mscae.enterprise.android_phone')
          square(title: 'AEappblankfortextBlock', style_modifiers: ssAzure + 'mscae.enterprise.application_blank')
          square(title: 'AEAppGenericBlock', style_modifiers: ssAzure + 'mscae.enterprise.app_generic')
          square(title: 'AEAppserverBlock', style_modifiers: ssAzure + 'mscae.enterprise.application_server')
          square(title: 'AEBackuplocalBlock', style_modifiers: ssAzure + 'mscae.enterprise.backup_local')
          square(title: 'AEBackuponlineBlock', style_modifiers: ssAzure + 'mscae.enterprise.backup_online')
          square(title: 'AECalendarBlock', style_modifiers: ssAzure + 'mscae.general.calendar')
          square(title: 'AECertificateBlock', style_modifiers: ssAzure + 'azure.certificate')
          square(title: 'AEClientAppBlock', style_modifiers: ssAzure + 'mscae.enterprise.client_application')
          square(title: 'AECloudBlock', style_modifiers: ssAzure + 'mscae.enterprise.internet')
          square(title: 'AEClusterserverBlock', style_modifiers: ssAzure + 'mscae.enterprise.cluster_server')
          square(title: 'AECodefileBlock', style_modifiers: ssAzure + 'azure.code_file')
          square(title: 'AEConnectorsBlock', style_modifiers: ssAzure + 'mscae.enterprise.connectors')
          square(title: 'AEDatabasegenericBlock', style_modifiers: ssAzure + 'mscae.enterprise.database_generic')
          square(title: 'AEDatabaseserverBlock', style_modifiers: ssAzure + 'mscae.enterprise.database_server')
          square(title: 'AEDatabasesyncBlock', style_modifiers: ssAzure + 'mscae.enterprise.database_synchronization')
          square(title: 'AEDeviceBlock', style_modifiers: ssAzure + 'mscae.enterprise.device')
          square(title: 'AEDirectaccessBlock', style_modifiers: ssAzure + 'mscae.enterprise.direct_access_feature')
          square(title: 'AEDocumentBlock', style_modifiers: ssAzure + 'mscae.enterprise.document')
          square(title: 'AEDomaincontrollerBlock', style_modifiers: ssAzure + 'mscae.enterprise.domain_controller')
          square(title: 'AEEnterpriseBuildingBlock', style_modifiers: ssAzure + 'azure.enterprise')
          square(title: 'AEFilegeneralBlock', style_modifiers: ssAzure + 'azure.file')
          square(title: 'AEFilterBlock', style_modifiers: ssAzure + 'mscae.enterprise.filter')
          square(title: 'AEFirewallBlock', style_modifiers: ssAzure + 'mscae.enterprise.firewall')
          square(title: 'AEFolderBlock', style_modifiers: ssAzure + 'mscae.enterprise.folder')
          square(title: 'AEGatewayBlock', style_modifiers: ssAzure + 'mscae.enterprise.gateway')
          square(title: 'AEGenericcodeBlock', style_modifiers: ssAzure + 'azure.code_file')
          square(title: 'AEGraphBlock', style_modifiers: ssAzure + 'mscae.general.graph')
          square(title: 'AEHealthmonitoringBlock', style_modifiers: ssAzure + 'azure.health_monitoring')
          square(title: 'AEHealthyBlock', style_modifiers: ssAzure + 'azure.healthy')
          square(title: 'AEImportgenericBlock', style_modifiers: ssAzure + 'mscae.enterprise.import_generic')
          square(title: 'AEInternetBlock', style_modifiers: ssAzure + 'mscae.enterprise.internet')
          square(title: 'AEKeyboardBlock', style_modifiers: ssAzure + 'mscae.enterprise.keyboard')
          square(title: 'AEKeypermissionsBlock', style_modifiers: ssAzure + 'mscae.enterprise.key_permissions')
          square(title: 'AELaptopcomputerBlock', style_modifiers: ssAzure + 'azure.laptop')
          square(title: 'AELoadbalancerBlock', style_modifiers: ssAzure + 'azure.load_balancer_generic')
          square(title: 'AELoadTestingBlock', style_modifiers: ssAzure + 'mscae.enterprise.load_testing')
          square(title: 'AELockprotectedBlock', style_modifiers: ssAzure + 'mscae.enterprise.lock')
          square(title: 'AELockunprotectedBlock', style_modifiers: ssAzure + 'mscae.enterprise.lock_unlocked')
          square(title: 'AEMaintenanceBlock', style_modifiers: ssAzure + 'mscae.enterprise.maintenance')
          square(title: 'AEManagementconsoleBlock', style_modifiers: ssAzure + 'mscae.enterprise.management_console')
          square(title: 'AEMessageBlock', style_modifiers: ssAzure + 'azure.message')
          square(title: 'AEMonitorBlock', style_modifiers: ssAzure + 'azure.computer')
          square(title: 'AEMonitorrunningappsBlock', style_modifiers: ssAzure + 'mscae.enterprise.monitor_running_apps')
          square(title: 'AEMouseBlock', style_modifiers: ssAzure + 'mscae.enterprise.mouse')
          square(title: 'AENetworkcardBlock', style_modifiers: ssAzure + 'mscae.enterprise.network_card')
          square(title: 'AENotallowedBlock', style_modifiers: ssAzure + 'mscae.general.not_allowed')
          square(title: 'AEPerformanceBlock', style_modifiers: ssAzure + 'mscae.enterprise.performance')
          square(title: 'AEPerformancemonitorBlock', style_modifiers: ssAzure + 'mscae.enterprise.performance_monitor')
          square(title: 'AEPhoneBlock', style_modifiers: ssAzure + 'azure.mobile')
          square(title: 'AEPlugandplayBlock', style_modifiers: ssAzure + 'mscae.enterprise.plug_and_play')
          square(title: 'AEPowershellscriptfileBlock', style_modifiers: ssAzure + 'azure.powershell_file')
          square(title: 'AEProtocolstackBlock', style_modifiers: ssAzure + 'mscae.enterprise.protocol_stack')
          square(title: 'AEQueuegeneralBlock', style_modifiers: ssAzure + 'azure.queue_generic')
          square(title: 'AERMSconnectorBlock', style_modifiers: ssAzure + 'mscae.enterprise.rms_connector')
          square(title: 'AERouterBlock', style_modifiers: ssAzure + 'mscae.enterprise.router')
          square(title: 'AEScriptfileBlock', style_modifiers: ssAzure + 'azure.script_file')
          square(title: 'AESecurevirtualmachineBlock', style_modifiers: ssAzure + 'mscae.enterprise.secure_virtual_machine')
          square(title: 'AEServerbladeBlock', style_modifiers: ssAzure + 'azure.server')
          square(title: 'AEServerdirectoryBlock', style_modifiers: ssAzure + 'mscae.enterprise.server_directory')
          square(title: 'AEServerfarmBlock', style_modifiers: ssAzure + 'mscae.enterprise.server_farm')
          square(title: 'AEServergenericBlock', style_modifiers: ssAzure + 'mscae.enterprise.server_generic')
          square(title: 'AEServerrackBlock', style_modifiers: ssAzure + 'azure.server_rack')
          square(title: 'AESettingsBlock', style_modifiers: ssAzure + 'mscae.enterprise.settings')
          square(title: 'AESharedfolderBlock', style_modifiers: ssAzure + 'mscae.enterprise.shared_folder')
          square(title: 'AESmartcardBlock', style_modifiers: ssAzure + 'mscae.enterprise.smartcard')
          square(title: 'AEStorageBlock', style_modifiers: ssAzure + 'mscae.enterprise.storage')
          square(title: 'AETableBlock', style_modifiers: ssAzure + 'mscae.enterprise.table')
          square(title: 'AETabletBlock', style_modifiers: ssAzure + 'azure.tablet')
          square(title: 'AEToolBlock', style_modifiers: ssAzure + 'mscae.enterprise.tool')
          square(title: 'AETunnelBlock', style_modifiers: ssAzure + 'mscae.general.tunnel')
          square(title: 'AEUnhealthyBlock', style_modifiers: ssAzure + 'mscae.enterprise.unhealthy')
          square(title: 'AEUSBBlock', style_modifiers: ssAzure + 'mscae.enterprise.usb')
          square(title: 'AEUserBlock', style_modifiers: ssAzure + 'azure.user')
          square(title: 'AEVideoBlock', style_modifiers: ssAzure + 'mscae.general.video')
          square(title: 'AEVirtualmachineBlock', style_modifiers: ssAzure + 'azure.virtual_machine_feature')
          square(title: 'AEWebBlock', style_modifiers: ssAzure + 'mscae.enterprise.web')
          square(title: 'AEWebserverBlock', style_modifiers: ssAzure + 'mscae.enterprise.web_server')
          square(title: 'AEWindowsserverBlock', style_modifiers: ssAzure + 'mscae.enterprise.windows_server')
          square(title: 'AEWirelessconnectionBlock', style_modifiers: ssAzure + 'mscae.enterprise.wireless_connection')
          square(title: 'AEWorkstationclientBlock', style_modifiers: ssAzure + 'mscae.enterprise.workstation_client')
          square(title: 'AEXMLwebserviceBlock', style_modifiers: ssAzure + 'mscae.enterprise.xml_web_service')
          square(title: 'AGSAudioBlock', style_modifiers: ssAzure + 'mscae.general.audio')
          square(title: 'AGSBugBlock', style_modifiers: ssAzure + 'mscae.general.bug')
          square(title: 'AGSCablesettopTVboxBlock', style_modifiers: ssAzure + 'mscae.general.cable_settop_tv_box')
          square(title: 'AGSCalendarBlock', style_modifiers: ssAzure + 'mscae.general.calendar')
          square(title: 'AGSChartBlock', style_modifiers: ssAzure + 'mscae.general.chart')
          square(title: 'AGSCheckmarkSuccessBlock', style_modifiers: ssAzure + 'mscae.general.checkmark')
          square(title: 'AGSContinousCycleCircleBlock', style_modifiers: ssAzure + 'mscae.general.continuous_cycle')
          square(title: 'AGSCrossoutFailureBlock', style_modifiers: ssAzure + 'mscae.general.crossout')
          square(title: 'AGSCutandpasteBlock', style_modifiers: ssAzure + 'mscae.general.cut_and_paste')
          square(title: 'AGSFolderBlock', style_modifiers: ssAzure + 'mscae.enterprise.folder')
          square(title: 'AGSGamecontrollerBlock', style_modifiers: ssAzure + 'mscae.general.game_controller')
          square(title: 'AGSGearsBlock', style_modifiers: ssAzure + 'mscae.general.gears')
          square(title: 'AGSGraphBlock', style_modifiers: ssAzure + 'mscae.general.graph')
          square(title: 'AGSLikeBlock', style_modifiers: ssAzure + 'mscae.general.like')
          square(title: 'AGSNotallowedBlock', style_modifiers: ssAzure + 'mscae.general.not_allowed')
          square(title: 'AGSSliderbarhorizontalBlock', style_modifiers: ssAzure + 'mscae.general.slider_bar_horizontal')
          square(title: 'AGSSliderbarvertBlock', style_modifiers: ssAzure + 'mscae.general.slider_bar_vertical')
          square(title: 'AGSTasklistorBacklogBlock', style_modifiers: ssAzure + 'mscae.general.task_list')
          square(title: 'AGSTasksBlock', style_modifiers: ssAzure + 'mscae.general.tasks')
          square(title: 'AGSTunnelBlock', style_modifiers: ssAzure + 'mscae.general.tunnel')
          square(title: 'AGSUserBlock', style_modifiers: ssAzure + 'azure.user')
          square(title: 'AGSVideoBlock', style_modifiers: ssAzure + 'mscae.general.video')

          square(title: 'AVMActiveDirectoryVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.active_directory;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMActiveDirectoryVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.active_directory_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMAppServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.application_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMAppServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.application_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMDatabaseServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.database_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMDatabaseServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.database_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMDirectoryServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.directory_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMDirectoryServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.directory_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMDomainServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.domain_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMDomainServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.domain_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMFileServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.file_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMFileServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.file_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMWebServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.web_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMWebServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.web_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMWindowsServerVMBlock', style_modifiers: 'shape=mxgraph.mscae.vm.windows_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')
          square(title: 'AVMWindowsServerVMmultiBlock', style_modifiers: 'shape=mxgraph.mscae.vm.windows_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none')

        end
        .page('Azure 2019', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'AccessReviewAzure2019', style_modifiers: azur19 + 'Access_Review.svg')
          square(title: 'ActiveDirectoryConnectHealthAzure2019', style_modifiers: azur19 + 'Active_Directory_Health_Monitoring.svg')
          square(title: 'ActiveDirectoryAzure2019', style_modifiers: azur19 + 'Active_Directory.svg')
          square(title: 'ActiveDirectoryAzure2019_', style_modifiers: azur19 + 'ActiveDirectory.svg')
          square(title: 'ActiveDirectoryDomainAzure2019', style_modifiers: azur19 + 'ActiveDirectoryDomain.svg')
          square(title: 'AddressSpaceAzure2019', style_modifiers: azur19 + 'Address_Space.svg')
          square(title: 'AddTeamMemberAzure2019', style_modifiers: azur19 + 'AddTeamMember.svg')
          square(title: 'ADFSAzure2019', style_modifiers: azur19 + 'ADFS.svg')
          square(title: 'AdvisorAzure2019', style_modifiers: azur19 + 'Advisor.svg')
          square(title: 'AlienAzure2019', style_modifiers: azur19 + 'Alien.svg')
          square(title: 'AlienSadAzure2019', style_modifiers: azur19 + 'AlienSad.svg')
          square(title: 'AnalysisServicesAzure2019', style_modifiers: azur19 + 'Analysis_Services.svg')
          square(title: 'APIManagementServicesAzure2019', style_modifiers: azur19 + 'API_Management.svg')
          square(title: 'APIAzure2019', style_modifiers: azur19 + 'API.svg')
          square(title: 'APIDefinitionAzure2019', style_modifiers: azur19 + 'APIDefinition.svg')
          square(title: 'AppConfigurationAzure2019', style_modifiers: azur19 + 'App_Configuration.svg')
          square(title: 'AppRegistrationsAzure2019', style_modifiers: azur19 + 'App_Registrations.svg')
          square(title: 'AppServiceAPIAppsAzure2019', style_modifiers: azur19 + 'App_Service_API_Apps.svg')
          square(title: 'AppServiceFrontendAzure2019', style_modifiers: azur19 + 'App_Service_Frontend.svg')
          square(title: 'PublicIPAddressesAzure2019', style_modifiers: azur19 + 'App_Service_IPAddress.svg')
          square(title: 'AzureAppServiceMobileAzure2019', style_modifiers: azur19 + 'App_Service_Mobile_App.svg')
          square(title: 'AppServiceWorkerPoolsAzure2019', style_modifiers: azur19 + 'App_Service_Worker_Pools.svg')
          square(title: 'AppServiceAzure2019', style_modifiers: azur19 + 'App_Service.svg')
          square(title: 'AppServicesAzure2019', style_modifiers: azur19 + 'App_Services.svg')
          square(title: 'AppServiceEnvironmentsAzure2019', style_modifiers: azur19 + 'App_Services.svg')
          square(title: 'ApplicationGatewayAzure2019', style_modifiers: azur19 + 'Application_Gateway.svg')
          square(title: 'ApplicationInsightsAzure2019', style_modifiers: azur19 + 'Application_Insights.svg')
          square(title: 'ApplicationSecurityGroupsAzure2019', style_modifiers: azur19 + 'Application_Security_Groups.svg')
          square(title: 'AppServiceConnectivityAzure2019', style_modifiers: azur19 + 'AppServiceConnectivity.svg')
          square(title: 'AppServiceEnvironmentAzure2019', style_modifiers: azur19 + 'AppServiceEnvironment.svg')
          square(title: 'ArchiveStorageAzure2019', style_modifiers: azur19 + 'Archive_Storage.svg')
          square(title: 'ARMExplorerAzure2019', style_modifiers: azur19 + 'ARMExplorer.svg')
          square(title: 'AuditingAzure2019', style_modifiers: azur19 + 'Auditing.svg')
          square(title: 'AuditingServerAzure2019', style_modifiers: azur19 + 'AuditingServer.svg')
          square(title: 'AutoBackupAzure2019', style_modifiers: azur19 + 'AutoBackup.svg')
          square(title: 'AutomationAccountsAzure2019', style_modifiers: azur19 + 'Automation.svg')
          square(title: 'AvatarAzure2019', style_modifiers: azur19 + 'Avatar.svg')
          square(title: 'AvatarDefaultAzure2019', style_modifiers: azur19 + 'AvatarDefault.svg')
          square(title: 'AvatarUnknownAzure2019', style_modifiers: azur19 + 'AvatarUnknown.svg')
          square(title: 'Azure API for FHIRAzure2019', style_modifiers: azur19 + 'Azure API for FHIR.svg')
          square(title: 'AzureADB2CAzure2019', style_modifiers: azur19 + 'Azure_AD_B2C.svg')
          square(title: 'AzureADDomainServicesAzure2019', style_modifiers: azur19 + 'Azure_AD_Domain_Services.svg')
          square(title: 'AzureADIdentityProtectionAzure2019', style_modifiers: azur19 + 'Azure_AD_Identity_Protection.svg')
          square(title: 'AzureADPrivilegedIdentityManagementAzure2019', style_modifiers: azur19 + 'Azure_AD_Privileged_Identity_Management.svg')
          square(title: 'AzureAPIforFHIRAzure2019', style_modifiers: azur19 + 'Azure_API_for_FHIR.svg')
          square(title: 'AzureArtifactsAzure2019', style_modifiers: azur19 + 'Azure_Artifacts.svg')
          square(title: 'AzureBoardsAzure2019', style_modifiers: azur19 + 'Azure_Boards.svg')
          square(title: 'AzureCacheforRedisAzure2019', style_modifiers: azur19 + 'Azure_Cache_for_Redis.svg')
          square(title: 'AzureDataExplorerClustersAzure2019', style_modifiers: azur19 + 'Azure_Data_Explorer_Clusters.svg')
          square(title: 'AzureDatabaseforMariaDBServersAzure2019', style_modifiers: azur19 + 'Azure_Database_for_MariaDB_servers.svg')
          square(title: 'AzureDatabaseforMySQLServersAzure2019', style_modifiers: azur19 + 'Azure_Database_for_MySQL_servers.svg')
          square(title: 'AzureDatabaseforPostgreSQLServersAzure2019', style_modifiers: azur19 + 'Azure_Database_for_PostgreSQL_servers.svg')
          square(title: 'AzureDatabaseMigrationServicesAzure2019', style_modifiers: azur19 + 'Azure_Database_Migration_Services.svg')
          square(title: 'AzureDevOpsAzure2019', style_modifiers: azur19 + 'Azure_DevOps.svg')
          square(title: 'AzureDigitalTwinsAzure2019', style_modifiers: azur19 + 'Azure_Digital_Twins.svg')
          square(title: 'AzureFirewallAzure2019', style_modifiers: azur19 + 'Azure_Firewall.svg')
          square(title: 'AzureHomeAzure2019', style_modifiers: azur19 + 'Azure_Home.svg')
          square(title: 'AzureIoTHubSecurityAzure2019', style_modifiers: azur19 + 'Azure_IoT_Hub_Security.svg')
          square(title: 'AzureIoTHubAzure2019', style_modifiers: azur19 + 'Azure_IoT_Hub.svg')
          square(title: 'AzureMapsAzure2019', style_modifiers: azur19 + 'Azure_Maps.svg')
          square(title: 'AzureMediaPlayerAzure2019', style_modifiers: azur19 + 'Azure_Media_Player.svg')
          square(title: 'AzureNetAppfilesAzure2019', style_modifiers: azur19 + 'Azure_NetApp_files.svg')
          square(title: 'AzurePipelinesAzure2019', style_modifiers: azur19 + 'Azure_Pipelines.svg')
          square(title: 'AzureReposAzure2019', style_modifiers: azur19 + 'Azure_Repos.svg')
          square(title: 'AzureSentinelAzure2019', style_modifiers: azur19 + 'Azure_Sentinel.svg')
          square(title: 'AzureSphereAzure2019', style_modifiers: azur19 + 'Azure_Sphere.svg')
          square(title: 'AzureTestPlansAzure2019', style_modifiers: azur19 + 'Azure_Test_Plans.svg')
          square(title: 'AzureFXTEdgeFilerAzure2019', style_modifiers: azur19 + 'AzureFXTEdgeFiler.svg')
          square(title: 'BacklogAzure2019', style_modifiers: azur19 + 'Backlog.svg')
          square(title: 'RecoveryServicesVaultsAzure2019', style_modifiers: azur19 + 'Backup.svg')
          square(title: 'BatchAccountsAzure2019', style_modifiers: azur19 + 'Batch_Accounts.svg')
          square(title: 'BatchAIAzure2019', style_modifiers: azur19 + 'Batch_AI.svg')
          square(title: 'BatchTaskAzure2019', style_modifiers: azur19 + 'Batch_Task.svg')
          square(title: 'BatchTaskVMAzure2019', style_modifiers: azur19 + 'Batch_TaskVM.svg')
          square(title: 'BatchAzure2019', style_modifiers: azur19 + 'Batch.svg')
          square(title: 'BillingHubAzure2019', style_modifiers: azur19 + 'BillingHub.svg')
          square(title: 'BizTalkServicesHybridConnectionsAzure2019', style_modifiers: azur19 + 'BizTalk_Services_Hybrid_Connections.svg')
          square(title: 'BizTalkServicesAzure2019', style_modifiers: azur19 + 'BizTalk_Services.svg')
          square(title: 'BlobStorageAzure2019', style_modifiers: azur19 + 'BlobBlock.svg')
          square(title: 'BlobPageAzure2019', style_modifiers: azur19 + 'BlobPage.svg')
          square(title: 'BlockchainAzure2019', style_modifiers: azur19 + 'Blockchain.svg')
          square(title: 'BlogStorageAzure2019', style_modifiers: azur19 + 'Blog_Storage.svg')
          square(title: 'BlueprintsAzure2019', style_modifiers: azur19 + 'Blueprints.svg')
          square(title: 'BookAzure2019', style_modifiers: azur19 + 'Book.svg')
          square(title: 'BotServicesAzure2019', style_modifiers: azur19 + 'Bot_Services.svg')
          square(title: 'BranchAzure2019', style_modifiers: azur19 + 'Branch.svg')
          square(title: 'BrowserAzure2019', style_modifiers: azur19 + 'Browser.svg')
          square(title: 'BugAzure2019', style_modifiers: azur19 + 'Bug.svg')
          square(title: 'BuildingBlocksAzure2019', style_modifiers: azur19 + 'Building_Blocks.svg')
          square(title: 'BuildsAzure2019', style_modifiers: azur19 + 'Builds.svg')
          square(title: 'AzureCacheplusRedisAzure2019', style_modifiers: azur19 + 'Cache_including_Redis.svg')
          square(title: 'AzureCacheRedisAzure2019', style_modifiers: azur19 + 'Cache_Redis_Product.svg')
          square(title: 'CalendarAzure2019', style_modifiers: azur19 + 'Calendar.svg')
          square(title: 'CDNrocketAzure2019', style_modifiers: azur19 + 'CDNrocket.svg')
          square(title: 'CertificateAzure2019', style_modifiers: azur19 + 'Certificate.svg')
          square(title: 'AppServiceCertificatesAzure2019', style_modifiers: azur19 + 'Certificate.svg')
          square(title: 'MetricsAzure2019', style_modifiers: azur19 + 'Chart.svg')
          square(title: 'CheckAzure2019', style_modifiers: azur19 + 'Check.svg')
          square(title: 'CitrixVirtualDesktopsEssentialsAzure2019', style_modifiers: azur19 + 'Citrix_Virtual_Desktops_Essentials.svg')
          square(title: 'ReservedIPAddressesClassicAzure2019', style_modifiers: azur19 + 'ClassicIPAddress.svg')
          square(title: 'ClassicStorageAzure2019', style_modifiers: azur19 + 'ClassicStorage.svg')
          square(title: 'ClientAppsAzure2019', style_modifiers: azur19 + 'Client_Apps.svg')
          square(title: 'RecentAzure2019', style_modifiers: azur19 + 'Clock.svg')
          square(title: 'CycleCloudAzure2019', style_modifiers: azur19 + 'Cloud_Cycle.svg')
          square(title: 'CloudServicesAzure2019', style_modifiers: azur19 + 'Cloud_Service.svg')
          square(title: 'CloudServicesClassicAzure2019', style_modifiers: azur19 + 'Cloud_Services_Classic.svg')
          square(title: 'CloudSimpleNodesAzure2019', style_modifiers: azur19 + 'CloudSimple_Nodes.svg')
          square(title: 'CloudSimpleServicesAzure2019', style_modifiers: azur19 + 'CloudSimple_Services.svg')
          square(title: 'CloudSimpleVirtualMachinesAzure2019', style_modifiers: azur19 + 'CloudSimple_Virtual_Machines.svg')
          square(title: 'CodeAzure2019', style_modifiers: azur19 + 'Code.svg')
          square(title: 'CognitiveServicesComputerVisionAzure2019', style_modifiers: azur19 + 'Cognitive_Services_Computer_Vision.svg')
          square(title: 'CognitiveServicesemotionAzure2019', style_modifiers: azur19 + 'Cognitive_Services_emotion.svg')
          square(title: 'CognitiveServicesfaceAzure2019', style_modifiers: azur19 + 'Cognitive_Services_face.svg')
          square(title: 'CognitiveServicesluisAzure2019', style_modifiers: azur19 + 'Cognitive_Services_luis.svg')
          square(title: 'CognitiveServicesrecommendationsAzure2019', style_modifiers: azur19 + 'Cognitive_Services_recommendations.svg')
          square(title: 'CognitiveServicesSpeechAzure2019', style_modifiers: azur19 + 'Cognitive_Services_Speech.svg')
          square(title: 'CognitiveServicestextanalyticsAzure2019', style_modifiers: azur19 + 'Cognitive_Services_textanalytics.svg')
          square(title: 'CognitiveServicesweblanguagemodelAzure2019', style_modifiers: azur19 + 'Cognitive_Services_web_language_model.svg')
          square(title: 'CognitiveServicesAzure2019', style_modifiers: azur19 + 'Cognitive_Services.svg')
          square(title: 'CommitsAzure2019', style_modifiers: azur19 + 'Commits.svg')
          square(title: 'ConnectionAzure2019', style_modifiers: azur19 + 'Connection.svg')
          square(title: 'ConnectionsAzure2019', style_modifiers: azur19 + 'Connections.svg')
          square(title: 'ContactInfoAzure2019', style_modifiers: azur19 + 'ContactInfo.svg')
          square(title: 'ContainerInstancesAzure2019', style_modifiers: azur19 + 'Container_Instances.svg')
          square(title: 'ContainerRegistriesAzure2019', style_modifiers: azur19 + 'Container_Registries.svg')
          square(title: 'ContainerServiceAzure2019', style_modifiers: azur19 + 'Container_Service.svg')
          square(title: 'CDNProfilesAzure2019', style_modifiers: azur19 + 'Content_Delivery_Network.svg')
          square(title: 'ContentProtectionAzure2019', style_modifiers: azur19 + 'Content_Protection.svg')
          square(title: 'ContentManagementSystemAzure2019', style_modifiers: azur19 + 'ContentManagementSystem.svg')
          square(title: 'ContinuousExportAzure2019', style_modifiers: azur19 + 'ContinuousExport.svg')
          square(title: 'ControllersAzure2019', style_modifiers: azur19 + 'Controllers.svg')
          square(title: 'ControlsAzure2019', style_modifiers: azur19 + 'Controls.svg')
          square(title: 'ControlsHorizontalAzure2019', style_modifiers: azur19 + 'ControlsHorizontal.svg')
          square(title: 'AzureCosmosDBAzure2019', style_modifiers: azur19 + 'CosmosDB.svg')
          square(title: 'CounterAzure2019', style_modifiers: azur19 + 'Counter.svg')
          square(title: 'CubesAzure2019', style_modifiers: azur19 + 'Cubes.svg')
          square(title: 'CustomDomainAzure2019', style_modifiers: azur19 + 'CustomDomain.svg')
          square(title: 'AppServiceDomainsAzure2019', style_modifiers: azur19 + 'CustomDomain.svg')
          square(title: 'CustomerLockboxAzure2019', style_modifiers: azur19 + 'Customer_Lockbox.svg')
          square(title: 'CustomerInsightsAzure2019', style_modifiers: azur19 + 'CustomerInsights.svg')
          square(title: 'DataBoxEdgeDataBoxGatewayAzure2019', style_modifiers: azur19 + 'Data_Box_Edge_Data_Box_Gateway.svg')
          square(title: 'DataBoxAzure2019', style_modifiers: azur19 + 'Data_Box.svg')
          square(title: 'ImportExportJobsAzure2019', style_modifiers: azur19 + 'Data_Box.svg')
          square(title: 'AzureDataCatalogAzure2019', style_modifiers: azur19 + 'Data_Catalog.svg')
          square(title: 'DataFactoriesAzure2019', style_modifiers: azur19 + 'Data_Factory.svg')
          square(title: 'DataLakeAnalyticsAzure2019', style_modifiers: azur19 + 'Data_Lake_Analytics.svg')
          square(title: 'DataLakeStorageAzure2019', style_modifiers: azur19 + 'Data_Lake_Storage.svg')
          square(title: 'DataLakeStoreGen1Azure2019', style_modifiers: azur19 + 'Data_Lake_Store.svg')
          square(title: 'DataLakeAzure2019', style_modifiers: azur19 + 'Data_Lake.svg')
          square(title: 'DataWarehouseAzure2019', style_modifiers: azur19 + 'Data_Warehouse.svg')
          square(title: 'AzureDatabaseGenericAzure2019', style_modifiers: azur19 + 'Database_General.svg')
          square(title: 'DatabaseRestoreAzure2019', style_modifiers: azur19 + 'DatabaseRestore.svg')
          square(title: 'AzureDatabricksAzure2019', style_modifiers: azur19 + 'Databricks.svg')
          square(title: 'dataExportAzure2019', style_modifiers: azur19 + 'dataExport.svg')
          square(title: 'dataRetentionAzure2019', style_modifiers: azur19 + 'dataRetention.svg')
          square(title: 'DataServicescategoryrollupAzure2019', style_modifiers: azur19 + 'DataServices_category_rollup.svg')
          square(title: 'DCOSAzure2019', style_modifiers: azur19 + 'DC_OS.svg')
          square(title: 'DDOSProtectionPlansAzure2019', style_modifiers: azur19 + 'DDOS_Protection_Plans.svg')
          square(title: 'DedicatedEventHubAzure2019', style_modifiers: azur19 + 'Dedicated_Event_Hub.svg')
          square(title: 'DevConsoleAzure2019', style_modifiers: azur19 + 'DevConsole.svg')
          square(title: 'DeveloperToolsAzure2019', style_modifiers: azur19 + 'Developer_Tools.svg')
          square(title: 'DeviceComplianceAzure2019', style_modifiers: azur19 + 'Device_Compliance.svg')
          square(title: 'DeviceConfigAzure2019', style_modifiers: azur19 + 'Device_Config.svg')
          square(title: 'DeviceProvisioningServicesAzure2019', style_modifiers: azur19 + 'Device_Provisioning_Services.svg')
          square(title: 'DevicesGroupsAzure2019', style_modifiers: azur19 + 'Devices_Groups.svg')
          square(title: 'AzureDevTestLabsAzure2019', style_modifiers: azur19 + 'DevTest_Labs.svg')
          square(title: 'DirectorySyncAzure2019', style_modifiers: azur19 + 'DirectorySync.svg')
          square(title: 'DiscardAzure2019', style_modifiers: azur19 + 'Discard.svg')
          square(title: 'DisksAzure2019', style_modifiers: azur19 + 'Discs.svg')
          square(title: 'DNSPrivateZonesAzure2019', style_modifiers: azur19 + 'DNS_Private_Zones.svg')
          square(title: 'DNSZonesAzure2019', style_modifiers: azur19 + 'DNS.svg')
          square(title: 'DockerAzure2019', style_modifiers: azur19 + 'Docker.svg')
          square(title: 'DocumentDBAzure2019', style_modifiers: azur19 + 'DocumentDB.svg')
          square(title: 'DownloadAzure2019', style_modifiers: azur19 + 'Download.svg')
          square(title: 'EBooksAzure2019', style_modifiers: azur19 + 'eBooks.svg')
          square(title: 'EducationAzure2019', style_modifiers: azur19 + 'Education.svg')
          square(title: 'ElasticDatabasePoolsAzure2019', style_modifiers: azur19 + 'Elastic_Database_Pools.svg')
          square(title: 'ElasticJobAgentsAzure2019', style_modifiers: azur19 + 'Elastic_Job_Agents.svg')
          square(title: 'EnrollmentAzure2019', style_modifiers: azur19 + 'Enrollment.svg')
          square(title: 'EnterpriseApplicationsAzure2019', style_modifiers: azur19 + 'Enterprise_Applications.svg')
          square(title: 'EventGridTopicsAzure2019', style_modifiers: azur19 + 'Event_Grid_Topics.svg')
          square(title: 'EventGridDomainsAzure2019', style_modifiers: azur19 + 'Event_Grid.svg')
          square(title: 'EventGridSubscriptionsAzure2019', style_modifiers: azur19 + 'Event_Grid.svg')
          square(title: 'EventHubClustersAzure2019', style_modifiers: azur19 + 'Event_Hub_Clusters.svg')
          square(title: 'EventHubsAzure2019', style_modifiers: azur19 + 'Event_Hubs.svg')
          square(title: 'EventLogAzure2019', style_modifiers: azur19 + 'EventLog.svg')
          square(title: 'ExchangeOnPremisesAccessAzure2019', style_modifiers: azur19 + 'Exchange_On_premises_Access.svg')
          square(title: 'ExpressRouteCircuitsAzure2019', style_modifiers: azur19 + 'Express_Route.svg')
          square(title: 'ExtensionsAzure2019', style_modifiers: azur19 + 'Extensions.svg')
          square(title: 'FavoriteAzure2019', style_modifiers: azur19 + 'Favorite.svg')
          square(title: 'FileAzure2019', style_modifiers: azur19 + 'File.svg')
          square(title: 'FilesAzure2019', style_modifiers: azur19 + 'Files.svg')
          square(title: 'FolderAzure2019', style_modifiers: azur19 + 'Folder.svg')
          square(title: 'FolderBlankAzure2019', style_modifiers: azur19 + 'FolderBlank.svg')
          square(title: 'FolderCubeAzure2019', style_modifiers: azur19 + 'FolderCube.svg')
          square(title: 'FolderWebsiteAzure2019', style_modifiers: azur19 + 'FolderWebsite.svg')
          square(title: 'ForPlacementOnlyAzure2019', style_modifiers: azur19 + 'ForPlacementOnly.svg')
          square(title: 'FreeServicesAzure2019', style_modifiers: azur19 + 'Free_Services.svg')
          square(title: 'FrontDoorsAzure2019', style_modifiers: azur19 + 'Front_Doors.svg')
          square(title: 'FtpAzure2019', style_modifiers: azur19 + 'Ftp.svg')
          square(title: 'FunctionAppsAzure2019', style_modifiers: azur19 + 'Functions.svg')
          square(title: 'GalleryManagementAzure2019', style_modifiers: azur19 + 'GalleryManagement.svg')
          square(title: 'GatewayAzure2019', style_modifiers: azur19 + 'Gateway.svg')
          square(title: 'Gear2Azure2019', style_modifiers: azur19 + 'Gear_2.svg')
          square(title: 'GearAzure2019', style_modifiers: azur19 + 'Gear.svg')
          square(title: 'GearAlternate2Azure2019', style_modifiers: azur19 + 'GearAlternate_2.svg')
          square(title: 'GearAlternateAzure2019', style_modifiers: azur19 + 'GearAlternate.svg')
          square(title: 'GeneralStorageAzure2019', style_modifiers: azur19 + 'General_Storage.svg')
          square(title: 'GenomicsAccountsAzure2019', style_modifiers: azur19 + 'Genomics_Accounts.svg')
          square(title: 'GeoReplicationPremiumAzure2019', style_modifiers: azur19 + 'GeoReplicationPremium.svg')
          square(title: 'GeoReplicationStandardAzure2019', style_modifiers: azur19 + 'GeoReplicationStandard.svg')
          square(title: 'GetMoreLicenseAzure2019', style_modifiers: azur19 + 'GetMoreLicense.svg')
          square(title: 'GetStartedAzure2019', style_modifiers: azur19 + 'GetStarted.svg')
          square(title: 'GiftAzure2019', style_modifiers: azur19 + 'Gift.svg')
          square(title: 'GlobeAzure2019', style_modifiers: azur19 + 'Globe.svg')
          square(title: 'GlobeErrorAzure2019', style_modifiers: azur19 + 'GlobeError.svg')
          square(title: 'GlobeSuccessAzure2019', style_modifiers: azur19 + 'GlobeSuccess.svg')
          square(title: 'GlobeWarningAzure2019', style_modifiers: azur19 + 'GlobeWarning.svg')
          square(title: 'GoAzure2019', style_modifiers: azur19 + 'Go.svg')
          square(title: 'GreatScottAzure2019', style_modifiers: azur19 + 'GreatScott.svg')
          square(title: 'GridAzure2019', style_modifiers: azur19 + 'Grid.svg')
          square(title: 'AllResourcesAzure2019', style_modifiers: azur19 + 'Grid3x3.svg')
          square(title: 'GuestAssignmentsAzure2019', style_modifiers: azur19 + 'Guest_Assignments.svg')
          square(title: 'Guide2Azure2019', style_modifiers: azur19 + 'Guide_2.svg')
          square(title: 'GuideAzure2019', style_modifiers: azur19 + 'Guide.svg')
          square(title: 'HammerAzure2019', style_modifiers: azur19 + 'Hammer.svg')
          square(title: 'HDInsightAzure2019', style_modifiers: azur19 + 'HDInsight.svg')
          square(title: 'HDInsightClustersAzure2019', style_modifiers: azur19 + 'HDInsightClusters.svg')
          square(title: 'HealthErrorBadgeAzure2019', style_modifiers: azur19 + 'HealthErrorBadge.svg')
          square(title: 'HealthWarningBadgeAzure2019', style_modifiers: azur19 + 'HealthWarningBadge.svg')
          square(title: 'HeartAzure2019', style_modifiers: azur19 + 'Heart.svg')
          square(title: 'HeartPulseAzure2019', style_modifiers: azur19 + 'HeartPulse.svg')
          square(title: 'HomeAzure2019', style_modifiers: azur19 + 'Home.svg')
          square(title: 'HybridConnectionEndpointAzure2019', style_modifiers: azur19 + 'HybridConnectionEndpoint.svg')
          square(title: 'IdentityGovernanceAzure2019', style_modifiers: azur19 + 'Identity_Governance.svg')
          square(title: 'ImageDefinitionsAzure2019', style_modifiers: azur19 + 'Image_Definitions.svg')
          square(title: 'ImageVersionsAzure2019', style_modifiers: azur19 + 'Image_Versions.svg')
          square(title: 'ImageAzure2019', style_modifiers: azur19 + 'Image.svg')
          square(title: 'InboundNATAzure2019', style_modifiers: azur19 + 'InboundNAT.svg')
          square(title: 'InboundRuleAzure2019', style_modifiers: azur19 + 'InboundRule.svg')
          square(title: 'InformationAzure2019', style_modifiers: azur19 + 'Info_2.svg')
          square(title: 'WhatsNewAzure2019', style_modifiers: azur19 + 'Info.svg')
          square(title: 'AzureTimeSeriesInsightsEventsSourcesAzure2019', style_modifiers: azur19 + 'Input.svg')
          square(title: 'InputOutputAzure2019', style_modifiers: azur19 + 'InputOutput.svg')
          square(title: 'InstallVisualStudioAzure2019', style_modifiers: azur19 + 'InstallVisualStudio.svg')
          square(title: 'IntegrationAccountsAzure2019', style_modifiers: azur19 + 'Integration_Accounts.svg')
          square(title: 'IntegrationServiceEnvironmentsAzure2019', style_modifiers: azur19 + 'Integration_Service_Environments.svg')
          square(title: 'IntuneAppProtectionAzure2019', style_modifiers: azur19 + 'Intune_App_Protection.svg')
          square(title: 'IntuneAzure2019', style_modifiers: azur19 + 'Intune_App_Protection.svg')
          square(title: 'IOTedgeAzure2019', style_modifiers: azur19 + 'IOT_edge.svg')
          square(title: 'JobAzure2019', style_modifiers: azur19 + 'Job.svg')
          square(title: 'JourneyHubAzure2019', style_modifiers: azur19 + 'JourneyHub.svg')
          square(title: 'KeyVaultsAzure2019', style_modifiers: azur19 + 'Key_Vaults.svg')
          square(title: 'SubscriptionsAzure2019', style_modifiers: azur19 + 'Key.svg')
          square(title: 'KeyboardShortcutsAzure2019', style_modifiers: azur19 + 'KeyboardShortcuts.svg')
          square(title: 'KeyVaultAzure2019', style_modifiers: azur19 + 'KeyVault.svg')
          square(title: 'KubernetesServicesAzure2019', style_modifiers: azur19 + 'Kubernetes_Services.svg')
          square(title: 'KubernetesAzure2019', style_modifiers: azur19 + 'Kubernetes.svg')
          square(title: 'KuduKnifeAzure2019', style_modifiers: azur19 + 'KuduKnife.svg')
          square(title: 'LaunchPortalAzure2019', style_modifiers: azur19 + 'LaunchPortal.svg')
          square(title: 'LoadBalancersAzure2019', style_modifiers: azur19 + 'Load_Balancer_feature.svg')
          square(title: 'LoadTestAzure2019', style_modifiers: azur19 + 'LoadTest.svg')
          square(title: 'LocalNetworkGatewaysAzure2019', style_modifiers: azur19 + 'Local_Network_Gateways.svg')
          square(title: 'LocalNetworkAzure2019', style_modifiers: azur19 + 'LocalNetwork.svg')
          square(title: 'LocationAzure2019', style_modifiers: azur19 + 'Location.svg')
          square(title: 'LogAnalyticsWorkspacesAzure2019', style_modifiers: azur19 + 'Log_Analytics_Workspaces.svg')
          square(title: 'ActivityLogAzure2019', style_modifiers: azur19 + 'Log.svg')
          square(title: 'DiagnosticSettingsAzure2019', style_modifiers: azur19 + 'LogDiagnostics.svg')
          square(title: 'LogicAppsCustomConnectorAzure2019', style_modifiers: azur19 + 'Logic_Apps_Custom_Connector.svg')
          square(title: 'LogicAppsAzure2019', style_modifiers: azur19 + 'Logic_Apps.svg')
          square(title: 'LogStreamingAzure2019', style_modifiers: azur19 + 'LogStreaming.svg')
          square(title: 'MachineLearningServiceWorkspacesAzure2019', style_modifiers: azur19 + 'Machine_Learning_Service_Workspaces.svg')
          square(title: 'MachineLearningStudioWebServicePlansAzure2019', style_modifiers: azur19 + 'Machine_Learning_Studio_Web_Service_Plans.svg')
          square(title: 'MachineLearningStudioWebServicesAzure2019', style_modifiers: azur19 + 'Machine_Learning_Studio_Web_Services.svg')
          square(title: 'MachineLearningStudioWorkspacesAzure2019', style_modifiers: azur19 + 'Machine_Learning_Studio_Workspaces.svg')
          square(title: 'MachineLearningAzure2019', style_modifiers: azur19 + 'Machine_Learning.svg')
          square(title: 'MachineLearningServicePlansAzure2019', style_modifiers: azur19 + 'MachineLearningServicePlans.svg')
          square(title: 'MachineLearningWebServicesAzure2019', style_modifiers: azur19 + 'MachineLearningWebServices.svg')
          square(title: 'MachineLearningWorkspacesAzure2019', style_modifiers: azur19 + 'MachineLearningWorkspaces.svg')
          square(title: 'ManagedApplicationsAzure2019', style_modifiers: azur19 + 'Managed_Applications.svg')
          square(title: 'ManagedDatabasesAzure2019', style_modifiers: azur19 + 'Managed_Databases.svg')
          square(title: 'ManagedDesktopAzure2019', style_modifiers: azur19 + 'Managed_Desktop.svg')
          square(title: 'ManagedIdentitiesAzure2019', style_modifiers: azur19 + 'Managed_Identities.svg')
          square(title: 'ManagedApplicationsAzure2019_', style_modifiers: azur19 + 'ManagedApplications.svg')
          square(title: 'ManagementGroupsAzure2019', style_modifiers: azur19 + 'Management_Groups.svg')
          square(title: 'ManagementPortalAzure2019', style_modifiers: azur19 + 'Management_Portal.svg')
          square(title: 'ManagePortalAzure2019', style_modifiers: azur19 + 'ManagePortal.svg')
          square(title: 'DiskSnapshotsAzure2019', style_modifiers: azur19 + 'MD_snapshot.svg')
          square(title: 'MediaEncodingAzure2019', style_modifiers: azur19 + 'Media_Encoding.svg')
          square(title: 'MediaOnDemandAzure2019', style_modifiers: azur19 + 'Media_On_Demand.svg')
          square(title: 'MediaServicesAzure2019', style_modifiers: azur19 + 'Media_Services.svg')
          square(title: 'AzureMediaServicesAzure2019', style_modifiers: azur19 + 'Media_Services.svg')
          square(title: 'MediaFileAzure2019', style_modifiers: azur19 + 'MediaFile.svg')
          square(title: 'MigrationProjectsAzure2019', style_modifiers: azur19 + 'Migration_Projects.svg')
          square(title: 'AzureMobileEngagementAzure2019', style_modifiers: azur19 + 'Mobile_Engagement.svg')
          square(title: 'ModuleAzure2019', style_modifiers: azur19 + 'Module.svg')
          square(title: 'MonitorAzure2019', style_modifiers: azur19 + 'Monitor.svg')
          square(title: 'MonitoringAzure2019', style_modifiers: azur19 + 'Monitoring.svg')
          square(title: 'MultiFactorAuthenticationAzure2019', style_modifiers: azur19 + 'Multi_Factor_Authentication.svg')
          square(title: 'MySQLClearDBdatabaseAzure2019', style_modifiers: azur19 + 'MySQL_ClearDB_database.svg')
          square(title: 'NetworkSecurityGroupsClassicAzure2019', style_modifiers: azur19 + 'Network_Security_Groups_Classic.svg')
          square(title: 'NetworkWatcherAzure2019', style_modifiers: azur19 + 'Network_watcher.svg')
          square(title: 'NetworkInterfacesAzure2019', style_modifiers: azur19 + 'NetworkInterfaceCard.svg')
          square(title: 'NewAzure2019', style_modifiers: azur19 + 'New.svg')
          square(title: 'NextBillAzure2019', style_modifiers: azur19 + 'NextBill.svg')
          square(title: 'NonAzureMachineAzure2019', style_modifiers: azur19 + 'Non_Azure_Machine.svg')
          square(title: 'NotificationHubsAzure2019', style_modifiers: azur19 + 'Notification_Hubs.svg')
          square(title: 'NotificationHubNamespacesAzure2019', style_modifiers: azur19 + 'Notification_Hubs.svg')
          square(title: 'AlertsAzure2019', style_modifiers: azur19 + 'Notification.svg')
          square(title: 'NSGAzure2019', style_modifiers: azur19 + 'NSG.svg')
          square(title: 'OfferAzure2019', style_modifiers: azur19 + 'Offer.svg')
          square(title: 'OnPremisesDataGatewaysAzure2019', style_modifiers: azur19 + 'On_Premises_Data_Gateways.svg')
          square(title: 'OnPremiseSetupAzure2019', style_modifiers: azur19 + 'OnPremiseSetup.svg')
          square(title: 'AzureOpenShiftAzure2019', style_modifiers: azur19 + 'OpenShift.svg')
          square(title: 'OperationsManagementSuiteAzure2019', style_modifiers: azur19 + 'Operations_Management_Suite.svg')
          square(title: 'OSImagesClassicAzure2019', style_modifiers: azur19 + 'OS_Images_Classic.svg')
          square(title: 'OutboundNATAzure2019', style_modifiers: azur19 + 'OutboundNAT.svg')
          square(title: 'OutboundRuleAzure2019', style_modifiers: azur19 + 'OutboundRule.svg')
          square(title: 'OutputAzure2019', style_modifiers: azur19 + 'Output.svg')
          square(title: 'overageCostsAzure2019', style_modifiers: azur19 + 'overageCosts.svg')
          square(title: 'PausedAzure2019', style_modifiers: azur19 + 'Paused.svg')
          square(title: 'PeeringsAzure2019', style_modifiers: azur19 + 'Peerings.svg')
          square(title: 'PendingAzure2019', style_modifiers: azur19 + 'Pending.svg')
          square(title: 'UserIconAzure2019', style_modifiers: azur19 + 'Person.svg')
          square(title: 'PersonWithFriendAzure2019', style_modifiers: azur19 + 'PersonWithFriend.svg')
          square(title: 'PhoneAzure2019', style_modifiers: azur19 + 'Phone.svg')
          square(title: 'PluralsightAzure2019', style_modifiers: azur19 + 'PluralSight_mono.svg')
          square(title: 'PolicyAzure2019', style_modifiers: azur19 + 'Policy.svg')
          square(title: 'PortalCurrentAzure2019', style_modifiers: azur19 + 'PortalCurrent.svg')
          square(title: 'PostponeAzure2019', style_modifiers: azur19 + 'Postpone.svg')
          square(title: 'PowerAzure2019', style_modifiers: azur19 + 'Power.svg')
          square(title: 'PowershellAzure2019', style_modifiers: azur19 + 'Powershell.svg')
          square(title: 'PowerUp2Azure2019', style_modifiers: azur19 + 'PowerUp_2.svg')
          square(title: 'PowerUpAzure2019', style_modifiers: azur19 + 'PowerUp.svg')
          square(title: 'PreviewRightAzure2019', style_modifiers: azur19 + 'PreviewRight.svg')
          square(title: 'ProbeAzure2019', style_modifiers: azur19 + 'Probe.svg')
          square(title: 'ProcessExplorerAzure2019', style_modifiers: azur19 + 'ProcessExplorer.svg')
          square(title: 'ProductionReadyDBAzure2019', style_modifiers: azur19 + 'ProductionReadyDB.svg')
          square(title: 'PublishAzure2019', style_modifiers: azur19 + 'Publish.svg')
          square(title: 'PullRequestAzure2019', style_modifiers: azur19 + 'PullRequest.svg')
          square(title: 'QSDiagnosticsAzure2019', style_modifiers: azur19 + 'QSDiagnostics.svg')
          square(title: 'QSFileAzure2019', style_modifiers: azur19 + 'QSFile.svg')
          square(title: 'QSMailAzure2019', style_modifiers: azur19 + 'QSMail.svg')
          square(title: 'QSWarningAzure2019', style_modifiers: azur19 + 'QSWarning.svg')
          square(title: 'QueuedAzure2019', style_modifiers: azur19 + 'Queued.svg')
          square(title: 'QueuesStorageAzure2019', style_modifiers: azur19 + 'Queues_Storage.svg')
          square(title: 'QuickStartCenterAzure2019', style_modifiers: azur19 + 'Quick_Start_Center.svg')
          square(title: 'QuickstartAzure2019', style_modifiers: azur19 + 'Quickstart.svg')
          square(title: 'QuotaAzure2019', style_modifiers: azur19 + 'Quota.svg')
          square(title: 'RainAzure2019', style_modifiers: azur19 + 'Rain.svg')
          square(title: 'RDMAAzure2019', style_modifiers: azur19 + 'RDMA.svg')
          square(title: 'RecommendationAzure2019', style_modifiers: azur19 + 'Recommendation.svg')
          square(title: 'RemoteAppAzure2019', style_modifiers: azur19 + 'RemoteApp.svg')
          square(title: 'ReservationsAzure2019', style_modifiers: azur19 + 'Reservations.svg')
          square(title: 'ResourceExplorerAzure2019', style_modifiers: azur19 + 'Resource_Explorer.svg')
          square(title: 'ResourceGraphExplorerAzure2019', style_modifiers: azur19 + 'Resource_Graph_Explorer.svg')
          square(title: 'ResourceGroupsAzure2019', style_modifiers: azur19 + 'Resource_Groups.svg')
          square(title: 'ResourceDefaultAzure2019', style_modifiers: azur19 + 'ResourceDefault.svg')
          square(title: 'ResourceGroupAzure2019', style_modifiers: azur19 + 'ResourceGroup.svg')
          square(title: 'ResourceLinkedAzure2019', style_modifiers: azur19 + 'ResourceLinked.svg')
          square(title: 'ResourceProviderAzure2019', style_modifiers: azur19 + 'ResourceProvider.svg')
          square(title: 'ResourceRoleAzure2019', style_modifiers: azur19 + 'ResourceRole.svg')
          square(title: 'RouteFiltersAzure2019', style_modifiers: azur19 + 'Route_Filter.svg')
          square(title: 'RuleAzure2019', style_modifiers: azur19 + 'Rule.svg')
          square(title: 'RunbooksAzure2019', style_modifiers: azur19 + 'Runbooks.svg')
          square(title: 'RunbookSourceAzure2019', style_modifiers: azur19 + 'RunbookSource.svg')
          square(title: 'SAPHANAonAzureAzure2019', style_modifiers: azur19 + 'SAP_HANA_on_Azure.svg')
          square(title: 'ScaleAzure2019', style_modifiers: azur19 + 'Scale.svg')
          square(title: 'ScaleAltAzure2019', style_modifiers: azur19 + 'ScaleAlt.svg')
          square(title: 'SchedulerJobAzure2019', style_modifiers: azur19 + 'SchedulerJob.svg')
          square(title: 'SchedulerJobCollectionsAzure2019', style_modifiers: azur19 + 'SchedulerJobCollection.svg')
          square(title: 'SDKAzure2019', style_modifiers: azur19 + 'SDK.svg')
          square(title: 'SearchAzure2019', style_modifiers: azur19 + 'Search.svg')
          square(title: 'AzureSearchAzure2019', style_modifiers: azur19 + 'Search.svg')
          square(title: 'SearchGridAzure2019', style_modifiers: azur19 + 'SearchGrid.svg')
          square(title: 'SecurityBaselinesAzure2019', style_modifiers: azur19 + 'Security_Baselines.svg')
          square(title: 'ConditionalAccessAzure2019', style_modifiers: azur19 + 'Security_Center.svg')
          square(title: 'SecurityCenterAzure2019', style_modifiers: azur19 + 'Security_Center.svg')
          square(title: 'SendGridAccountsAzure2019', style_modifiers: azur19 + 'SendGrid_Accounts.svg')
          square(title: 'ServerAzure2019', style_modifiers: azur19 + 'Server.svg')
          square(title: 'ServerFarmAzure2019', style_modifiers: azur19 + 'ServerFarm.svg')
          square(title: 'ServerProxyAzure2019', style_modifiers: azur19 + 'ServerProxy.svg')
          square(title: 'serversAndMobileDevicesAzure2019', style_modifiers: azur19 + 'serversAndMobileDevices.svg')
          square(title: 'ServiceBusQueuesAzure2019', style_modifiers: azur19 + 'Service_Bus_Queues.svg')
          square(title: 'AzureServiceBusRelaysAzure2019', style_modifiers: azur19 + 'Service_Bus_Relay.svg')
          square(title: 'ServiceBusTopicsAzure2019', style_modifiers: azur19 + 'Service_Bus_Topics.svg')
          square(title: 'AzureServiceBusAzure2019', style_modifiers: azur19 + 'Service_Bus.svg')
          square(title: 'ServiceCatalogManagedApplicationDefinitionsAzure2019', style_modifiers: azur19 + 'Service_Catalog_Managed_Application_Definitions.svg')
          square(title: 'ServiceEndpointPoliciesAzure2019', style_modifiers: azur19 + 'Service_Endpoint_Policies.svg')
          square(title: 'ServiceFabricClustersAzure2019', style_modifiers: azur19 + 'Service_Fabric.svg')
          square(title: 'ServiceHealthAzure2019', style_modifiers: azur19 + 'ServiceHealth.svg')
          square(title: 'SharedDashboardAzure2019', style_modifiers: azur19 + 'Shared_Dashboard.svg')
          square(title: 'SharedImageGalleriesAzure2019', style_modifiers: azur19 + 'Shared_Image_Galleries.svg')
          square(title: 'ShieldFirewallAzure2019', style_modifiers: azur19 + 'ShieldFirewall.svg')
          square(title: 'SignalRAzure2019', style_modifiers: azur19 + 'SignalR.svg')
          square(title: 'SiteRecoveryAzure2019', style_modifiers: azur19 + 'Site_Recovery.svg')
          square(title: 'SoftwareasaServiceSaaSAzure2019', style_modifiers: azur19 + 'Software_as_a_Service.svg')
          square(title: 'SoftwareUpdateAzure2019', style_modifiers: azur19 + 'Software_Update.svg')
          square(title: 'SolutionsAzure2019', style_modifiers: azur19 + 'Solutions.svg')
          square(title: 'SpatialAnchorAzure2019', style_modifiers: azur19 + 'Spatial_Anchor.svg')
          square(title: 'SQLDatabasesAzure2019', style_modifiers: azur19 + 'SQL_Database_generic.svg')
          square(title: 'AzureSQLDataWarehouseAzure2019', style_modifiers: azur19 + 'SQL_DataWarehouse.svg')
          square(title: 'SQLManagedInstancesAzure2019', style_modifiers: azur19 + 'SQL_Managed_Instances.svg')
          square(title: 'SQLServersAzure2019', style_modifiers: azur19 + 'SQL_Servers.svg')
          square(title: 'SQLStretchDatabaseAzure2019', style_modifiers: azur19 + 'SQL_Stretch_Database.svg')
          square(title: 'SQLServerStretchDatabasesAzure2019', style_modifiers: azur19 + 'dep/SQL_Server_Stretch_DB.svg')
          square(title: 'SQLQueryPerformanceCheckAzure2019', style_modifiers: azur19 + 'SQLQueryPerformanceCheck.svg')
          square(title: 'SSDAzure2019', style_modifiers: azur19 + 'SSD.svg')
          square(title: 'StackOverflowAzure2019', style_modifiers: azur19 + 'StackOverflow.svg')
          square(title: 'StorageAccountsAzure2019', style_modifiers: azur19 + 'Storage_Accounts.svg')
          square(title: 'StorageExplorerAzure2019', style_modifiers: azur19 + 'Storage_Explorer.svg')
          square(title: 'StorageSyncServicesAzure2019', style_modifiers: azur19 + 'Storage_sync_service.svg')
          square(title: 'StorageAzure2019', style_modifiers: azur19 + 'Storage.svg')
          square(title: 'StorageAzureFilesAzure2019', style_modifiers: azur19 + 'StorageAzureFiles.svg')
          square(title: 'StorageContainerAzure2019', style_modifiers: azur19 + 'StorageContainer.svg')
          square(title: 'StorageQueueAzure2019', style_modifiers: azur19 + 'StorageQueue.svg')
          square(title: 'StorageReplicaAzure2019', style_modifiers: azur19 + 'StorageReplica.svg')
          square(title: 'MarketplaceAzure2019', style_modifiers: azur19 + 'Store_Marketplace.svg')
          square(title: 'StorSimpleDataManagersAzure2019', style_modifiers: azur19 + 'StorSimple_Data_Managers.svg')
          square(title: 'AzureStorSimpleDeviceManagersAzure2019', style_modifiers: azur19 + 'StorSimple.svg')
          square(title: 'StorSimpleDeviceManagersAzure2019', style_modifiers: azur19 + 'StorSimple.svg')
          square(title: 'StreamAnalyticsJobsAzure2019', style_modifiers: azur19 + 'Stream_Analytics.svg')
          square(title: 'SubnetAzure2019', style_modifiers: azur19 + 'Subnet.svg')
          square(title: 'HelpSupportAzure2019', style_modifiers: azur19 + 'Support_2.svg')
          square(title: 'SupportRequestsAzure2019', style_modifiers: azur19 + 'Support_Requests.svg')
          square(title: 'SupportAzure2019', style_modifiers: azur19 + 'Support.svg')
          square(title: 'TableStorageAzure2019', style_modifiers: azur19 + 'Table_Storage.svg')
          square(title: 'TagAzure2019', style_modifiers: azur19 + 'Tag.svg')
          square(title: 'TagsAzure2019', style_modifiers: azur19 + 'Tags.svg')
          square(title: 'TaskAzure2019', style_modifiers: azur19 + 'Task.svg')
          square(title: 'TasksAzure2019', style_modifiers: azur19 + 'Tasks.svg')
          square(title: 'TasksPolychromaticAzure2019', style_modifiers: azur19 + 'TasksPolychromatic.svg')
          square(title: 'TaskVMAzure2019', style_modifiers: azur19 + 'TaskVM.svg')
          square(title: 'TaxAzure2019', style_modifiers: azur19 + 'Tax.svg')
          square(title: 'TeamProjectAzure2019', style_modifiers: azur19 + 'TeamProject.svg')
          square(title: 'TemplatesAzure2019', style_modifiers: azur19 + 'Templates.svg')
          square(title: 'TenantStatusAzure2019', style_modifiers: azur19 + 'Tenant_Status.svg')
          square(title: 'TFSVCRepositoryAzure2019', style_modifiers: azur19 + 'TFSVCRepository.svg')
          square(title: 'AzureTimeSeriesInsightsEnvironmentsAzure2019', style_modifiers: azur19 + 'Time_Series_Insights_environments.svg')
          square(title: 'TimeSeriesInsightsAzure2019', style_modifiers: azur19 + 'TimeSeriesInsights.svg')
          square(title: 'ToolboxAzure2019', style_modifiers: azur19 + 'Toolbox.svg')
          square(title: 'ToolsAzure2019', style_modifiers: azur19 + 'Tools.svg')
          square(title: 'TrafficManagerProfilesAzure2019', style_modifiers: azur19 + 'Traffic_Manager.svg')
          square(title: 'TrafficManagerDisabledAzure2019', style_modifiers: azur19 + 'TrafficManagerDisabled.svg')
          square(title: 'TrafficManagerEnabledAzure2019', style_modifiers: azur19 + 'TrafficManagerEnabled.svg')
          square(title: 'TwoUserIconAzure2019', style_modifiers: azur19 + 'Two_User_Icon.svg')
          square(title: 'UnidentifiedFeatureObjectAzure2019', style_modifiers: azur19 + 'Unidentified_Feature_Object.svg')
          square(title: 'UserHealthIconAzure2019', style_modifiers: azur19 + 'User_Health_Icon.svg')
          square(title: 'UserPrivacyAzure2019', style_modifiers: azur19 + 'User_Privacy.svg')
          square(title: 'UserResourceAzure2019', style_modifiers: azur19 + 'User_Resource.svg')
          square(title: 'RouteTablesAzure2019', style_modifiers: azur19 + 'UserDefinedRoute.svg')
          square(title: 'VariablesAzure2019', style_modifiers: azur19 + 'Variables.svg')
          square(title: 'VersionsAzure2019', style_modifiers: azur19 + 'Versions.svg')
          square(title: 'VirtualClustersAzure2019', style_modifiers: azur19 + 'Virtual_Clusters.svg')
          square(title: 'VirtualDatacenterAzure2019', style_modifiers: azur19 + 'Virtual_Datacenter.svg')
          square(title: 'VMClassicAzure2019', style_modifiers: azur19 + 'Virtual_Machine_2.svg')
          square(title: 'VMAzure2019', style_modifiers: azur19 + 'Virtual_Machine.svg')
          square(title: 'AvailabilitySetsAzure2019', style_modifiers: azur19 + 'Virtual_Machines_Availability_Set.svg')
          square(title: 'VirtualMachinesLinuxAzure2019', style_modifiers: azur19 + 'Virtual_Machines_Linux.svg')
          square(title: 'VirtualNetworkClassicAzure2019', style_modifiers: azur19 + 'Virtual_Network_Classic.svg')
          square(title: 'VirtualNetworksAzure2019', style_modifiers: azur19 + 'Virtual_Network.svg')
          square(title: 'VirtualWANsAzure2019', style_modifiers: azur19 + 'Virtual_WANs.svg')
          square(title: 'VirtualMachineLinuxAzure2019', style_modifiers: azur19 + 'VirtualMachineLinux.svg')
          square(title: 'VMWindowsAzure2019', style_modifiers: azur19 + 'VirtualMachineWindows.svg')
          square(title: 'VisualStudioTeamServicesCodePlexsourceAzure2019', style_modifiers: azur19 + 'Visual_Studio_Team_Services_CodePlex_source.svg')
          square(title: 'VMImagesAzure2019', style_modifiers: azur19 + 'VM_Images.svg')
          square(title: 'VMLinuxNonAzureAzure2019', style_modifiers: azur19 + 'VM_Linux_Non_Azure.svg')
          square(title: 'VMLinuxAzure2019', style_modifiers: azur19 + 'VM_Linux.svg')
          square(title: 'VMScaleSetsAzure2019', style_modifiers: azur19 + 'VM_Scale_Set.svg')
          square(title: 'VMWindowsNonAzureAzure2019', style_modifiers: azur19 + 'VM_Windows_Non_Azure.svg')
          square(title: 'VMScaleAzure2019', style_modifiers: azur19 + 'VMScale.svg')
          square(title: 'VirtualNetworkGatewaysAzure2019', style_modifiers: azur19 + 'VPN_Gateway.svg')
          square(title: 'VPNPointToSiteAzure2019', style_modifiers: azur19 + 'VPNPointToSite.svg')
          square(title: 'VPNSiteToSiteAzure2019', style_modifiers: azur19 + 'VPNSiteToSite.svg')
          square(title: 'WebAppFirewallAzure2019', style_modifiers: azur19 + 'Web_App_Firewall.svg')
          square(title: 'WebAppWebJobsAzure2019', style_modifiers: azur19 + 'WebApp_WebJobs.svg')
          square(title: 'UmbracoAzure2019', style_modifiers: azur19 + 'WebAppUmbraco.svg')
          square(title: 'WordPressAzure2019', style_modifiers: azur19 + 'WebAppWordPress.svg')
          square(title: 'WebEnvironmentAzure2019', style_modifiers: azur19 + 'WebEnvironment.svg')
          square(title: 'WebhooksAzure2019', style_modifiers: azur19 + 'Webhooks.svg')
          square(title: 'WebHostingAzure2019', style_modifiers: azur19 + 'WebHosting.svg')
          square(title: 'AppServicePlansAzure2019', style_modifiers: azur19 + 'WebHosting.svg')
          square(title: 'WebNetworkAzure2019', style_modifiers: azur19 + 'WebNetwork.svg')
          square(title: 'WebsitePowerAzure2019', style_modifiers: azur19 + 'WebsitePower.svg')
          square(title: 'WebsiteReplicatorAzure2019', style_modifiers: azur19 + 'WebsiteReplicator.svg')
          square(title: 'WebsiteSettingsAzure2019', style_modifiers: azur19 + 'WebsiteSettings.svg')
          square(title: 'WebsiteStagingAzure2019', style_modifiers: azur19 + 'WebsiteStaging.svg')
          square(title: 'WebSlotsAzure2019', style_modifiers: azur19 + 'WebSlots.svg')
          square(title: 'WebTestAzure2019', style_modifiers: azur19 + 'WebTest.svg')
          square(title: 'Windows10IoTCoreServicesAzure2019', style_modifiers: azur19 + 'Windows_10_IoT_Core_Services.svg')
          square(title: 'WorkflowAzure2019', style_modifiers: azur19 + 'Workflow.svg')
          square(title: 'WrenchAzure2019', style_modifiers: azur19 + 'Wrench.svg')
          square(title: 'XboxControllerAzure2019', style_modifiers: azur19 + 'XboxController.svg')
          square(title: 'HockeyAppAzure2019', style_modifiers: 'shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;shape=mxgraph.mscae.cloud.hockeyapp;fillColor=#0079D6;pointerEvents=1')
          square(title: 'AppServiceLogicAppAzure2019', style_modifiers: azur19 + 'dep/App_Service_Logic_App.svg')
          square(title: 'ContentDeliveryNetworkAzure2019', style_modifiers: azur19 + 'dep/Content_Delivery_Network.svg')
          square(title: 'DataLakeStoreAzure2019', style_modifiers: azur19 + 'dep/Data_Lake_Store.svg')
          square(title: 'AzureInformationProtectionAzure2019', style_modifiers: 'aspect=fixed;shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;shape=mxgraph.mscae.cloud.azure_rights_management_rms;fillColor=#58B4D9;')
          square(title: 'IoTCentralApplicationsAzure2019', style_modifiers: 'aspect=fixed;shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;shape=mxgraph.mscae.cloud.central;fillColor=#0079D6;pointerEvents=1')
          
        end
        .page('Cisco Basic', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'Cisco_cisco_androgenous_person', style_modifiers: s + 'cisco.people.androgenous_person;' + c)
          square(title: 'Cisco_cisco_atm_switch', style_modifiers: s + 'cisco.switches.atm_switch;' + c)
          square(title: 'Cisco_cisco_cloud', style_modifiers: s + 'cisco.storage.cloud;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897;fillColor=#ffffff')
          square(title: 'Cisco_cisco_fileserver', style_modifiers: s + 'cisco.servers.fileserver;' + c)
          square(title: 'Cisco_cisco_firewall', style_modifiers: s + 'cisco.security.firewall;' + c)
          square(title: 'Cisco_cisco_generic_building', style_modifiers: s + 'cisco.buildings.generic_building;' + c)
          square(title: 'Cisco_cisco_laptop', style_modifiers: s + 'cisco.computers_and_peripherals.laptop;' + c)
          square(title: 'Cisco_cisco_lock', style_modifiers: s + 'cisco.security.lock;' + c)
          square(title: 'Cisco_cisco_microwebserver', style_modifiers: s + 'cisco.servers.microwebserver;' + c)
          square(title: 'Cisco_cisco_pc', style_modifiers: s + 'cisco.computers_and_peripherals.pc;' + c)
          square(title: 'Cisco_cisco_pda', style_modifiers: s + 'cisco.misc.pda;' + c)
          square(title: 'Cisco_cisco_phone', style_modifiers: s + 'cisco.modems_and_phones.hootphone;' + c)
          square(title: 'Cisco_cisco_printer', style_modifiers: s + 'cisco.computers_and_peripherals.printer;' + c)
          square(title: 'Cisco_cisco_relational_database', style_modifiers: s + 'cisco.storage.relational_database;' + c)
          square(title: 'Cisco_cisco_router', style_modifiers: s + 'cisco.routers.router;' + c)
          square(title: 'Cisco_cisco_standing_man', style_modifiers: s + 'cisco.people.standing_man;' + c)
          square(title: 'Cisco_cisco_standing_woman', style_modifiers: s + 'cisco.people.standing_woman;' + c)
          square(title: 'Cisco_cisco_ups', style_modifiers: s + 'cisco.misc.ups;' + c)
          square(title: 'Cisco_cisco_wireless_router', style_modifiers: s + 'cisco.routers.wireless_router;' + c)
        end
        .page('Cisco Extended', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'Cisco_cisco_100baset_hub', style_modifiers: s + 'cisco.hubs_and_gateways.100baset_hub;' + c)
          square(title: 'Cisco_cisco_10700', style_modifiers: s + 'cisco.routers.10700;' + c)
          square(title: 'Cisco_cisco_10GE_FCoE', style_modifiers: s + 'cisco.controllers_and_modules.10ge_fcoe;' + c)
          square(title: 'Cisco_cisco_15200', style_modifiers: s + 'cisco.misc.15200;' + c)
          square(title: 'Cisco_cisco_3174__desktop_', style_modifiers: s + 'cisco.controllers_and_modules.3174_(desktop)_cluster_controller;' + c)
          square(title: 'Cisco_cisco_3200_mobile_access_router', style_modifiers: s + 'cisco.routers.mobile_access_router;' + c)
          square(title: 'Cisco_cisco_3x74__floor_', style_modifiers: s + 'cisco.controllers_and_modules.3x74_(floor)_cluster_controller;' + c)
          square(title: 'Cisco_cisco_6700_series', style_modifiers: s + 'cisco.misc.6700_series;' + c)
          square(title: 'Cisco_cisco_7500ars__7513_', style_modifiers: s + 'cisco.misc.7500ars_(7513);' + c)
          square(title: 'Cisco_cisco_accesspoint', style_modifiers: s + 'cisco.misc.access_point;' + c)
          square(title: 'Cisco_cisco_ace', style_modifiers: s + 'cisco.misc.ace;' + c)
          square(title: 'Cisco_cisco_ACS', style_modifiers: s + 'cisco.misc.acs;' + c)
          square(title: 'Cisco_cisco_adm', style_modifiers: s + 'cisco.misc.adm;' + c)
          square(title: 'Cisco_cisco_antenna', style_modifiers: s + 'cisco.wireless.antenna;' + c)
          square(title: 'Cisco_cisco_asic_processor', style_modifiers: s + 'cisco.misc.asic_processor;' + c)
          square(title: 'Cisco_cisco_ASR_1000_Series', style_modifiers: s + 'cisco.misc.asr_1000_series;' + c)
          square(title: 'Cisco_cisco_ata', style_modifiers: s + 'cisco.misc.ata;' + c)
          square(title: 'Cisco_cisco_atm_3800', style_modifiers: s + 'cisco.misc.atm_3800;' + c)
          square(title: 'Cisco_cisco_atm_fast_gigabit_etherswitch', style_modifiers: s + 'cisco.switches.atm_fast_gigabit_etherswitch;' + c)
          square(title: 'Cisco_cisco_atm_router', style_modifiers: s + 'cisco.routers.atm_router;' + c)
          square(title: 'Cisco_cisco_atm_tag_switch_router', style_modifiers: s + 'cisco.routers.atm_tag_switch_router;' + c)
          square(title: 'Cisco_cisco_avs', style_modifiers: s + 'cisco.misc.avs;' + c)
          square(title: 'Cisco_cisco_AXP', style_modifiers: s + 'cisco.misc.axp;' + c)
          square(title: 'Cisco_cisco_bbsm', style_modifiers: s + 'cisco.misc.bbsm;' + c)
          square(title: 'Cisco_cisco_branch_office', style_modifiers: s + 'cisco.buildings.branch_office;' + c)
          square(title: 'Cisco_cisco_breakout_box', style_modifiers: s + 'cisco.misc.breakout_box;' + c)
          square(title: 'Cisco_cisco_bridge', style_modifiers: s + 'cisco.misc.bridge;' + c)
          square(title: 'Cisco_cisco_broadband_router', style_modifiers: s + 'cisco.routers.broadcast_router;' + c)
          square(title: 'Cisco_cisco_bts_10200', style_modifiers: s + 'cisco.misc.bts_10200;' + c)
          square(title: 'Cisco_cisco_cable_modem', style_modifiers: s + 'cisco.modems_and_phones.cable_modem;' + c)
          square(title: 'Cisco_cisco_callmanager', style_modifiers: s + 'cisco.misc.call_manager;' + c)
          square(title: 'Cisco_cisco_car', style_modifiers: s + 'cisco.misc.car;' + c)
          square(title: 'Cisco_cisco_carrier_routing_system', style_modifiers: s + 'cisco.misc.carrier_routing_system;' + c)
          square(title: 'Cisco_cisco_cddi_fddi', style_modifiers: s + 'cisco.misc.cddi_fddi;' + c)
          square(title: 'Cisco_cisco_cdm', style_modifiers: s + 'cisco.misc.cdm;' + c)
          square(title: 'Cisco_cisco_cellular_phone', style_modifiers: s + 'cisco.modems_and_phones.cell_phone;' + c)
          square(title: 'Cisco_cisco_centri_firewall', style_modifiers: s + 'cisco.security.centri_firewall;' + c)
          square(title: 'Cisco_cisco_cisco_1000', style_modifiers: s + 'cisco.misc.cisco_1000;' + c)
          square(title: 'Cisco_cisco_cisco_asa_5500', style_modifiers: s + 'cisco.misc.asa_5500;' + c)
          square(title: 'Cisco_cisco_cisco_ca', style_modifiers: s + 'cisco.misc.cisco_ca;' + c)
          square(title: 'Cisco_cisco_cisco_file_engine', style_modifiers: s + 'cisco.storage.cisco_file_engine;' + c)
          square(title: 'Cisco_cisco_cisco_hub', style_modifiers: s + 'cisco.hubs_and_gateways.cisco_hub;' + c)
          square(title: 'Cisco_cisco_ciscosecurity', style_modifiers: s + 'cisco.security.cisco_security;' + c)
          square(title: 'Cisco_cisco_cisco_unified_presence_server', style_modifiers: s + 'cisco.servers.cisco_unified_presence_server;' + c)
          square(title: 'Cisco_cisco_cisco_unityexpress', style_modifiers: s + 'cisco.misc.cisco_unity_express;' + c)
          square(title: 'Cisco_cisco_ciscoworks', style_modifiers: s + 'cisco.misc.cisco_works;' + c)
          square(title: 'Cisco_cisco_class_4_5_switch', style_modifiers: s + 'cisco.switches.class_4_5_switch;' + c)
          square(title: 'Cisco_cisco_communications_server', style_modifiers: s + 'cisco.servers.communications_server;' + c)
          square(title: 'Cisco_cisco_contact_center', style_modifiers: s + 'cisco.misc.contact_center;' + c)
          square(title: 'Cisco_cisco_content_engine__cache_director_', style_modifiers: s + 'cisco.directors.content_engine_(cache_director);' + c)
          square(title: 'Cisco_cisco_content_service_router', style_modifiers: s + 'cisco.routers.content_service_router;' + c)
          square(title: 'Cisco_cisco_content_service_switch_1100', style_modifiers: s + 'cisco.switches.content_service_switch_1100;' + c)
          square(title: 'Cisco_cisco_content_switch_module', style_modifiers: s + 'cisco.controllers_and_modules.content_switch_module;' + c)
          square(title: 'Cisco_cisco_content_switch', style_modifiers: s + 'cisco.switches.content_switch;' + c)
          square(title: 'Cisco_cisco_content_transformation_engine__cte_', style_modifiers: s + 'cisco.misc.content_transformation_engine_(cte);' + c)
          square(title: 'Cisco_cisco_cs_mars', style_modifiers: s + 'cisco.misc.cs-mars;' + c)
          square(title: 'Cisco_cisco_csm_s', style_modifiers: s + 'cisco.misc.csm-s;' + c)
          square(title: 'Cisco_cisco_csu_dsu', style_modifiers: s + 'cisco.misc.csu_dsu;' + c)
          square(title: 'Cisco_cisco_CUBE', style_modifiers: s + 'cisco.misc.cube;' + c)
          square(title: 'Cisco_cisco_detector', style_modifiers: s + 'cisco.misc.detector;' + c)
          square(title: 'Cisco_cisco_director_class_fibre_channel_director', style_modifiers: s + 'cisco.directors.director-class_fibre_channel_director;' + c)
          square(title: 'Cisco_cisco_directory_server', style_modifiers: s + 'cisco.servers.directory_server;' + c)
          square(title: 'Cisco_cisco_diskette', style_modifiers: s + 'cisco.storage.diskette;' + c)
          square(title: 'Cisco_cisco_distributed_director', style_modifiers: s + 'cisco.directors.distributed_director;' + c)
          square(title: 'Cisco_cisco_dot_dot', style_modifiers: s + 'cisco.misc.dot-dot;' + c)
          square(title: 'Cisco_cisco_dpt', style_modifiers: s + 'cisco.misc.dpt;' + c)
          square(title: 'Cisco_cisco_dslam', style_modifiers: s + 'cisco.misc.dslam;' + c)
          square(title: 'Cisco_cisco_dual_mode_ap', style_modifiers: s + 'cisco.misc.dual_mode;' + c)
          square(title: 'Cisco_cisco_dwdm_filter', style_modifiers: s + 'cisco.misc.dwdm_filter;' + c)
          square(title: 'Cisco_cisco_end_office', style_modifiers: s + 'cisco.buildings.end_office;' + c)
          square(title: 'Cisco_cisco_fax', style_modifiers: s + 'cisco.modems_and_phones.fax;' + c)
          square(title: 'Cisco_cisco_fc_storage', style_modifiers: s + 'cisco.storage.fc_storage;' + c)
          square(title: 'Cisco_cisco_fddi_ring', style_modifiers: s + 'cisco.misc.fddi_ring;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897;')
          square(title: 'Cisco_cisco_fibre_channel_disk_subsystem', style_modifiers: s + 'cisco.storage.fibre_channel_disk_subsystem;' + c)
          square(title: 'Cisco_cisco_fibre_channel_fabric_switch', style_modifiers: s + 'cisco.switches.fibre_channel_fabric_switch;' + c)
          square(title: 'Cisco_cisco_file_cabinet', style_modifiers: s + 'cisco.storage.file_cabinet;' + c)
          square(title: 'Cisco_cisco_file_server', style_modifiers: s + 'cisco.servers.file_server;' + c)
          square(title: 'Cisco_cisco_firewall_service_module__fwsm_', style_modifiers: s + 'cisco.controllers_and_modules.firewall_service_module_(fwsm);' + c)
          square(title: 'Cisco_cisco_front_end_processor', style_modifiers: s + 'cisco.misc.front_end_processor;' + c)
          square(title: 'Cisco_cisco_gatekeeper', style_modifiers: s + 'cisco.security.gatekeeper;strokeColor=#036897;')
          square(title: 'Cisco_cisco_general_applicance', style_modifiers: s + 'cisco.misc.general_appliance;' + c)
          square(title: 'Cisco_cisco_generic_gateway', style_modifiers: s + 'cisco.hubs_and_gateways.generic_gateway;' + c)
          square(title: 'Cisco_cisco_generic_processor', style_modifiers: s + 'cisco.misc.generic_processor;' + c)
          square(title: 'Cisco_cisco_generic_softswitch', style_modifiers: s + 'cisco.switches.generic_softswitch;' + c)
          square(title: 'Cisco_cisco_gigabit_switch_atm_tag_router', style_modifiers: s + 'cisco.routers.gigabit_switch_atm_tag_router;' + c)
          square(title: 'Cisco_cisco_government_building', style_modifiers: s + 'cisco.buildings.government_building;' + c)
          square(title: 'Cisco_cisco_Ground_terminal', style_modifiers: s + 'cisco.wireless.ground_terminal;' + c)
          square(title: 'Cisco_cisco_guard', style_modifiers: s + 'cisco.security.guard;' + c)
          square(title: 'Cisco_cisco_handheld', style_modifiers: s + 'cisco.misc.handheld;' + c)
          square(title: 'Cisco_cisco_hootphone', style_modifiers: s + 'cisco.modems_and_phones.hootphone;' + c)
          square(title: 'Cisco_cisco_host', style_modifiers: s + 'cisco.servers.host;' + c)
          square(title: 'Cisco_cisco_hp_mini', style_modifiers: s + 'cisco.misc.hp_mini;' + c)
          square(title: 'Cisco_cisco_h', style_modifiers: s + 'cisco.misc.h_323;' + c)
          square(title: 'Cisco_cisco_hub', style_modifiers: s + 'cisco.hubs_and_gateways.hub;' + c)
          square(title: 'Cisco_cisco_iad_router', style_modifiers: s + 'cisco.routers.iad_router;' + c)
          square(title: 'Cisco_cisco_ibm_mainframe', style_modifiers: s + 'cisco.computers_and_peripherals.ibm_mainframe;' + c)
          square(title: 'Cisco_cisco_ibm_mini_as400', style_modifiers: s + 'cisco.computers_and_peripherals.ibm_mini_as400;' + c)
          square(title: 'Cisco_cisco_ibm_tower', style_modifiers: s + 'cisco.computers_and_peripherals.ibm_tower;' + c)
          square(title: 'Cisco_cisco_icm', style_modifiers: s + 'cisco.misc.icm;' + c)
          square(title: 'Cisco_cisco_ics', style_modifiers: s + 'cisco.misc.ics;' + c)
          square(title: 'Cisco_cisco_intelliswitch_stack', style_modifiers: s + 'cisco.switches.intelliswitch_stack;' + c)
          square(title: 'Cisco_cisco_ios_firewall', style_modifiers: s + 'cisco.security.ios_firewall;' + c)
          square(title: 'Cisco_cisco_ios_slb', style_modifiers: s + 'cisco.misc.ios_slb;' + c)
          square(title: 'Cisco_cisco_ip_communicator', style_modifiers: s + 'cisco.misc.ip_communicator;' + c)
          square(title: 'Cisco_cisco_ip_dsl', style_modifiers: s + 'cisco.misc.ip_dsl;' + c)
          square(title: 'Cisco_cisco_ip_phone', style_modifiers: s + 'cisco.modems_and_phones.ip_phone;' + c)
          square(title: 'Cisco_cisco_ip', style_modifiers: s + 'cisco.misc.ip;' + c)
          square(title: 'Cisco_cisco_iptc', style_modifiers: s + 'cisco.misc.iptc;' + c)
          square(title: 'Cisco_cisco_ip_telephony_router', style_modifiers: s + 'cisco.routers.ip_telephony_router;' + c)
          square(title: 'Cisco_cisco_iptv_content_manager', style_modifiers: s + 'cisco.misc.iptv_content_manager;' + c)
          square(title: 'Cisco_cisco_iptv_server', style_modifiers: s + 'cisco.servers.iptv_server;' + c)
          square(title: 'Cisco_cisco_iscsi_router', style_modifiers: s + 'cisco.routers.isci_router;' + c)
          square(title: 'Cisco_cisco_isdn_switch', style_modifiers: s + 'cisco.switches.isdn_switch;' + c)
          square(title: 'Cisco_cisco_itp', style_modifiers: s + 'cisco.misc.itp;' + c)
          square(title: 'Cisco_cisco_jbod', style_modifiers: s + 'cisco.misc.jbod;' + c)
          square(title: 'Cisco_cisco_key', style_modifiers: s + 'cisco.misc.key;' + c)
          square(title: 'Cisco_cisco_keys', style_modifiers: s + 'cisco.misc.keys;' + c)
          square(title: 'Cisco_cisco_lan_to_lan', style_modifiers: s + 'cisco.misc.lan_to_lan;' + c)
          square(title: 'Cisco_cisco_layer_2_remote_switch', style_modifiers: s + 'cisco.switches.layer_2_remote_switch;' + c)
          square(title: 'Cisco_cisco_layer_3_switch', style_modifiers: s + 'cisco.switches.layer_3_switch;' + c)
          square(title: 'Cisco_cisco_lightweight_ap', style_modifiers: s + 'cisco.misc.lightweight_ap;' + c)
          square(title: 'Cisco_cisco_localdirector', style_modifiers: s + 'cisco.directors.localdirector;' + c)
          square(title: 'Cisco_cisco_longreach_cpe', style_modifiers: s + 'cisco.misc.longreach_cpe;' + c)
          square(title: 'Cisco_cisco_macintosh', style_modifiers: s + 'cisco.computers_and_peripherals.macintosh;' + c)
          square(title: 'Cisco_cisco_mac_woman', style_modifiers: s + 'cisco.people.mac_woman;' + c)
          square(title: 'Cisco_cisco_man_woman', style_modifiers: s + 'cisco.people.man_woman;' + c)
          square(title: 'Cisco_cisco_mas_gateway', style_modifiers: s + 'cisco.hubs_and_gateways.mas_gateway;' + c)
          square(title: 'Cisco_cisco_mau', style_modifiers: s + 'cisco.misc.mau;' + c)
          square(title: 'Cisco_cisco_mcu', style_modifiers: s + 'cisco.misc.mcu;' + c)
          square(title: 'Cisco_cisco_mdu', style_modifiers: s + 'cisco.buildings.mdu;' + c)
          square(title: 'Cisco_cisco_me_1100', style_modifiers: s + 'cisco.misc.me1100;' + c)
          square(title: 'Cisco_cisco_Mediator', style_modifiers: s + 'cisco.misc.mediator;' + c)
          square(title: 'Cisco_cisco_meetingplace', style_modifiers: s + 'cisco.misc.meetingplace;' + c)
          square(title: 'Cisco_cisco_mesh_ap', style_modifiers: s + 'cisco.misc.mesh_ap;' + c)
          square(title: 'Cisco_cisco_metro_1500', style_modifiers: s + 'cisco.misc.metro_1500;' + c)
          square(title: 'Cisco_cisco_mgx_8000_multiservice_switch', style_modifiers: s + 'cisco.switches.mgx_8000_multiservice_switch;' + c)
          square(title: 'Cisco_cisco_microphone', style_modifiers: s + 'cisco.computers_and_peripherals.microphone;' + c)
          square(title: 'Cisco_cisco_mini_vax', style_modifiers: s + 'cisco.misc.mini_vax;' + c)
          square(title: 'Cisco_cisco_mobile_access_ip_phone', style_modifiers: s + 'cisco.modems_and_phones.mobile_access_ip_phone;' + c)
          square(title: 'Cisco_cisco_mobile_access_router', style_modifiers: s + 'cisco.routers.mobile_access_router;' + c)
          square(title: 'Cisco_cisco_modem', style_modifiers: s + 'cisco.modems_and_phones.modem;' + c)
          square(title: 'Cisco_cisco_moh_server', style_modifiers: s + 'cisco.servers.moh_server;' + c)
          square(title: 'Cisco_cisco_MSE', style_modifiers: s + 'cisco.misc.mse;' + c)
          square(title: 'Cisco_cisco_mulitswitch_device', style_modifiers: s + 'cisco.switches.multiswitch_device;' + c)
          square(title: 'Cisco_cisco_multi_fabric_server_switch', style_modifiers: s + 'cisco.switches.multi-fabric_server_switch;' + c)
          square(title: 'Cisco_cisco_multilayer_remote_switch', style_modifiers: s + 'cisco.switches.multilayer_remote_switch;' + c)
          square(title: 'Cisco_cisco_mux', style_modifiers: s + 'cisco.misc.mux;' + c)
          square(title: 'Cisco_cisco_MXE', style_modifiers: s + 'cisco.misc.mxe;' + c)
          square(title: 'Cisco_cisco_nac_appliance', style_modifiers: s + 'cisco.misc.nac_appliance;' + c)
          square(title: 'Cisco_cisco_NCE', style_modifiers: s + 'cisco.misc.nce;' + c)
          square(title: 'Cisco_cisco_NCE_router', style_modifiers: s + 'cisco.routers.nce_router;' + c)
          square(title: 'Cisco_cisco_netflow_router', style_modifiers: s + 'cisco.routers.netflow_router;' + c)
          square(title: 'Cisco_cisco_netranger', style_modifiers: s + 'cisco.misc.netranger;' + c)
          square(title: 'Cisco_cisco_netsonar', style_modifiers: s + 'cisco.misc.netsonar;' + c)
          square(title: 'Cisco_cisco_network_management', style_modifiers: s + 'cisco.misc.network_management;' + c)
          square(title: 'Cisco_cisco_Nexus_1000', style_modifiers: s + 'cisco.misc.nexus_1000;' + c)
          square(title: 'Cisco_cisco_Nexus_2000', style_modifiers: s + 'cisco.misc.nexus_2000_fabric_extender;' + c)
          square(title: 'Cisco_cisco_Nexus_5000', style_modifiers: s + 'cisco.misc.nexus_5000;' + c)
          square(title: 'Cisco_cisco_Nexus_7000', style_modifiers: s + 'cisco.misc.nexus_7000;' + c)
          square(title: 'Cisco_cisco_octel', style_modifiers: s + 'cisco.misc.octel;' + c)
          square(title: 'Cisco_cisco_ons15500', style_modifiers: s + 'cisco.misc.ons15500;' + c)
          square(title: 'Cisco_cisco_optical_amplifier', style_modifiers: s + 'cisco.misc.optical_amplifier;' + c)
          square(title: 'Cisco_cisco_optical_services_router', style_modifiers: s + 'cisco.routers.optical_services_router;' + c)
          square(title: 'Cisco_cisco_optical_transport', style_modifiers: s + 'cisco.misc.optical_transport;' + c)
          square(title: 'Cisco_cisco_pad', style_modifiers: s + 'cisco.misc.pad_2;' + c)
          square(title: 'Cisco_cisco_pad_x', style_modifiers: s + 'cisco.misc.pad_1;' + c)
          square(title: 'Cisco_cisco_page_icon', style_modifiers: s + 'cisco.misc.page_icon;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897;')
          square(title: 'Cisco_cisco_pbx', style_modifiers: s + 'cisco.misc.pbx;' + c)
          square(title: 'Cisco_cisco_pbx_switch', style_modifiers: s + 'cisco.switches.pbx_switch;' + c)
          square(title: 'Cisco_cisco_pc_adapter_card', style_modifiers: s + 'cisco.computers_and_peripherals.pc_adapter_card;' + c)
          square(title: 'Cisco_cisco_pc_man', style_modifiers: s + 'cisco.people.pc_man;' + c)
          square(title: 'Cisco_cisco_pc_routercard', style_modifiers: s + 'cisco.computers_and_peripherals.pc_routercard;' + c)
          square(title: 'Cisco_cisco_pc_software', style_modifiers: s + 'cisco.misc.pc_software;' + c)
          square(title: 'Cisco_cisco_pc_video', style_modifiers: s + 'cisco.misc.pc_video;' + c)
          square(title: 'Cisco_cisco_phone_fax', style_modifiers: s + 'cisco.modems_and_phones.phone-fax;' + c)
          square(title: 'Cisco_cisco_pix_firewall', style_modifiers: s + 'cisco.security.pix_firewall;' + c)
          square(title: 'Cisco_cisco_pmc', style_modifiers: s + 'cisco.misc.pmc;' + c)
          square(title: 'Cisco_cisco_programmable_switch', style_modifiers: s + 'cisco.switches.programmable_switch;' + c)
          square(title: 'Cisco_cisco_protocol_translator', style_modifiers: s + 'cisco.misc.protocol_translator;' + c)
          square(title: 'Cisco_cisco_pxf', style_modifiers: s + 'cisco.misc.pxf;' + c)
          square(title: 'Cisco_cisco_radio_tower', style_modifiers: s + 'cisco.wireless.radio_tower;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897')
          square(title: 'Cisco_cisco_ratemux', style_modifiers: s + 'cisco.misc.ratemux;' + c)
          square(title: 'Cisco_cisco_repeater', style_modifiers: s + 'cisco.misc.repeater;' + c)
          square(title: 'Cisco_cisco_RF_modem', style_modifiers: s + 'cisco.modems_and_phones.rf_modem;' + c)
          square(title: 'Cisco_cisco_router_firewall', style_modifiers: s + 'cisco.security.router_firewall;' + c)
          square(title: 'Cisco_cisco_routerin_building', style_modifiers: s + 'cisco.routers.router_in_building;' + c)
          square(title: 'Cisco_cisco_router_with_silicon_switch', style_modifiers: s + 'cisco.routers.router_with_silicon_switch;' + c)
          square(title: 'Cisco_cisco_route_switch_processor', style_modifiers: s + 'cisco.misc.route_switch_processor;' + c)
          square(title: 'Cisco_cisco_rpsrps', style_modifiers: s + 'cisco.misc.rpsrps;' + c)
          square(title: 'Cisco_cisco_running_man', style_modifiers: s + 'cisco.people.running_man;' + c)
          square(title: 'Cisco_cisco_sattelite_dish', style_modifiers: s + 'cisco.wireless.satellite_dish;' + c)
          square(title: 'Cisco_cisco_sattelite', style_modifiers: s + 'cisco.wireless.satellite;' + c)
          square(title: 'Cisco_cisco_scanner', style_modifiers: s + 'cisco.computers_and_peripherals.scanner;' + c)
          square(title: 'Cisco_cisco_server_switch', style_modifiers: s + 'cisco.switches.server_switch;' + c)
          square(title: 'Cisco_cisco_server_with_router', style_modifiers: s + 'cisco.servers.server_with_router;' + c)
          square(title: 'Cisco_cisco_service_control', style_modifiers: s + 'cisco.misc.service_control;' + c)
          square(title: 'Cisco_cisco_Service_Module', style_modifiers: s + 'cisco.controllers_and_modules.service_module;' + c)
          square(title: 'Cisco_cisco_Service_router', style_modifiers: s + 'cisco.routers.service_router;' + c)
          square(title: 'Cisco_cisco_Services', style_modifiers: s + 'cisco.misc.services;' + c)
          square(title: 'Cisco_cisco_Set_top_box', style_modifiers: s + 'cisco.misc.set_top_box;' + c)
          square(title: 'Cisco_cisco_simulitlayer_switch', style_modifiers: s + 'cisco.switches.simultilayer_switch;' + c)
          square(title: 'Cisco_cisco_sip_proxy_werver', style_modifiers: s + 'cisco.servers.sip_proxy_server;' + c)
          square(title: 'Cisco_cisco_sitting_woman', style_modifiers: s + 'cisco.people.sitting_woman;' + c)
          square(title: 'Cisco_cisco_small_business', style_modifiers: s + 'cisco.buildings.small_business;' + c)
          square(title: 'Cisco_cisco_small_hub', style_modifiers: s + 'cisco.hubs_and_gateways.small_hub;' + c)
          square(title: 'Cisco_cisco_softphone', style_modifiers: s + 'cisco.modems_and_phones.softphone;' + c)
          square(title: 'Cisco_cisco_softswitch_pgw_mgc', style_modifiers: s + 'cisco.switches.softswitch_pgw_mgc;' + c)
          square(title: 'Cisco_cisco_software_based_server', style_modifiers: s + 'cisco.servers.software_based_server;' + c)
          square(title: 'Cisco_cisco_speaker', style_modifiers: s + 'cisco.computers_and_peripherals.speaker;' + c)
          square(title: 'Cisco_cisco_ssc', style_modifiers: s + 'cisco.misc.ssc;' + c)
          square(title: 'Cisco_cisco_ssl_terminator', style_modifiers: s + 'cisco.misc.ssl_terminator;' + c)
          square(title: 'Cisco_cisco_standard_host', style_modifiers: s + 'cisco.servers.standard_host;' + c)
          square(title: 'Cisco_cisco_stb', style_modifiers: s + 'cisco.misc.stb;' + c)
          square(title: 'Cisco_cisco_storage_router', style_modifiers: s + 'cisco.routers.storage_router;' + c)
          square(title: 'Cisco_cisco_storage_server', style_modifiers: s + 'cisco.servers.storage_server;' + c)
          square(title: 'Cisco_cisco_stp', style_modifiers: s + 'cisco.misc.stp;' + c)
          square(title: 'Cisco_cisco_streamer', style_modifiers: s + 'cisco.misc.streamer;' + c)
          square(title: 'Cisco_cisco_sun_workstation', style_modifiers: s + 'cisco.computers_and_peripherals.workstation;' + c)
          square(title: 'Cisco_cisco_supercomputer', style_modifiers: s + 'cisco.computers_and_peripherals.supercomputer;' + c)
          square(title: 'Cisco_cisco_svx', style_modifiers: s + 'cisco.misc.svx;' + c)
          square(title: 'Cisco_cisco_system_controller', style_modifiers: s + 'cisco.controllers_and_modules.system_controller;' + c)
          square(title: 'Cisco_cisco_tablet', style_modifiers: s + 'cisco.computers_and_peripherals.tablet;' + c)
          square(title: 'Cisco_cisco_tape_array', style_modifiers: s + 'cisco.storage.tape_array;' + c)
          square(title: 'Cisco_cisco_tdm_router', style_modifiers: s + 'cisco.routers.tdm_router;' + c)
          square(title: 'Cisco_cisco_telecommuter_house_pc', style_modifiers: s + 'cisco.buildings.telecommuter_house_pc;' + c)
          square(title: 'Cisco_cisco_telecommuter_house', style_modifiers: s + 'cisco.buildings.telecommuter_house;' + c)
          square(title: 'Cisco_cisco_telecommuter_icon', style_modifiers: s + 'cisco.misc.telecommuter_icon;' + c)
          square(title: 'Cisco_cisco_Telepresence_3200', style_modifiers: s + 'cisco.misc.telepresence;' + c)
          square(title: 'Cisco_cisco_terminal', style_modifiers: s + 'cisco.computers_and_peripherals.terminal;' + c)
          square(title: 'Cisco_cisco_token', style_modifiers: s + 'cisco.misc.token;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897')
          square(title: 'Cisco_cisco_TP_MCU', style_modifiers: s + 'cisco.misc.tp_mcu;' + c)
          square(title: 'Cisco_cisco_transpath', style_modifiers: s + 'cisco.misc.transpath;' + c)
          square(title: 'Cisco_cisco_truck', style_modifiers: s + 'cisco.misc.truck;' + c)
          square(title: 'Cisco_cisco_turret', style_modifiers: s + 'cisco.misc.turret;' + c)
          square(title: 'Cisco_cisco_tv', style_modifiers: s + 'cisco.misc.tv;' + c)
          square(title: 'Cisco_cisco_ubr910', style_modifiers: s + 'cisco.misc.ubr910;' + c)
          square(title: 'Cisco_cisco_umg_series', style_modifiers: s + 'cisco.misc.umg_series;' + c)
          square(title: 'Cisco_cisco_unity_server', style_modifiers: s + 'cisco.servers.unity_server;' + c)
          square(title: 'Cisco_cisco_universal_gateway', style_modifiers: s + 'cisco.hubs_and_gateways.universal_gateway;' + c)
          square(title: 'Cisco_cisco_university', style_modifiers: s + 'cisco.buildings.university;' + c)
          square(title: 'Cisco_cisco_upc', style_modifiers: s + 'cisco.computers_and_peripherals.upc;' + c)
          square(title: 'Cisco_cisco_vault', style_modifiers: s + 'cisco.misc.vault;' + c)
          square(title: 'Cisco_cisco_video_camera', style_modifiers: s + 'cisco.computers_and_peripherals.video_camera;' + c)
          square(title: 'Cisco_cisco_vip', style_modifiers: s + 'cisco.misc.vip;' + c)
          square(title: 'Cisco_cisco_virtual_layer_switch', style_modifiers: s + 'cisco.switches.virtual_layer_switch;' + c)
          square(title: 'Cisco_cisco_virtual_switch_controller__vsc3000_', style_modifiers: s + 'cisco.controllers_and_modules.virtual_switch_controller_(vsc3000);' + c)
          square(title: 'Cisco_cisco_voice_atm_switch', style_modifiers: s + 'cisco.switches.voice_atm_switch;' + c)
          square(title: 'Cisco_cisco_voice_commserver', style_modifiers: s + 'cisco.servers.voice_commserver;' + c)
          square(title: 'Cisco_cisco_voice_router', style_modifiers: s + 'cisco.routers.voice_router;' + c)
          square(title: 'Cisco_cisco_voice_switch', style_modifiers: s + 'cisco.switches.voice_switch;' + c)
          square(title: 'Cisco_cisco_vpn_concentrator', style_modifiers: s + 'cisco.misc.vpn_concentrator;' + c)
          square(title: 'Cisco_cisco_vpn_gateway', style_modifiers: s + 'cisco.hubs_and_gateways.vpn_gateway;' + c)
          square(title: 'Cisco_cisco_VSS', style_modifiers: s + 'cisco.misc.vss;' + c)
          square(title: 'Cisco_cisco_wae', style_modifiers: s + 'cisco.misc.wae;' + c)
          square(title: 'Cisco_cisco_wavelength_router', style_modifiers: s + 'cisco.routers.wavelength_router;' + c)
          square(title: 'Cisco_cisco_web_browser', style_modifiers: s + 'cisco.computers_and_peripherals.web_browser;' + c)
          square(title: 'Cisco_cisco_web_cluster', style_modifiers: s + 'cisco.storage.web_cluster;' + c)
          square(title: 'Cisco_cisco_wi_fi_tag', style_modifiers: s + 'cisco.wireless.wi-fi_tag;' + c)
          square(title: 'Cisco_cisco_wireless_bridge', style_modifiers: s + 'cisco.wireless.wireless_bridge;' + c)
          square(title: 'Cisco_cisco_wireless_location_appliance', style_modifiers: s + 'cisco.wireless.wireless_location_appliance;' + c)
          square(title: 'Cisco_cisco_wireless', style_modifiers: s + 'cisco.wireless.wireless;' + c)
          square(title: 'Cisco_cisco_wireless_transport', style_modifiers: s + 'cisco.wireless.wireless_transport;' + c)
          square(title: 'Cisco_cisco_wism', style_modifiers: s + 'cisco.misc.wism;' + c)
          square(title: 'Cisco_cisco_wlan_controller', style_modifiers: s + 'cisco.wireless.wlan_controller;' + c)
          square(title: 'Cisco_cisco_workgroup_director', style_modifiers: s + 'cisco.directors.workgroup_director;' + c)
          square(title: 'Cisco_cisco_workgroup_switch', style_modifiers: s + 'cisco.switches.workgroup_switch;' + c)
          square(title: 'Cisco_cisco_workstation', style_modifiers: s + 'cisco.computers_and_peripherals.workstation;' + c)
          square(title: 'Cisco_cisco_www_server', style_modifiers: s + 'cisco.servers.www_server;' + c)
        end
        .page('Computers and Monitors', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'NET_PC', style_modifiers: s + 'networks.pc;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Virtual', style_modifiers: s + 'networks.virtual_pc;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Terminal', style_modifiers: s + 'networks.terminal;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_DataPipe', style_modifiers: s + 'networks.bus;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_SlateDevice', style_modifiers: s + 'networks.tablet;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_TabletDevice', style_modifiers: s + 'networks.tablet;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Laptop', style_modifiers: s + 'networks.laptop;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_PDA', style_modifiers: s + 'networks.mobile;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_CRTMonitor', style_modifiers: s + 'networks.monitor;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_LCDMonitor', style_modifiers: s + 'networks.monitor;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
        end
        .page('Detailed Network Diagrams', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'NET_RadioTower', style_modifiers: s + 'networks.radio_tower;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_ExternalHardDrive', style_modifiers: s + 'networks.external_storage;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_SatelliteDish', style_modifiers: s + 'networks.satellite_dish;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Satellite', style_modifiers: s + 'networks.satellite;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
        end
        .page('Basic Network Shapes', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'NET_WirelessAccessPoint', style_modifiers: s + 'networks.radio_tower;fillColor=#29AAE1;strokeColor=#29AAE1;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_RingNetwork', style_modifiers: cs)
          square(title: 'NET_Ethernet', style_modifiers: cs)
          square(title: 'NET_Server', style_modifiers: s + 'networks.server;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Mainframe', style_modifiers: s + 'networks.mainframe;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Router', style_modifiers: s + 'networks.wireless_hub;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Switch', style_modifiers: s + 'networks.switch;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Firewall', style_modifiers: s + 'networks.firewall;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_User', style_modifiers: s + 'networks.user_male;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_CommLink', style_modifiers: s + 'networks.comm_link_edge;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_SuperComputer', style_modifiers: s + 'networks.supercomputer;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_VirtualServer', style_modifiers: s + 'networks.virtual_server;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Printer', style_modifiers: s + 'networks.printer;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Scanner', style_modifiers: s + 'networks.scanner;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Copier', style_modifiers: s + 'networks.copier;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_MultiFunctionMachine', style_modifiers: s + 'networks.copier;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Projector', style_modifiers: s + 'networks.video_projector;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_ProjectorScreen', style_modifiers: s + 'networks.video_projector_screen;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Bridge', style_modifiers: s + 'networks.router;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Hub', style_modifiers: s + 'networks.hub;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Modem', style_modifiers: s + 'networks.modem;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Telephone', style_modifiers: s + 'signs.tech.telephone_5;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_CellPhone', style_modifiers: s + 'networks.mobile;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_SmartPhone', style_modifiers: s + 'networks.mobile;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
          square(title: 'NET_Camera', style_modifiers: s + 'signs.tech.camera_2;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;')
        end
        .page('NET_ExternalMediaDrive', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'RackServerRack', style_modifiers: s + 'rackGeneral.container;childLayout=rack;marginLeft=9;marginRight=9;marginTop=21;marginBottom=22;textColor=#000000;numDisp=off' + containerStyle)
          square(title: 'RackBlank', style_modifiers: s + 'rackGeneral.plate;strokeColor=#666666;labelPosition=left;align=right;spacingRight=15;fillColor=#e8e8e8')
          square(title: 'RackRaidArray', style_modifiers: s + 'rack.cisco.cisco_carrier_packet_transport_50;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackServer', style_modifiers: s + 'rack.oracle.sunfire_x4100;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackEthernetSwitch', style_modifiers: s + 'rack.cisco.cisco_nexus_3016_switch;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackPatchPanel', style_modifiers: s + 'rack.general.cat5e_rack_mount_patch_panel_24_ports;strokeColor=#666666;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackRouter', style_modifiers: s + 'rack.cisco.cisco_asr_1001_router;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackMonitor', style_modifiers: s + 'rack.ibm.ibm_1u_flat_panel_console_kit;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackKeyboard', style_modifiers: s + 'rack.cisco.cisco_1905_serial_integrated_services_router;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackPowerStrip', style_modifiers: s + 'rack.dell.power_strip;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackPowerSupply', style_modifiers: s + 'rack.cisco.cisco_web_security_appliance_s170;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackBridge', style_modifiers: s + 'rack.cisco.cisco_nexus_5548p_switch;labelPosition=left;align=right;spacingRight=15')
          square(title: 'RackTapeDrive', style_modifiers: s + 'rack.ibm.ibm_1754_local_console_manager;labelPosition=left;align=right;spacingRight=15')
        end
        .page('Network', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'Image_network_server', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_Tower_128x128.png;flipH=1')
          square(title: 'Image_network_server_file', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_128x128.png')
          square(title: 'Image_network_server_net', style_modifiers: 'image;image=img/lib/clip_art/networking/Print_Server_128x128.png')
          square(title: 'Image_network_server_net_large', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_128x128.png')
          square(title: 'Image_network_raid', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_Tower_128x128.png;flipH=1')
          square(title: 'Image_network_raid_large', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_Tower_128x128.png;flipH=1')
          square(title: 'Image_network_rack_server', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_Rack_128x128.png')
          square(title: 'Image_network_rack_tape', style_modifiers: 'image;image=img/lib/clip_art/computers/Server_Rack_Partial_128x128.png')
          square(title: 'Image_network_printer_small', style_modifiers: 'image;image=img/lib/clip_art/computers/Printer_128x128.png;flipH=1')
          square(title: 'Image_network_printer_large', style_modifiers: 'image;image=img/lib/clip_art/computers/Printer_128x128.png;flipH=1')
          square(title: 'Image_network_printer_multipurpose', style_modifiers: 'image;image=img/lib/clip_art/computers/Printer_Commercial_128x128.png;flipH=1')
          square(title: 'Image_network_copier_small', style_modifiers: 'image;image=img/lib/clip_art/computers/Printer_Commercial_128x128.png')
          square(title: 'Image_network_copier_large', style_modifiers: 'image;image=img/lib/clip_art/computers/Printer_Commercial_128x128.png')
          square(title: 'Image_network_router', style_modifiers: 'image;image=img/lib/clip_art/networking/Router_128x128.png')
          square(title: 'Image_network_router_wireless', style_modifiers: 'image;image=img/lib/clip_art/networking/Wireless_Router_128x128.png')
          square(title: 'Image_network_ups', style_modifiers: 'image;image=img/lib/clip_art/networking/UPS_128x128.png')
        end
        .page('Electronics', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'Image_electronics_lcd', style_modifiers: 'image;image=img/lib/clip_art/computers/Monitor_128x128.png')
          square(title: 'Image_electronics_pda', style_modifiers: 'image;image=img/lib/clip_art/telecommunication/Palm_Treo_128x128.png')
          square(title: 'Image_electronics_drive_cardreader', style_modifiers: 'image;image=img/lib/clip_art/finance/Credit_Card_128x128.png')
          square(title: 'Image_electronics_camcorder', style_modifiers: 'image;image=img/lib/clip_art/networking/Ip_Camera_128x128.png')
          square(title: 'Image_electronics_printer_photo', style_modifiers: 'image;image=img/lib/clip_art/computers/Printer_128x128.png;flipH=1')
          square(title: 'Image_electronics_drive_firewire', style_modifiers: 'image;image=img/lib/clip_art/computers/Harddrive_128x128.png;flipH=1')
          square(title: 'Image_electronics_drive_usb', style_modifiers: 'image;image=img/lib/clip_art/computers/Harddrive_128x128.png;flipH=1')
          square(title: 'Image_electronics_modem_external', style_modifiers: 'image;image=img/lib/clip_art/networking/Modem_128x128.png;flipH=1')
          square(title: 'Image_electronics_lcd_wide', style_modifiers: 'image;image=img/lib/clip_art/computers/Monitor_128x128.png')
        end
        .page('Audio Equipment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EE_Amplifier', style_modifiers: s + 'electrical.abstract.amplifier')
          square(title: 'EE_OpAmp', style_modifiers: cs)
          square(title: 'EE_ControlledAmp', style_modifiers: s + 'electrical.abstract.controlled_amplifier')
          square(title: 'EE_Multiplexer', style_modifiers: 'shape=mxgraph.electrical.abstract.mux2')
          square(title: 'EE_Demultiplexer', style_modifiers: 'shape=mxgraph.electrical.abstract.mux2;operation=demux')
          square(title: 'EE_Capacitor1', style_modifiers: s + 'electrical.capacitors.capacitor_1')
          square(title: 'EE_Capacitor2', style_modifiers: s + 'electrical.capacitors.capacitor_3')
          square(title: 'EE_Diode', style_modifiers: s + 'electrical.diodes.diode')
          square(title: 'EE_Resistor', style_modifiers: s + 'electrical.resistors.resistor_2')
          square(title: 'EE_VarResistor', style_modifiers: s + 'electrical.resistors.variable_resistor_2')
          square(title: 'EE_Potentiometer', style_modifiers: s + 'electrical.resistors.potentiometer_2')
          square(title: 'EE_ProtGround', style_modifiers: s + 'electrical.signal_sources.protective_earth')
          square(title: 'EE_SignalGround', style_modifiers: s + 'electrical.signal_sources.signal_ground')
          square(title: 'EE_Transformer', style_modifiers: s + 'electrical.inductors.transformer_1')
          square(title: 'EE_Inductor', style_modifiers: s + 'electrical.inductors.inductor_3')
          square(title: 'EE_Variable', style_modifiers: s + 'electrical.inductors.variable_inductor')
          square(title: 'EE_TwoWaySwitch', style_modifiers: s + 'electrical.electro-mechanical.2-way_switch')
          square(title: 'EE_OnOffSwitch', style_modifiers: s + 'electrical.electro-mechanical.simple_switch')
          square(title: 'EE_Loudspeaker', style_modifiers: s + 'electrical.electro-mechanical.loudspeaker')
          square(title: 'EE_Motor', style_modifiers: s + 'electrical.electro-mechanical.motor_1')
          square(title: 'EE_LED1', style_modifiers: s + 'electrical.opto_electronics.led_2')
          square(title: 'EE_Lightbulb', style_modifiers: s + 'electrical.miscellaneous.light_bulb')
          square(title: 'EE_IntegratedCircuit', style_modifiers: 'shape=mxgraph.electrical.logic_gates.dual_inline_ic')
        end
        .page('Power Sources', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EE_AcSource', style_modifiers: s + 'electrical.signal_sources.ac_source;strokeWidth=1;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;')
          square(title: 'EE_VoltageSource', style_modifiers: s + 'electrical.signal_sources.dc_source_3;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;')
          square(title: 'EE_CurrentSource', style_modifiers: s + 'electrical.signal_sources.dc_source_2;direction=north;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;')
          square(title: 'EE_ControlledCurrentSource', style_modifiers: s + 'electrical.signal_sources.dependent_source_2;direction=west;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;')
          square(title: 'EE_ControlledVoltageSource', style_modifiers: s + 'electrical.signal_sources.dependent_source_3;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;')
          square(title: 'EE_DcSource1', style_modifiers: s + 'electrical.miscellaneous.monocell_battery;flipH=1;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EE_DcSource2', style_modifiers: s + 'electrical.miscellaneous.multicell_battery;flipH=1;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EE_Vss', style_modifiers: s + 'electrical.signal_sources.vss2;verticalLabelPosition=top;verticalAlign=bottom;fontSize=24')
          square(title: 'EE_Vdd', style_modifiers: s + 'electrical.signal_sources.vdd;verticalLabelPosition=bottom;verticalAlign=top')
        end
        .page('Transistors', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EE_BJT_NPN1', style_modifiers: s + 'electrical.transistors.pnp_transistor_1')
          square(title: 'EE_BJT_NPN1_V2', style_modifiers: s + 'electrical.transistors.npn_transistor_1;')
          square(title: 'EE_BJT_PNP1', style_modifiers: s + 'electrical.transistors.npn_transistor_1')
          square(title: 'EE_BJT_PNP1_V2', style_modifiers: s + 'electrical.transistors.pnp_transistor_1')
          square(title: 'EE_JFET_P', style_modifiers: s + 'electrical.transistors.p-channel_jfet_1;flipV=1')
          square(title: 'EE_JFET_P_V2', style_modifiers: s + 'electrical.transistors.p-channel_jfet_1;flipV=1')
          square(title: 'EE_JFET_N', style_modifiers: s + 'electrical.transistors.n-channel_jfet_1')
          square(title: 'EE_JFET_N_V2', style_modifiers: s + 'electrical.transistors.n-channel_jfet_1')
          square(title: 'EE_MOSFET_P1', style_modifiers: s + 'electrical.mosfets1.mosfet_ic_p;flipV=1')
          square(title: 'EE_MOSFET_P1_V2', style_modifiers: s + 'electrical.mosfets1.mosfet_ic_p;flipV=1')
          square(title: 'EE_MOSFET_P2', style_modifiers: s + 'electrical.mosfets1.mosfet_p_no_bulk')
          square(title: 'EE_MOSFET_P2_V2', style_modifiers: s + 'electrical.mosfets1.mosfet_p_no_bulk')
          square(title: 'EE_MOSFET_P3', style_modifiers: s + 'electrical.mosfets1.p-channel_mosfet_1;flipV=1')
          square(title: 'EE_MOSFET_P3_V2', style_modifiers: s + 'electrical.mosfets1.p-channel_mosfet_1;flipV=1')
          square(title: 'EE_MOSFET_N1', style_modifiers: s + 'electrical.mosfets1.mosfet_ic_n')
          square(title: 'EE_MOSFET_N1_V2', style_modifiers: s + 'electrical.mosfets1.mosfet_ic_n')
          square(title: 'EE_MOSFET_N2', style_modifiers: s + 'electrical.mosfets1.mosfet_n_no_bulk')
          square(title: 'EE_MOSFET_N2_V2', style_modifiers: s + 'electrical.mosfets1.mosfet_n_no_bulk')
          square(title: 'EE_MOSFET_N3', style_modifiers: s + 'electrical.mosfets1.n-channel_mosfet_1')
          square(title: 'EE_MOSFET_N3_V2', style_modifiers: s + 'electrical.mosfets1.n-channel_mosfet_1')
        end
        .page('Relays', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EE_AND', style_modifiers: s + 'electrical.logic_gates.and')
          square(title: 'EE_OR', style_modifiers: s + 'electrical.logic_gates.or')
          square(title: 'EE_Inverter', style_modifiers: s + 'electrical.logic_gates.inverter')
          square(title: 'EE_NAND', style_modifiers: s + 'electrical.logic_gates.nand')
          square(title: 'EE_NOR', style_modifiers: s + 'electrical.logic_gates.nor')
          square(title: 'EE_XOR', style_modifiers: s + 'electrical.logic_gates.xor')
          square(title: 'EE_NXOR', style_modifiers: s + 'electrical.logic_gates.xnor')
          square(title: 'EE_DTypeRSFlipFlop', style_modifiers: s + 'electrical.logic_gates.d_type_rs_flip-flop')
          square(title: 'EE_DTypeFlipFlop', style_modifiers: s + 'electrical.logic_gates.d_type_flip-flop')
          square(title: 'EE_DTypeFlipFlopWithClear', style_modifiers: s + 'electrical.logic_gates.d_type_flip-flop_with_clear')
          square(title: 'EE_RSLatch', style_modifiers: s + 'electrical.logic_gates.rs_latch')
          square(title: 'EE_SyncRSLatch', style_modifiers: s + 'electrical.logic_gates.synchronous_rs_latch')
          square(title: 'EE_TTypeFlipFlop', style_modifiers: s + 'electrical.logic_gates.t_type_flip-flop')
        end
        .page('Miscellaneous', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EE_Plus', style_modifiers: s + 'ios7.misc.flagged')
          square(title: 'EE_Negative', style_modifiers: 'shape=line')
          square(title: 'EE_InverterContact', style_modifiers: 'ellipse')
          square(title: 'EE_Voltmeter', style_modifiers: s + 'electrical.instruments.voltmeter')
          square(title: 'EE_Ammeter', style_modifiers: s + 'electrical.instruments.ampermeter')
          square(title: 'EE_SineWave', style_modifiers: s + 'electrical.waveforms.sine_wave')
          square(title: 'EE_Sawtooth', style_modifiers: s + 'electrical.waveforms.sawtooth')
          square(title: 'EE_SquareWave', style_modifiers: s + 'electrical.waveforms.square_wave')
          
        end
        .page('Messaging Systems', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EIChannelBlock', style_modifiers: s + 'eip.messageChannel;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIMessageChannelBlock', style_modifiers: cs)
          square(title: 'EIMessageBlock', style_modifiers: cs)
          square(title: 'EIMessageRouterBlock', style_modifiers: s + 'eip.content_based_router;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIMessageTranslatorBlock', style_modifiers: s + 'eip.message_translator;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIMessageEndpointBlock', style_modifiers: cs)
        end
        .page('Messaging Channels', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EIPublishSubscribeChannelBlock', style_modifiers: cs)
          square(title: 'EIDatatypeChannelBlock', style_modifiers: cs)
          square(title: 'EIInvalidMessageChannelBlock', style_modifiers: cs)
          square(title: 'EIDeadLetterChannelBlock', style_modifiers: cs)
          square(title: 'EIGuaranteedDeliveryBlock', style_modifiers: cs)
          square(title: 'EIChannelAdapterBlock', style_modifiers: cs)
          square(title: 'EIMessagingBridgeBlock', style_modifiers: s + 'eip.messaging_bridge;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIMessageBusBlock', style_modifiers: cs)
        end
        .page('Message Construction', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Message Routing', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)

          square(title: 'EIContentBasedRouterBlock', style_modifiers: s + 'eip.content_based_router;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIMessageFilterBlock', style_modifiers: s + 'eip.message_filter;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIDynamicRouterBlock', style_modifiers: s + 'eip.dynamic_router;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIRecipientListBlock', style_modifiers: s + 'eip.recipient_list;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EISplitterBlock', style_modifiers: s + 'eip.splitter;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIAggregatorBlock', style_modifiers: s + 'eip.aggregator;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIResequencerBlock', style_modifiers: s + 'eip.resequencer;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIComposedMessageBlock', style_modifiers: s + 'eip.composed_message_processor;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIRoutingSlipBlock', style_modifiers: s + 'eip.routing_slip;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIProcessManagerBlock', style_modifiers: s + 'eip.process_manager;verticalLabelPosition=bottom;verticalAlign=top')
          square(title: 'EIMessageBrokerBlock', style_modifiers: cs)
        end
        .page('Message Transformation', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Messaging Endpoints', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('System Management', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Google Cloud Platform', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Kubernetes Icons', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Equation', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Walls', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Rooms', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Doors & Windows', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Stairs   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpStairsCurved', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpStairsCurvedWide', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Desks', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDeskEndSegment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDeskSmallCornerSegment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDeskMediumCornerSegment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDeskRoundedLSegment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDeskRoundedCornerSegment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Cubicle walls', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Tables & Chairs', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Cubicles - Prebuilt', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Tables - Prebuilt', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Cabinets - we dont have corresponding stencils, just rounded rectangles   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpCabinetCornerLarge', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Restroom', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpRestroomBidet', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpRestroomGrabBar', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpRestroomCornerSink', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDresserOrnateMirror', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpRestroomToiletPaper', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Beds', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpBedBunkL', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpBedCrib', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Dressers', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDresserChest', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDresserMirrorDresser', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpClosetRod', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpDresserOrnateMirror', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Appliances', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpApplianceRefrigerator', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Kitchen', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Couches', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpCouchSectional', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpCouchPillow', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Technology', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpMiscProjector', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpMiscProjectorScreen', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Misc Floorplan', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('fpMiscPodium', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Equipment', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PECentrifugalCompressor3', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEOverheadConveyorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEScraperConveyorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEScrewConveyorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEPositiveDisplacementBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEPositiveDisplacement2', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEElevator2Block', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEHoistBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PESkipHoistBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEMotorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEDieselMotorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEElectricMotorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PELiquidRingVacuumBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PETurbineDriverBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEDoubleFlowTurbineBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PECentrifugalBlower', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEAlkylationBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEBoomLoaderBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEFluidCatalyticCrackingBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEFluidCookingBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEFluidizedReactorBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PETubularBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEReformerBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEHydrodesulferizationBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEHydrocrackingBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEAutomaticStokerBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEOilBurnerBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PECounterflowForcedDraftBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PECounterflowNaturalDraftBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PECrossflowInductedBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEChimneyTowerBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Piping', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PESonicSignal', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEPneumatic', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEHydraulicSignalLine', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PESeparator', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEBurstingDisc', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEFlameArrester2', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEDrainSilencer', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PETriangleSeparator2', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PESiphonDrain', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Vessels', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('not all versions supported', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEInternalFloatingRoof', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEDoubleWallTank', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEOnionTank', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Heat Exchangers', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEEvaporativeCondenserBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEAirCooledExchangerBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Pumps', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PETripleFanBlades2Block', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Instruments', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEIndicator5Block', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Valves', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEButterflyValveBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEFourWayValveBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEGaugeBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('PEOrificeBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Venn Gradient', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Venn Plain', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS Devices', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iPhone Elements', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7NavBariPhone', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iPad Elements', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7SplitView', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7iPadPopover', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Common Elements', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS Icons', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7IconUnlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7IconCloud-lock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7IconNotification', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7IconArtists', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7IconPlaylist', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7IconShuffle', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS Activity', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityAdd bookmark', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityAdd to home screen', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityAdd to reading list', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityAirplay', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityAssign to contact', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityCopy', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityPrint', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivitySlideshow', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS7ActivityUse as wallpaper', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('UI Containers', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('UI Widgets', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('UI2CalendarBlock', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Image_ui_formatting_toolbar2', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('UI Input', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('UI Menus', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('UI Misc', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS 6 iPad Elements', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS 6 iPad Controls', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS 6 iPad Icons', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS 6 iPhone Elements', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS 6 iPhone Controls', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('iOS 6 iPhone Icons', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Analytics', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Application Services   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Artificial Intelligence   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Business Productivity   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Compute   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Contact Center   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Containers   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Database   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Desktop App Straining   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Developer Tools   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Game Development   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - General   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - IoT   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Management   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Messaging   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Migration   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Mobile Services   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Networking & Content Delivery   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - On-Demand Workforce   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - SDKs   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Security Identity and Compliance', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 17 - Storage   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 Analytics   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Application Integration   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - AR & VR   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Blockchain    ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Business Applications    ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Compute   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Cost Management  ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Customer Engagement   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Database   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Desktop App Streaming   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Developer Tools   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - EC2 Instance Types', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Game Tech   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - General   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Groups (Note: repeated below without _v2)', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Internet of Things   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Machine Learning   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Management & Governance   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Media Services   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Migration & Transfer   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Mobile   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Networking & Content Delivery   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Robotics  ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Satellite   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Security, Identity & Compliance   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('AWS 19 - Storage', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('GCP - Service Cards   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('GCP - Device Cards   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Site Map ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('SVG shapes', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Special cases', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Timeline', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Freehand   ', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('ExtShapes', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Infographics', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
        .page('Other', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)


        end
       .page('Standard', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
          square(title: 'DefaultTextBlockNew', style_modifiers: 'strokeColor=none;fillColor=none')
          square(title: 'DefaultTextBlock', style_modifiers: 'strokeColor=none;fillColor=none')
          square(title: 'DefaultSquareBlock', style_modifiers: '')
          square(title: 'RectangleBlock', style_modifiers: '')
          square(title: 'DefaultNoteBlock', style_modifiers: 'shape=note;size=15')
          square(title: 'DefaultNoteBlockV2', style_modifiers: 'shape=note;size=15')
          square(title: 'HotspotBlock', style_modifiers: 'strokeColor=none;fillColor=none')
          square(title: 'ImageSearchBlock2', style_modifiers: 'shape=image')
          square(title: 'UserImage2Block', style_modifiers: 'shape=image')
          square(title: 'ExtShapeBoxBlock', style_modifiers: '')
          square(title: 'DefaultStickyNoteBlock', style_modifiers: 'shadow=1')
        end
        .page('Grid Layout Horizontal', active: f, margin_top: 0, margin_left: 0) do
          grid_layout(wrap_at: 5, v_align: :bottom, h_align: :right)
    
          square(title: '01')
          circle(title: '02')
          rectangle(title: '03')
          ellipse(title: '04')
          process(title: '05')
          diamond(title: '06')
          hexagon(title: '07')
          cloud(title: '08')
          note(title: '09')
          callout(title: '10')
        end
    end

    fit do
      json = JSON.pretty_generate(director.builder.diagram.to_h)
      build = DrawioDsl::XmlBuilder.new(director.builder.diagram).build
      File.write('spec/.samples/drawio/sample.json', json)
      File.write('spec/.samples/drawio/sample.xml', build)
      File.write('spec/.samples/drawio/sample.drawio', build)
    end
  end
end
