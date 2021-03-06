# frozen_string_literal: true

module DrawioDsl
  # :nocov:
  # 1000's of extension shapes derived from Extensions.js that can be used via the add_shape method
  class DrawioExtensions
    include DrawioDsl::DrawioExtensionsActive

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

    def build_extensions
      configure_extensions
      apply_active_flags
    end

    # This methods was generated using Extensions.js
    # This generation can be improved over time and the code to do the generation
    # can be found in the .builders/generators/10-transform-drawio-js.rb.
    # original source: ~/dev/tools/drawio-desktop/drawio/src/main/webapp/js/diagramly/Extensions.js
    def configure_extensions
      # Constants
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
      ssAzure = 'verticalLabelPosition=bottom;verticalAlign=top;' + ss
      cs = 'mxCompositeShape'
      azur19 = 'aspect=fixed;html=1;points=[];align=center;verticalAlign=top;image;image=img/lib/mscae/'
      gcpIcon = 'html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;shape=mxgraph.gcp2.'
      kupIcon = 'html=1;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;shape=mxgraph.kubernetes.icon;prIcon='

      section :standard do
        shape :default_text_block_new                                      , 'strokeColor=none;fillColor=none', 'DefaultTextBlockNew'
        shape :default_text_block                                          , 'strokeColor=none;fillColor=none', 'DefaultTextBlock'
        shape :default_square_block                                        , '', 'DefaultSquareBlock'
        shape :rectangle_block                                             , '', 'RectangleBlock'
        shape :default_note_block                                          , 'shape=note;size=15', 'DefaultNoteBlock'
        shape :default_note_block_v2                                       , 'shape=note;size=15', 'DefaultNoteBlockV2'
        shape :hotspot_block                                               , 'strokeColor=none;fillColor=none', 'HotspotBlock'
        shape :image_search_block2                                         , 'shape=image', 'ImageSearchBlock2'
        shape :user_image2block                                            , 'shape=image', 'UserImage2Block'
        shape :ext_shape_box_block                                         , '', 'ExtShapeBoxBlock'
        shape :default_sticky_note_block                                   , 'shadow=1', 'DefaultStickyNoteBlock'
      end
      section :flowchart do
        shape :process_block                                               , '', 'ProcessBlock'
        shape :decision_block                                              , 'rhombus', 'DecisionBlock'
        shape :terminator_block                                            , 'rounded=1;arcSize=50', 'TerminatorBlock'
        shape :predefined_process_block                                    , 'shape=process', 'PredefinedProcessBlock'
        shape :document_block                                              , 'shape=document;boundedLbl=1', 'DocumentBlock'
        shape :multi_document_block                                        , "#{s}flowchart.multi-document", 'MultiDocumentBlock'
        shape :manual_input_block                                          , 'shape=manualInput;size=15', 'ManualInputBlock'
        shape :preparation_block                                           , 'shape=hexagon;perimeter=hexagonPerimeter2', 'PreparationBlock'
        shape :data_block                                                  , 'shape=parallelogram;perimeter=parallelogramPerimeter;anchorPointDirection=0', 'DataBlock'
        shape :data_block_new                                              , 'shape=parallelogram;perimeter=parallelogramPerimeter;anchorPointDirection=0', 'DataBlockNew'
        shape :database_block                                              , 'shape=cylinder3;size=4;anchorPointDirection=0;boundedLbl=1;', 'DatabaseBlock'
        shape :direct_access_storage_block                                 , 'shape=cylinder3;direction=south;size=10;anchorPointDirection=0;boundedLbl=1;', 'DirectAccessStorageBlock'
        shape :internal_storage_block                                      , cs.to_s, 'InternalStorageBlock'
        shape :paper_tape_block                                            , 'shape=tape;size=0.2', 'PaperTapeBlock'
        shape :manual_operation_block_new                                  , 'shape=trapezoid;perimeter=trapezoidPerimeter;anchorPointDirection=0;flipV=1', 'ManualOperationBlockNew'
        shape :delay_block                                                 , 'shape=delay', 'DelayBlock'
        shape :stored_data_block                                           , 'shape=cylinder3;boundedLbl=1;size=15;lid=0;direction=south;', 'StoredDataBlock'
        shape :merge_block                                                 , 'triangle;direction=south;anchorPointDirection=0', 'MergeBlock'
        shape :connector_block                                             , 'ellipse', 'ConnectorBlock'
        shape :or_block                                                    , "#{s}flowchart.summing_function", 'OrBlock'
        shape :summing_junction_block                                      , "#{s}flowchart.or", 'SummingJunctionBlock'
        shape :display_block                                               , 'shape=display', 'DisplayBlock'
        shape :off_page_link_block                                         , 'shape=offPageConnector', 'OffPageLinkBlock'
        shape :brace_note_block                                            , cs.to_s, 'BraceNoteBlock'
        shape :note_block                                                  , cs.to_s, 'NoteBlock'
      end
      section :containers do
        shape :advanced_swim_lane_block                                    , cs.to_s, 'AdvancedSwimLaneBlock'
        shape :advanced_swim_lane_block_rotated                            , cs.to_s, 'AdvancedSwimLaneBlockRotated'
        shape :rectangle_container_block                                   , 'containerStyle', 'RectangleContainerBlock'
        shape :diamond_container_block                                     , "shape=rhombus;#{containerStyle}", 'DiamondContainerBlock'
        shape :rounded_rectangle_container_block                           , "rounded=1;absoluteArcSize=1;arcSize=24;#{containerStyle}", 'RoundedRectangleContainerBlock'
        shape :circle_container_block                                      , "ellipse;#{containerStyle}", 'CircleContainerBlock'
        shape :pill_container_block                                        , "shape=mxgraph.flowchart.terminator;#{containerStyle}", 'PillContainerBlock'
        shape :brace_block                                                 , cs.to_s, 'BraceBlock'
        shape :bracket_block                                               , cs.to_s, 'BracketBlock'
        shape :brace_block_rotated                                         , cs.to_s, 'BraceBlockRotated'
        shape :bracket_block_rotated                                       , cs.to_s, 'BracketBlockRotated'
      end
      section :geometric_shapes do
        shape :isosceles_triangle_block                                    , 'shape=mxgraph.basic.acute_triangle;dx=0.5;anchorPointDirection=0', 'IsoscelesTriangleBlock'
        shape :right_triangle_block                                        , "#{s}basic.orthogonal_triangle", 'RightTriangleBlock'
        shape :pentagon_block                                              , "#{s}basic.pentagon", 'PentagonBlock'
        shape :hexagon_block                                               , 'shape=hexagon;perimeter=hexagonPerimeter2', 'HexagonBlock'
        shape :octagon_block                                               , "#{s}basic.octagon2;dx=15;", 'OctagonBlock'
        shape :cross_block                                                 , 'shape=cross;size=0.6', 'CrossBlock'
        shape :cloud_block                                                 , 'ellipse;shape=cloud', 'CloudBlock'
        shape :heart_block                                                 , "#{s}basic.heart", 'HeartBlock'
        shape :right_arrow_block                                           , cs.to_s, 'RightArrowBlock'
        shape :double_arrow_block                                          , cs.to_s, 'DoubleArrowBlock'
        shape :callout_block                                               , "#{s}basic.rectangular_callout", 'CalloutBlock'
        shape :callout_square_block                                        , cs.to_s, 'CalloutSquareBlock'
        shape :shape_circle_block                                          , 'ellipse', 'ShapeCircleBlock'
        shape :shape_poly_star_block                                       , "#{s}basic.star", 'ShapePolyStarBlock'
        shape :shape_diamond_block                                         , 'rhombus', 'ShapeDiamondBlock'
      end
      section :misc do
        shape :ui2hotspot_block                                            , 'opacity=50;strokeColor=none', 'UI2HotspotBlock'
      end
      section :android_devices do
        shape :android_device                                              , cs.to_s, 'AndroidDevice'
      end
      section :android_dialogs do
        shape :android_alert_dialog                                        , cs.to_s, 'AndroidAlertDialog'
        shape :android_date_dialog                                         , cs.to_s, 'AndroidDateDialog'
        shape :android_time_dialog                                         , cs.to_s, 'AndroidTimeDialog'
      end
      section :android_blocks do
        shape :android_list_items                                          , cs.to_s, 'AndroidListItems'
        shape :android_tabs                                                , cs.to_s, 'AndroidTabs'
        shape :android_progress_bar                                        , cs.to_s, 'AndroidProgressBar'
        shape :android_image_block                                         , cs.to_s, 'AndroidImageBlock'
        shape :android_text_block                                          , cs.to_s, 'AndroidTextBlock'
        shape :android_action_bar                                          , cs.to_s, 'AndroidActionBar'
      end
      section :android_inputs do
        shape :android_button                                              , cs.to_s, 'AndroidButton'
        shape :android_text_box                                            , cs.to_s, 'AndroidTextBox'
        shape :android_radio_button                                        , cs.to_s, 'AndroidRadioButton'
        shape :android_check_box                                           , cs.to_s, 'AndroidCheckBox'
        shape :android_toggle                                              , cs.to_s, 'AndroidToggle'
        shape :android_slider                                              , cs.to_s, 'AndroidSlider'
        shape :android_icon_check                                          , "#{s}ios7.misc.check", 'AndroidIconCheck'
        shape :android_icon_cancel                                         , "#{s}atlassian.x", 'AndroidIconCancel'
        shape :android_icon_collapse                                       , "#{s}ios7.misc.up", 'AndroidIconCollapse'
        shape :android_icon_expand                                         , "#{s}ios7.misc.down", 'AndroidIconExpand'
        shape :android_icon_next                                           , "#{s}ios7.misc.right", 'AndroidIconNext'
        shape :android_icon_previous                                       , "#{s}ios7.misc.left", 'AndroidIconPrevious'
        shape :android_icon_refresh                                        , '+ ios7.icons.repeat', 'AndroidIconRefresh'
        shape :android_icon_information                                    , "#{s}ios7.icons.info", 'AndroidIconInformation'
        shape :android_icon_search                                         , "#{s}ios7.icons.looking_glass", 'AndroidIconSearch'
        shape :android_icon_settings                                       , "#{s}ios7.icons.volume;direction=south", 'AndroidIconSettings'
        shape :android_icon_trash                                          , "#{s}ios7.icons.trashcan", 'AndroidIconTrash'
        shape :android_icon_email                                          , "#{s}mockup.misc.mail2", 'AndroidIconEmail'
        shape :android_icon_new                                            , "#{s}ios7.misc.flagged", 'AndroidIconNew'
      end
      section :i_os_mockups do
        shape :i_osdevicei_phone_se                                        , "#{s}ios7.misc.iphone", 'iOSDeviceiPhoneSE'
        shape :i_osdevicei_phone6s                                         , "#{s}ios7.misc.iphone", 'iOSDeviceiPhone6s'
        shape :i_osdevicei_phone6s_plus                                    , "#{s}ios7.misc.iphone", 'iOSDeviceiPhone6sPlus'
        shape :i_osdevicei_pad_portrait                                    , "#{s}ios7.misc.ipad7inch", 'iOSDeviceiPadPortrait'
        shape :i_osdevicei_pad_landscape                                   , "#{s}ios7.misc.ipad7inch", 'iOSDeviceiPadLandscape'
        shape :i_osdevicei_pad_pro_portrait                                , "#{s}ios7.misc.ipad7inch", 'iOSDeviceiPadProPortrait'
        shape :i_osdevicei_pad_pro_landscape                               , "#{s}ios7.misc.ipad10inch", 'iOSDeviceiPadProLandscape'
      end
      section :i_os_ui_components do
        shape :i_osbutton                                                  , 'fillColor=none;strokeColor=none;', 'iOSButton'
        shape :i_ossegmented_control                                       , cs.to_s, 'iOSSegmentedControl'
        shape :i_osstepper                                                 , "#{s}ios7.misc.adjust", 'iOSStepper'
        shape :i_ostoggle                                                  , "#{s}ios7ui.onOffButton;buttonState=on;strokeColor2=#aaaaaa;fillColor2=#ffffff", 'iOSToggle'
        shape :i_osslider                                                  , cs.to_s, 'iOSSlider'
        shape :i_osprogress_bar                                            , cs.to_s, 'iOSProgressBar'
        shape :i_ospage_controls                                           , cs.to_s, 'iOSPageControls'
        shape :i_osstatus_bar                                              , cs.to_s, 'iOSStatusBar'
        shape :i_ossearch_bar                                              , cs.to_s, 'iOSSearchBar'
        shape :i_osnav_bar                                                 , cs.to_s, 'iOSNavBar'
        shape :i_ostabs                                                    , cs.to_s, 'iOSTabs'
        shape :i_osuniversal_keyboard                                      , "#{s}ios.iKeybLett", 'iOSUniversalKeyboard'
        shape :i_osdate_picker                                             , cs.to_s, 'iOSDatePicker'
        shape :i_ostime_picker                                             , cs.to_s, 'iOSTimePicker'
        shape :i_oscountdown_picker                                        , cs.to_s, 'iOSCountdownPicker'
        shape :i_osbasic_cell                                              , cs.to_s, 'iOSBasicCell'
        shape :i_ossubtitle_cell                                           , cs.to_s, 'iOSSubtitleCell'
        shape :i_osright_detail_cell                                       , cs.to_s, 'iOSRightDetailCell'
        shape :i_osleft_detail_cell                                        , cs.to_s, 'iOSLeftDetailCell'
        shape :i_ostable_grouped_section_break                             , cs.to_s, 'iOSTableGroupedSectionBreak'
        shape :i_ostable_plain_header_footer                               , cs.to_s, 'iOSTablePlainHeaderFooter'
      end
      section :mind_map do
        shape :mind_map_block                                              , '', 'MindMapBlock'
        shape :mind_map_stadium_block                                      , 'arcSize=50', 'MindMapStadiumBlock'
        shape :mind_map_cloud                                              , 'shape=cloud', 'MindMapCloud'
        shape :mind_map_circle                                             , 'ellipse', 'MindMapCircle'
        shape :mind_map_isosceles_triangle_block                           , 'shape=triangle;direction=north', 'MindMapIsoscelesTriangleBlock'
        shape :mind_map_diamond_block                                      , 'shape=rhombus', 'MindMapDiamondBlock'
        shape :mind_map_pentagon_block                                     , "#{s}basic.pentagon", 'MindMapPentagonBlock'
        shape :mind_map_hexagon_block                                      , 'shape=hexagon;perimeter=hexagonPerimeter2', 'MindMapHexagonBlock'
        shape :mind_map_octagon_block                                      , "#{s}basic.octagon2;dx=10;", 'MindMapOctagonBlock'
        shape :mind_map_cross_block                                        , "#{s}basic.cross2;dx=20", 'MindMapCrossBlock'
      end
      section :entity_relationship do
        shape :erdentity_block                                             , cs.to_s, 'ERDEntityBlock'
        shape :erdentity_block2                                            , cs.to_s, 'ERDEntityBlock2'
        shape :erdentity_block3                                            , cs.to_s, 'ERDEntityBlock3'
        shape :erdentity_block4                                            , cs.to_s, 'ERDEntityBlock4'
      end
      section :uml_class_diagram do
        shape :umlclass_block                                              , cs.to_s, 'UMLClassBlock'
        shape :umlactive_class_block                                       , 'shape=process', 'UMLActiveClassBlock'
        shape :umlmultiplicity_block                                       , cs.to_s, 'UMLMultiplicityBlock'
        shape :umlpackage_block                                            , '', 'UMLPackageBlock'
        shape :umlconstraint_block                                         , cs.to_s, 'UMLConstraintBlock'
        shape :umlnote_block                                               , 'shape=note;size=15', 'UMLNoteBlock'
        shape :umlnote_block_v2                                            , 'shape=note;size=15', 'UMLNoteBlockV2'
        shape :umltext_block                                               , cs.to_s, 'UMLTextBlock'
      end
      section :uml_use_case do
        shape :umlactor_block                                              , 'shape=umlActor;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;whiteSpace=nowrap', 'UMLActorBlock'
        shape :umluse_case_block                                           , 'ellipse', 'UMLUseCaseBlock'
        shape :umlcircle_container_block                                   , "ellipse;#{containerStyle}", 'UMLCircleContainerBlock'
        shape :umlrectangle_container_block                                , 'containerStyle', 'UMLRectangleContainerBlock'
      end
      section :uml_state_activity do
        shape :umloption_loop_block                                        , "#{s}sysml.package2;xSize=90;overflow=fill", 'UMLOptionLoopBlock'
        shape :umlalternative_block2                                       , "#{s}sysml.package2;xSize=90;overflow=fill", 'UMLAlternativeBlock2'
        shape :umlstart_block                                              , 'ellipse;fillColor=#000000', 'UMLStartBlock'
        shape :umlstate_block                                              , cs.to_s, 'UMLStateBlock'
        shape :umldecision_block                                           , 'shape=rhombus;', 'UMLDecisionBlock'
        shape :umlhfork_join_block                                         , 'fillColor=#000000', 'UMLHForkJoinBlock'
        shape :umlvfork_join_block                                         , 'fillColor=#000000', 'UMLVForkJoinBlock'
        shape :umlflow_final_block                                         , "#{s}flowchart.or", 'UMLFlowFinalBlock'
        shape :umlhistory_state_block                                      , 'ellipse', 'UMLHistoryStateBlock'
        shape :umlend_block                                                , "#{s}bpmn.shape;outline=end;symbol=terminate;strokeColor=#000000;fillColor=#ffffff", 'UMLEndBlock'
        shape :umlobject_block                                             , '', 'UMLObjectBlock'
        shape :umlsend_signal_block                                        , "#{s}sysml.sendSigAct", 'UMLSendSignalBlock'
        shape :umlreceive_signal_block                                     , "#{s}sysml.accEvent;flipH=1", 'UMLReceiveSignalBlock'
        shape :umlaccept_time_event_action_block                           , "#{s}sysml.timeEvent", 'UMLAcceptTimeEventActionBlock'
        shape :umloff_page_link_block                                      , "#{s}sysml.sendSigAct;direction=south", 'UMLOffPageLinkBlock'
        shape :umlmulti_lane_pool_block                                    , cs.to_s, 'UMLMultiLanePoolBlock'
        shape :umlmulti_lane_pool_rotated_block                            , cs.to_s, 'UMLMultiLanePoolRotatedBlock'
        shape :umlmultidimensional_swimlane                                , cs.to_s, 'UMLMultidimensionalSwimlane'
      end
      section :uml_sequence do
        shape :umlactivation_block                                         , '', 'UMLActivationBlock'
        shape :umldeletion_block                                           , "#{s}sysml.x;strokeWidth=4", 'UMLDeletionBlock'
        shape :umlseq_entity_block                                         , "#{s}electrical.radio.microphone_1;direction=north", 'UMLSeqEntityBlock'
      end
      section :uml_component do
        shape :umlcomponent_block                                          , 'shape=component;align=left;spacingLeft=36', 'UMLComponentBlock'
        shape :umlcomponent_block_v2                                       , 'shape=component;align=left;spacingLeft=36', 'UMLComponentBlockV2'
        shape :umlnode_block                                               , 'shape=cube;size=20;flipH=1;verticalAlign=top;spacingTop=22;spacingLeft=5', 'UMLNodeBlock'
        shape :umlnode_block_v2                                            , 'shape=cube;size=20;flipH=1;verticalAlign=top;spacingTop=22;spacingLeft=5', 'UMLNodeBlockV2'
        shape :umlcomponent_interface_block                                , 'ellipse', 'UMLComponentInterfaceBlock'
        shape :umlcomponent_interface_block_v2                             , 'ellipse', 'UMLComponentInterfaceBlockV2'
        shape :umlcomponent_box_block                                      , cs.to_s, 'UMLComponentBoxBlock'
        shape :umlcomponent_box_block_v2                                   , cs.to_s, 'UMLComponentBoxBlockV2'
        shape :umlassembly_connector_block                                 , cs.to_s, 'UMLAssemblyConnectorBlock'
        shape :umlassembly_connector_block_v2                              , cs.to_s, 'UMLAssemblyConnectorBlockV2'
        shape :umlprovided_interface_block                                 , cs.to_s, 'UMLProvidedInterfaceBlock'
        shape :umlprovided_interface_block_v2                              , cs.to_s, 'UMLProvidedInterfaceBlockV2'
        shape :umlrequired_interface_block                                 , 'shape=requires;direction=north', 'UMLRequiredInterfaceBlock'
        shape :umlrequired_interface_block_v2                              , 'shape=requires;direction=north', 'UMLRequiredInterfaceBlockV2'
        shape :umlswim_lane_block_v2                                       , cs.to_s, 'UMLSwimLaneBlockV2'
        shape :umlswim_lane_block                                          , "swimlane;startSize=25;dropTarget=0;fontStyle=0#{containerStyle}", 'UMLSwimLaneBlock'
      end
      section :uml_entity_relationship do
        shape :umlentity_block                                             , '', 'UMLEntityBlock'
        shape :umlweak_entity_block                                        , 'shape=ext;double=1', 'UMLWeakEntityBlock'
        shape :umlattribute_block                                          , 'ellipse', 'UMLAttributeBlock'
        shape :umlmultivalued_attribute_block                              , 'shape=doubleEllipse', 'UMLMultivaluedAttributeBlock'
        shape :umlrelationship_block                                       , 'shape=rhombus', 'UMLRelationshipBlock'
        shape :umlweak_relationship_block                                  , 'shape=rhombus;double=1', 'UMLWeakRelationshipBlock'
      end
      section :bpmn_2_0 do
        shape :bpmnactivity                                                , cs.to_s, 'BPMNActivity'
        shape :bpmnevent                                                   , cs.to_s, 'BPMNEvent'
        shape :bpmnchoreography                                            , cs.to_s, 'BPMNChoreography'
        shape :bpmnconversation                                            , cs.to_s, 'BPMNConversation'
        shape :bpmngateway                                                 , cs.to_s, 'BPMNGateway'
        shape :bpmndata                                                    , cs.to_s, 'BPMNData'
        shape :bpmndata_store                                              , 'shape=datastore', 'BPMNDataStore'
        shape :bpmnadvanced_pool_block                                     , cs.to_s, 'BPMNAdvancedPoolBlock'
        shape :bpmnadvanced_pool_block_rotated                             , cs.to_s, 'BPMNAdvancedPoolBlockRotated'
        shape :bpmnblack_pool                                              , cs.to_s, 'BPMNBlackPool'
        shape :bpmntext_annotation                                         , cs.to_s, 'BPMNTextAnnotation'
      end
      section :data_flow do
        shape :dfdexternal_entity_block                                    , cs.to_s, 'DFDExternalEntityBlock'
        shape :dfdexternal_entity_block2                                   , '', 'DFDExternalEntityBlock2'
        shape :ydmdfdprocess_block                                         , 'ellipse', 'YDMDFDProcessBlock'
        shape :ydmdfddata_store_block                                      , 'shape=partialRectangle;right=0;left=0', 'YDMDFDDataStoreBlock'
        shape :gsdfdprocess_block                                          , cs.to_s, 'GSDFDProcessBlock'
        shape :gsdfdprocess_block2                                         , 'rounded=1;arcSize=10;', 'GSDFDProcessBlock2'
        shape :gsdfddata_store_block                                       , cs.to_s, 'GSDFDDataStoreBlock'
        shape :gsdfddata_store_block2                                      , 'shape=partialRectangle;right=0', 'GSDFDDataStoreBlock2'
      end
      section :org_chart do
        shape :org_block                                                   , cs.to_s, 'OrgBlock'
      end
      section :tables do
        shape :default_table_block                                         , cs.to_s, 'DefaultTableBlock'
      end
      section :processes do
        shape :vsmcustomer_supplier_block                                  , "#{s}lean_mapping.outside_sources", 'VSMCustomerSupplierBlock'
        shape :vsmdedicated_process_block                                  , cs.to_s, 'VSMDedicatedProcessBlock'
        shape :vsmshared_process_block                                     , cs.to_s, 'VSMSharedProcessBlock'
        shape :vsmworkcell_block                                           , cs.to_s, 'VSMWorkcellBlock'
        shape :vsmdatacell_block                                           , cs.to_s, 'VSMDatacellBlock'
      end
      section :materials do
        shape :vsminventory_block                                          , cs.to_s, 'VSMInventoryBlock'
        shape :vsmsupermarket_block                                        , cs.to_s, 'VSMSupermarketBlock'
        shape :vsmphysical_pull_block                                      , "#{s}lean_mapping.physical_pull;direction=south", 'VSMPhysicalPullBlock'
        shape :vsmfifolane_block                                           , cs.to_s, 'VSMFIFOLaneBlock'
        shape :vsmsafety_buffer_stock_block                                , cs.to_s, 'VSMSafetyBufferStockBlock'
      end
      section :shipments do
        shape :vsmexternal_shipment_airplane_block                         , "#{s}lean_mapping.airplane_7", 'VSMExternalShipmentAirplaneBlock'
        shape :vsmexternal_shipment_forklift_block                         , "#{s}lean_mapping.move_by_forklift", 'VSMExternalShipmentForkliftBlock'
        shape :vsmexternal_shipment_truck_block                            , "#{s}lean_mapping.truck_shipment;align=left;", 'VSMExternalShipmentTruckBlock'
        shape :vsmexternal_shipment_boat_block                             , "#{s}lean_mapping.boat_shipment;verticalAlign=bottom;", 'VSMExternalShipmentBoatBlock'
      end
      section :information do
        shape :vsmproduction_control_block                                 , cs.to_s, 'VSMProductionControlBlock'
        shape :vsmother_information_block                                  , '', 'VSMOtherInformationBlock'
        shape :vsmsequenced_pull_ball_block                                , "#{s}lean_mapping.sequenced_pull_ball", 'VSMSequencedPullBallBlock'
        shape :vsmmrperpblock                                              , "#{s}lean_mapping.mrp_erp;whiteSpace=wrap", 'VSMMRPERPBlock'
        shape :vsmload_leveling_block                                      , "#{s}lean_mapping.load_leveling", 'VSMLoadLevelingBlock'
        shape :vsmgo_see_block                                             , "#{s}lean_mapping.go_see_production_scheduling;flipH=1", 'VSMGoSeeBlock'
        shape :vsmgo_see_production_block                                  , cs.to_s, 'VSMGoSeeProductionBlock'
        shape :vsmverbal_info_block                                        , "#{s}lean_mapping.verbal", 'VSMVerbalInfoBlock'
      end
      section :value_stream_mapping do
        shape :vsmkaizen_burst_block                                       , "#{s}lean_mapping.kaizen_lightening_burst", 'VSMKaizenBurstBlock'
        shape :vsmoperator_block                                           , "#{s}lean_mapping.operator;flipV=1", 'VSMOperatorBlock'
        shape :vsmtimeline_block                                           , cs.to_s, 'VSMTimelineBlock'
        shape :vsmquality_problem_block                                    , "#{s}lean_mapping.quality_problem", 'VSMQualityProblemBlock'
      end
      section :kanban do
        shape :vsmproduction_kanban_single_block                           , 'shape=card;size=18;flipH=1;', 'VSMProductionKanbanSingleBlock'
        shape :vsmproduction_kanban_batch_block                            , cs.to_s, 'VSMProductionKanbanBatchBlock'
        shape :vsmwithdrawal_kanban_block                                  , "#{s}lean_mapping.withdrawal_kanban", 'VSMWithdrawalKanbanBlock'
        shape :vsmsignal_kanban_block                                      , 'shape=triangle;direction=south;anchorPointDirection=0', 'VSMSignalKanbanBlock'
        shape :vsmkanban_post_block                                        , "#{s}lean_mapping.kanban_post", 'VSMKanbanPostBlock'
      end
      section :arrows do
        shape :vsmshipment_arrow                                           , 'shape=singleArrow;arrowWidth=0.5;arrowSize=0.13', 'VSMShipmentArrow'
        shape :vsmpush_arrow                                               , "#{s}lean_mapping.push_arrow", 'VSMPushArrow'
        shape :vsmelectronic_information_arrow                             , cs.to_s, 'VSMElectronicInformationArrow'
      end
      section :ec2 do
        shape :awselastic_compute_cloud_block2                             , cs.to_s, 'AWSElasticComputeCloudBlock2'
        shape :awsinstance_block2                                          , "#{ss}aws3.instance", 'AWSInstanceBlock2'
        shape :awsinstances_block2                                         , "#{ss}aws3.instances;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSInstancesBlock2'
        shape :awsamiblock2                                                , "#{ss}aws3.ami;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAMIBlock2'
        shape :awsdbon_instance_block2                                     , "#{ss}aws3.db_on_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDBonInstanceBlock2'
        shape :awsinstance_cloud_watch_block2                              , "#{ss}aws3.instance_with_cloudwatch;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSInstanceCloudWatchBlock2'
        shape :awselastic_ipblock2                                         , "#{ss}aws3.elastic_ip;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElasticIPBlock2'
        shape :awshdfscluster_block2                                       , "#{ss}aws3.hdfs_cluster;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSHDFSClusterBlock2'
        shape :awsauto_scaling_block2                                      , "#{ss}aws3.auto_scaling;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAutoScalingBlock2'
        shape :awsec2optimized_instance2                                   , "#{ss}aws3.optimized_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEC2OptimizedInstance2'
        shape :awsamazon_ec2_spotinstance                                  , "#{ss}aws3.spot_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonEC2(Spotinstance)'
        shape :awsamazon_ecr                                               , "#{ss}aws3.ecr;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonECR'
        shape :awsamazon_ecs                                               , "#{ss}aws3.ecs;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonECS'
        shape :awslambda2                                                  , "#{ss}aws3.lambda;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSLambda2'
        shape :awselastic_load_balancing                                   , "#{ss}aws3.elastic_load_balancing;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElasticLoadBalancing'
      end
      section :networking do
        shape :awselastic_load_block2                                      , "#{ss}aws3.classic_load_balancer;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElasticLoadBlock2'
        shape :awsdirect_connect_block3                                    , "#{ss}aws3.direct_connect;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDirectConnectBlock3'
        shape :awselastic_network_block2                                   , "#{ss}aws3.elastic_network_interface;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSElasticNetworkBlock2'
        shape :awsroute53block2                                            , cs.to_s, 'AWSRoute53Block2'
        shape :awshosted_zone_block2                                       , "#{ss}aws3.hosted_zone;fontColor=#ffffff;fontStyle=1", 'AWSHostedZoneBlock2'
        shape :awsroute_table_block2                                       , "#{ss}aws3.route_table;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRouteTableBlock2'
        shape :awsvpcblock2                                                , "#{ss}aws3.vpc;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSVPCBlock2'
        shape :awsvpnconnection_block2                                     , "#{ss}aws3.vpn_connection;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSVPNConnectionBlock2'
        shape :awsvpngateway_block2                                        , "#{ss}aws3.vpn_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSVPNGatewayBlock2'
        shape :awscustomer_gateway_block2                                  , "#{ss}aws3.customer_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCustomerGatewayBlock2'
        shape :awscustomer_gateway_block3                                  , "#{ss}aws3.customer_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCustomerGatewayBlock3'
        shape :awsinternet_gateway_block2                                  , "#{ss}aws3.internet_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSInternetGatewayBlock2'
        shape :awsrouter_block2                                            , "#{ss}aws3.router;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRouterBlock2'
        shape :awsrouter_block3                                            , "#{ss}aws3.router;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRouterBlock3'
        shape :awsamazon_vpc_endpoints                                     , "#{ss}aws3.endpoints;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonVPC(endpoints)'
        shape :awsamazon_vpc_flowlogs                                      , "#{ss}aws3.flow_logs;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonVPC(flowlogs)'
        shape :awsamazon_vpc_vpcnatgateway                                 , "#{ss}aws3.vpc_nat_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonVPC(VPCNATgateway)'
        shape :awsvpcpeering3                                              , "#{ss}aws3.vpc_peering;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSVPCPeering3'
      end
      section :s3 do
        shape :awssimple_storage_block2                                    , "#{ss}aws3.s3;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSimpleStorageBlock2'
        shape :awsbucket_block2                                            , "#{ss}aws3.bucket;fontStyle=1;fontColor=#ffffff", 'AWSBucketBlock2'
        shape :awsbucketh_with_objects_block2                              , "#{ss}aws3.bucket_with_objects;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSBuckethWithObjectsBlock2'
        shape :awsobject_block2                                            , "#{ss}aws3.object;fontStyle=1;fontColor=#ffffff", 'AWSObjectBlock2'
        shape :awsimport_export_block2                                     , "#{ss}aws3.import_export;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSImportExportBlock2'
        shape :awsstorage_gateway_block2                                   , "#{ss}aws3.storage_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSStorageGatewayBlock2'
        shape :awselastic_block_storage_block2                             , "#{ss}aws3.volume;fontStyle=1;fontColor=#ffffff", 'AWSElasticBlockStorageBlock2'
        shape :awsvolume_block3                                            , "#{ss}aws3.volume;fontStyle=1;fontColor=#ffffff", 'AWSVolumeBlock3'
        shape :awssnapshot_block2                                          , "#{ss}aws3.snapshot;fontStyle=1;fontColor=#ffffff", 'AWSSnapshotBlock2'
        shape :awsglacier_archive_block3                                   , "#{ss}aws3.archive;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSGlacierArchiveBlock3'
        shape :awsglacier_vault_block3                                     , "#{ss}aws3.vault;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSGlacierVaultBlock3'
        shape :awsamazon_efs                                               , "#{ss}aws3.efs;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonEFS'
        shape :awsglacier_block2                                           , "#{ss}aws3.glacier;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSGlacierBlock2'
        shape :awsawsimport_export_snowball                                , "#{ss}aws3.snowball;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSImportExportSnowball'
        shape :awsstorage_gateway_cached_volumn2                           , "#{ss}aws3.cached_volume;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSStorageGatewayCachedVolumn2'
        shape :awsstorage_gateway_non_cached_volumn2                       , "#{ss}aws3.non_cached_volume;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSStorageGatewayNon-CachedVolumn2'
        shape :awsstorage_gateway_virtual_tape_library2                    , "#{ss}aws3.virtual_tape_library;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSStorageGatewayVirtualTapeLibrary2'
      end
      section :content_delivery do
        shape :awscloud_front_block2                                       , "#{ss}aws3.cloudfront;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudFrontBlock2'
        shape :awsdownload_dist_block2                                     , "#{ss}aws3.download_distribution;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDownloadDistBlock2'
        shape :awsstreaming_block2                                         , "#{ss}aws3.streaming_distribution;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSStreamingBlock2'
        shape :awsedge_location_block2                                     , "#{ss}aws3.edge_location;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEdgeLocationBlock2'
      end
      section :database do
        shape :awsitem_block2                                              , "#{ss}aws3.item;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSItemBlock2'
        shape :awsitems_block2                                             , "#{ss}aws3.items;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSItemsBlock2'
        shape :awsattribute_block2                                         , "#{ss}aws3.attribute;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAttributeBlock2'
        shape :awsattributes_block2                                        , "#{ss}aws3.attributes;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAttributesBlock2'
        shape :awsrdbsblock2                                               , cs.to_s, 'AWSRDBSBlock2'
        shape :awsrdsinstance_block2                                       , "#{ss}aws3.rds_db_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRDSInstanceBlock2'
        shape :awsrdsstandby_block2                                        , "#{ss}aws3.rds_db_instance_standby_multi_az;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSRDSStandbyBlock2'
        shape :awsrdsinstance_read_block2                                  , "#{ss}aws3.rds_db_instance_read_replica;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSRDSInstanceReadBlock2'
        shape :awsoracle_dbblock2                                          , "#{ss}aws3.oracle_db_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOracleDBBlock2'
        shape :awsmy_sqldbblock2                                           , "#{ss}aws3.mysql_db_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMySQLDBBlock2'
        shape :awsdynamo_dbblock2                                          , "#{ss}aws3.dynamo_db;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDynamoDBBlock2'
        shape :awssimple_database_block3                                   , "#{ss}aws2.database.simpledb;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSimpleDatabaseBlock3'
        shape :awssimple_database_domain_block3                            , "#{ss}aws2.database.simpledb_domain;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSSimpleDatabaseDomainBlock3'
        shape :awstable_block2                                             , "#{ss}aws3.table;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSTableBlock2'
        shape :awsamazon_red_shift_block3                                  , "#{ss}aws3.redshift;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRedShiftBlock3'
        shape :awselasti_cache_node_block2                                 , "#{ss}aws3.cache_node;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElastiCacheNodeBlock2'
        shape :awselasti_cache_block2                                      , "#{ss}aws3.elasticache;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElastiCacheBlock2'
        shape :awsdynamo_dbglobal_secondary_indexes2                       , "#{ss}aws3.global_secondary_index;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSDynamoDBGlobalSecondaryIndexes2'
        shape :awsamazon_elasti_cache_memcache2                            , "#{ss}aws3.memcached;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonElastiCacheMemcache2'
        shape :awsamazon_elasti_cache_redis2                               , "#{ss}aws3.redis;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonElastiCacheRedis2'
        shape :awsamazon_rdsmssqlinstance2                                 , "#{ss}aws3.ms_sql_instance_2;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRDSMSSQLInstance2'
        shape :awsmssqldbblock3                                            , "#{ss}aws3.ms_sql_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMSSQLDBBlock3'
        shape :awsamazon_rdsmy_sqldbinstance2                              , "#{ss}aws3.mysql_db_instance_2;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRDSMySQLDBInstance2'
        shape :awsamazon_rdsoracle_dbinstance2                             , "#{ss}aws3.oracle_db_instance_2;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonRDSOracleDBInstance2'
        shape :awsrdsreplicasetswith_piop2                                 , "#{ss}aws3.piop;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRDSReplicasetswithPIOP2'
        shape :awsamazon_rdspostgre_sql2                                   , "#{ss}aws3.postgre_sql_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRDSPostgreSQL2'
        shape :awsrdsmaster_sql2                                           , "#{ss}aws3.sql_master;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRDSMasterSQL2'
        shape :awsrdsslave_sql2                                            , "#{ss}aws3.sql_slave;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRDSSlaveSQL2'
        shape :awsamazon_redshift_densecomputenode                         , "#{ss}aws3.dense_compute_node;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonRedshift(densecomputenode)'
        shape :awsamazon_redshift_densestoragenode                         , "#{ss}aws3.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonRedshift(densestoragenode)'
        shape :awsawsdatabase_migration_service                            , "#{ss}aws3.database_migration_service;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAWSDatabaseMigrationService'
      end
      section :security_identity do
        shape :awsacm                                                      , "#{ss}aws3.certificate_manager;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSACM'
        shape :awsamazon_inspector                                         , "#{ss}aws3.inspector;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonInspector'
        shape :awsawscloud_hsm                                             , "#{ss}aws3.cloudhsm;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSCloudHSM'
        shape :awsdirectory_service2                                       , "#{ss}aws3.directory_service;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDirectoryService2'
        shape :awsawskms                                                   , "#{ss}aws3.kms;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSKMS'
        shape :awsawswaf                                                   , "#{ss}aws3.waf;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSWAF'
        shape :awsacm_certificate_manager                                  , "#{ss}aws3.certificate_manager_2;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSACM(certificate-manager)'
      end
      section :app_services do
        shape :awssesblock2                                                , "#{ss}aws3.ses;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSESBlock2'
        shape :awsemail_block2                                             , "#{ss}aws3.email;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEmailBlock2'
        shape :awssnsblock2                                                , "#{ss}aws3.sns;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSNSBlock2'
        shape :awssqsblock3                                                , "#{ss}aws3.sqs;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSQSBlock3'
        shape :awsqueue_block2                                             , "#{ss}aws3.queue;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSQueueBlock2'
        shape :awsmessage_block2                                           , "#{ss}aws3.message;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMessageBlock2'
        shape :awsdecider_block2                                           , "#{ss}aws3.decider;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDeciderBlock2'
        shape :awsswfblock2                                                , "#{ss}aws3.swf;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSWFBlock2'
        shape :awsworker_block2                                            , "#{ss}aws3.worker;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSWorkerBlock2'
        shape :awscloud_search_block2                                      , "#{ss}aws3.cloudsearch;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudSearchBlock2'
        shape :awscloud_search_metadata_block3                             , "#{ss}aws3.search_documents;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudSearchMetadataBlock3'
        shape :awselastic_transcoder3                                      , "#{ss}aws3.elastic_transcoder;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElasticTranscoder3'
        shape :awsamazon_apigateway                                        , "#{ss}aws3.api_gateway;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonAPIGateway'
        shape :awsapp_stream2                                              , "#{ss}aws3.appstream;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAppStream2'
      end
      section :deployment do
        shape :awscloud_formation_block2                                   , "#{ss}aws3.cloudformation;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudFormationBlock2'
        shape :awsdata_pipeline_block3                                     , "#{ss}aws3.data_pipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDataPipelineBlock3'
        shape :awsdata_pipeline_block2                                     , "#{ss}aws3.data_pipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDataPipelineBlock2'
        shape :awstemplage_block2                                          , "#{ss}aws3.template;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSTemplageBlock2'
        shape :awsstack_block2                                             , "#{ss}aws3.stack_aws_cloudformation;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSStackBlock2'
        shape :awsbean_stock_block2                                        , "#{ss}aws3.elastic_beanstalk;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSBeanStockBlock2'
        shape :awsapplication_block2                                       , "#{ss}aws3.application;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSApplicationBlock2'
        shape :awsbeanstalk_deployment_block3                              , "#{ss}aws3.deployment;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSBeanstalkDeploymentBlock3'
        shape :awsiamblock3                                                , "#{ss}aws3.iam;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMBlock3'
        shape :awsiamstsblock3                                             , "#{ss}aws3.sts;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMSTSBlock3'
        shape :awsiamaddon_block2                                          , "#{ss}aws3.add_on;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMAddonBlock2'
        shape :awscloud_watch_block3                                       , "#{ss}aws3.cloudwatch;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudWatchBlock3'
        shape :awscloud_watch_alarm_block2                                 , "#{ss}aws3.alarm;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudWatchAlarmBlock2'
        shape :awsiamsecurity_token_service2                               , "#{ss}aws3.sts_2;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMSecurityTokenService2'
        shape :awsiamdata_encryption_key2                                  , "#{ss}aws3.data_encryption_key;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMDataEncryptionKey2'
        shape :awsiamencrypted_data2                                       , "#{ss}aws3.encrypted_data;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMEncryptedData2'
        shape :awsawsiam_long_termsecuritycredential                       , "#{ss}aws3.long_term_security_credential;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAWSIAM(long-termsecuritycredential)'
        shape :awsiammfatoken2                                             , "#{ss}aws3.mfa_token;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMMFAToken2'
        shape :awsiampermissions2                                          , "#{ss}aws3.permissions_2;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMPermissions2'
        shape :awsiamroles2                                                , "#{ss}aws3.role;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSIAMRoles2'
        shape :awsawsiam_temporarysecuritycredential                       , "#{ss}aws3.long_term_security_credential;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAWSIAM(temporarysecuritycredential)'
        shape :awscloud_trail2                                             , "#{ss}aws3.cloudtrail;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudTrail2'
        shape :awsconfig2                                                  , "#{ss}aws3.config;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSConfig2'
        shape :awsops_works_block3                                         , "#{ss}aws3.opsworks;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksBlock3'
        shape :awsawsservice_catalog                                       , "#{ss}aws3.service_catalog;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSServiceCatalog'
        shape :awstrusted_advisor2                                         , "#{ss}aws3.trusted_advisor;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSTrustedAdvisor2'
        shape :awsops_works_apps2                                          , "#{ss}aws3.apps;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksApps2'
        shape :awsops_works_deployments2                                   , "#{ss}aws3.deployments;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksDeployments2'
        shape :awsops_works_instances2                                     , "#{ss}aws3.instances_2;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksInstances2'
        shape :awsops_works_layers2                                        , "#{ss}aws3.layers;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksLayers2'
        shape :awsops_works_monitoring2                                    , "#{ss}aws3.monitoring;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksMonitoring2'
        shape :awsops_works_permissions2                                   , "#{ss}aws3.permissions;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksPermissions2'
        shape :awsops_works_resources2                                     , "#{ss}aws3.resources;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksResources2'
        shape :awsops_works_stack2                                         , "#{ss}aws3.stack_aws_opsworks;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSOpsWorksStack2'
      end
      section :on_demand do
        shape :awsmechanical_turk_block3                                   , "#{ss}aws3.mechanical_turk;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMechanicalTurkBlock3'
        shape :awshuman_itblock2                                           , "#{ss}aws3.human_intelligence_tasks_hit;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSHumanITBlock2'
        shape :awsassignment_task_block2                                   , "#{ss}aws3.requester;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAssignmentTaskBlock2'
        shape :awsworkers_block2                                           , "#{ss}aws3.users;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSWorkersBlock2'
        shape :awsrequester_block2                                         , "#{ss}aws3.assignment_task;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRequesterBlock2'
      end
      section :sdks do
        shape :awsandroid_block3                                           , "#{ss}aws3.android;fillColor=#96BF3D;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAndroidBlock3'
        shape :awsi_osblock3                                               , "#{ss}aws3.android;fillColor=#CFCFCF;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSiOSBlock3'
        shape :awsjava_block3                                              , "#{ss}aws3.android;fillColor=#EE472A;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSJavaBlock3'
        shape :awsjava_script                                              , "#{ss}aws3.android;fillColor=#205E00;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSJavaScript'
        shape :awsnet_block3                                               , "#{ss}aws3.android;fillColor=#115193;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSNetBlock3'
        shape :awsnode_jsblock3                                            , "#{ss}aws3.android;fillColor=#8CC64F;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSNodeJSBlock3'
        shape :awsphpblock3                                                , "#{ss}aws3.android;fillColor=#5A69A4;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSPHPBlock3'
        shape :awspython_block3                                            , "#{ss}aws3.android;fillColor=#FFD44F;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSPythonBlock3'
        shape :awsruby_block3                                              , "#{ss}aws3.android;fillColor=#AE1F23;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSRubyBlock3'
        shape :awsxamarin                                                  , "#{ss}aws3.android;fillColor=#4090D7;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSXamarin'
        shape :awscliblock3                                                , "#{ss}aws3.cli;fillColor=#444444;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCLIBlock3'
        shape :awseclipse_toolkit_block3                                   , "#{ss}aws3.toolkit_for_eclipse;fillColor=#342074;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSEclipseToolkitBlock3'
        shape :awsvisual_studio_toolkit_block3                             , "#{ss}aws3.toolkit_for_visual_studio;fillColor=#53B1CB;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSVisualStudioToolkitBlock3'
        shape :awswindows_powershell_toolkit_block3                        , "#{ss}aws3.toolkit_for_windows_powershell;fillColor=#737373;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSWindowsPowershellToolkitBlock3'
      end
      section :analyti_cs do
        shape :awsamazon_elasticsearch_service                             , "#{ss}aws3.elasticsearch_service;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonElasticsearchService'
        shape :awselastic_map_reduce_block2                                , "#{ss}aws3.emr;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSElasticMapReduceBlock2'
        shape :awscluster_block2                                           , "#{ss}aws3.emr_cluster;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSClusterBlock2'
        shape :awsemrengine2                                               , "#{ss}aws3.emr_engine;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEMREngine2'
        shape :awsemrmap_rm3engine2                                        , "#{ss}aws3.emr_engine_mapr_m3;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEMRMapRM3Engine2'
        shape :awsemrmap_rm5engine2                                        , "#{ss}aws3.emr_engine_mapr_m5;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEMRMapRM5Engine2'
        shape :awsemrmap_rm7engine2                                        , "#{ss}aws3.emr_engine_mapr_m7;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEMRMapRM7Engine2'
        shape :awskinesis2                                                 , "#{ss}aws3.kinesis;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSKinesis2'
        shape :awsamazon_kinesis_amazon_kinesis_analytics                  , "#{ss}aws3.kinesis;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonKinesis(AmazonKinesisAnalytics)'
        shape :awskinesis_enabled_app2                                     , "#{ss}aws3.kinesis_enabled_app;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSKinesisEnabledApp2'
        shape :awsamazon_kinesis_amazon_kinesis_firehose                   , "#{ss}aws3.kinesis_firehose;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonKinesis(AmazonKinesisFirehose)'
        shape :awsamazon_kinesis_amazon_kinesis_streams                    , "#{ss}aws3.kinesis_streams;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonKinesis(AmazonKinesisStreams)'
        shape :awsamazon_machine_learning                                  , "#{ss}aws3.machine_learning;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonMachineLearning'
        shape :awsamazon_quick_sight                                       , "#{ss}aws3.quicksight;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonQuickSight'
      end
      section :mobile_services do
        shape :awscognito2                                                 , "#{ss}aws3.cognito;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCognito2'
        shape :awsmobile_analytics2                                        , "#{ss}aws3.mobile_analytics;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMobileAnalytics2'
        shape :awsawsdevice_farm                                           , "#{ss}aws3.device_farm;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSDeviceFarm'
        shape :awsawsmobile_hub                                            ,
              "#{ss}aws3.mobile_hub;gradientColor=#AD688A;gradientDirection=east;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSMobileHub'
        shape :awstopic_block2                                             , "#{ss}aws3.topic_2;fontStyle=1;fontColor=#ffffff;verticalAlign=top;spacingTop=-5", 'AWSTopicBlock2'
        shape :awsemail_notification_block2                                , "#{ss}aws3.email_notification;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSEmailNotificationBlock2'
        shape :awshttpnotification_block2                                  , "#{ss}aws3.http_notification;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSHTTPNotificationBlock2'
      end
      section :developer_tools do
        shape :awsawscode_commit                                           , "#{ss}aws3.codecommit;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSCodeCommit'
        shape :awscode_deploy2                                             , "#{ss}aws3.codedeploy;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCodeDeploy2'
        shape :awsawscode_pipeline                                         , "#{ss}aws3.codepipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSCodePipeline'
      end
      section :enterprise_application do
        shape :awswork_docs2                                               , "#{ss}aws3.workdocs;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSWorkDocs2'
        shape :awsamazon_work_mail                                         , "#{ss}aws3.workmail;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonWorkMail'
        shape :awsamazon_work_spaces2                                      , "#{ss}aws3.workspaces;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonWorkSpaces2'
      end
      section :internet_of_things do
        shape :awsawsio_t                                                  , "#{ss}aws3.aws_iot;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT'
        shape :awsawsio_t_action                                           , "#{ss}aws3.action;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(action)'
        shape :awsawsio_t_actuator                                         , "#{ss}aws3.actuator;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(actuator)'
        shape :awsawsio_t_certificate                                      , "#{ss}aws3.certificate;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(certificate)'
        shape :awsawsio_t_desiredstate                                     , "#{ss}aws3.desired_state;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(desiredstate)'
        shape :awsawsio_t_hardwareboard                                    , "#{ss}aws3.hardware_board;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(hardwareboard)'
        shape :awsawsio_t_http2protocol                                    , "#{ss}aws3.http_2_protocol;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(HTTP2protocol)'
        shape :awsawsio_t_httpprotocol                                     , "#{ss}aws3.http_protocol;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(HTTPprotocol)'
        shape :awsawsio_t_mqttprotocol                                     , "#{ss}aws3.mqtt_protocol;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(MQTTprotocol)'
        shape :awsawsio_t_policy                                           , "#{ss}aws3.policy;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(policy)'
        shape :awsawsio_t_reportedstate                                    , "#{ss}aws3.reported_state;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(reportedstate)'
        shape :awsawsio_t_rule                                             , "#{ss}aws3.rule;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(rule)'
        shape :awsawsio_t_sensor                                           , "#{ss}aws3.sensor;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(sensor)'
        shape :awsawsio_t_servo                                            , "#{ss}aws3.servo;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(servo)'
        shape :awsawsio_t_shadow                                           , "#{ss}aws3.shadow;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(shadow)'
        shape :awsawsio_t_simulator                                        , "#{ss}aws3.simulator;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(simulator)'
        shape :awsawsio_t_thingbank                                        , "#{ss}aws3.bank;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingbank)'
        shape :awsawsio_t_thingbicycle                                     , "#{ss}aws3.bicycle;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingbicycle)'
        shape :awsawsio_t_thingcamera                                      , "#{ss}aws3.camera;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingcamera)'
        shape :awsawsio_t_thingcar                                         , "#{ss}aws3.car;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingcar)'
        shape :awsawsio_t_thingcart                                        , "#{ss}aws3.cart;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingcart)'
        shape :awsawsio_t_thingcoffeepot                                   , "#{ss}aws3.coffee_pot;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingcoffeepot)'
        shape :awsawsio_t_thingdoorlock                                    , "#{ss}aws3.door_lock;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingdoorlock)'
        shape :awsawsio_t_thingfactory                                     , "#{ss}aws3.factory;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingfactory)'
        shape :awsawsio_t_thinggeneric                                     , "#{ss}aws3.generic;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thinggeneric)'
        shape :awsawsio_t_thinghouse                                       , "#{ss}aws3.house;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thinghouse)'
        shape :awsawsio_t_thinglightbulb                                   , "#{ss}aws3.lightbulb;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thinglightbulb)'
        shape :awsawsio_t_thingmedicalemergency                            , "#{ss}aws3.medical_emergency;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAWSIoT(thingmedicalemergency)'
        shape :awsawsio_t_thingpoliceemergency                             , "#{ss}aws3.police_emergency;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingpoliceemergency)'
        shape :awsawsio_t_thingthermostat                                  , "#{ss}aws3.thermostat;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingthermostat)'
        shape :awsawsio_t_thingtravel                                      , "#{ss}aws3.travel;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingtravel)'
        shape :awsawsio_t_thingutility                                     , "#{ss}aws3.utility;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingutility)'
        shape :awsawsio_t_thingwindfarm                                    , "#{ss}aws3.windfarm;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(thingwindfarm)'
        shape :awsawsio_t_topic                                            , "#{ss}aws3.topic;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAWSIoT(topic)'
      end
      section :aws_general do
        shape :awscloud_block2                                             , "#{ss}aws3.cloud;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSCloudBlock2'
        shape :awsvpcloud_block3                                           , "#{ss}aws3.virtual_private_cloud;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSVPCloudBlock3'
        shape :awsuser_block2                                              , "#{ss}aws3.user;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSUserBlock2'
        shape :awsusers_block2                                             , "#{ss}aws3.users;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSUsersBlock2'
        shape :awsclient_block2                                            , "#{ss}aws3.management_console;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSClientBlock2'
        shape :awsmobile_client_block2                                     , "#{ss}aws3.mobile_client;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMobileClientBlock2'
        shape :awsgeneric_database_block3                                  , "#{ss}aws3.generic_database;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSGenericDatabaseBlock3'
        shape :awsdisk_block3                                              , "#{ss}aws3.disk;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDiskBlock3'
        shape :awstape_storage_block3                                      , "#{ss}aws3.tape_storage;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSTapeStorageBlock3'
        shape :awsmedia_block2                                             , "#{ss}aws3.multimedia;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSMediaBlock2'
        shape :awsdata_center_block2                                       , "#{ss}aws3.corporate_data_center;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSDataCenterBlock2'
        shape :awsserver_block2                                            , "#{ss}aws3.traditional_server;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSServerBlock2'
        shape :awsinternet_block2                                          , "#{ss}aws2.non-service_specific.internet;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSInternetBlock2'
        shape :awsforums_block3                                            , "#{ss}aws3.forums;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSForumsBlock3'
        shape :awsmanagement_block2                                        , "#{ss}aws3.management_console;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSManagementBlock2'
        shape :awsamazon_elastic_cache_node2                               , "#{ss}aws3.cache_node;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonElasticCacheNode2'
        shape :awsamazon_redshift_dw1cluster2                              , "#{ss}aws3.dense_compute_node;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRedshiftDW1Cluster2'
        shape :awsamazon_redshift_dw2cluster2                              , "#{ss}aws3.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRedshiftDW2Cluster2'
        shape :awsamazon_redshift_ssdfamily_cluster2                       , "#{ss}aws3.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top",
              'AWSAmazonRedshiftSSDFamilyCluster2'
        shape :awsamazon_route53route_table2                               , "#{ss}aws3.route_table;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSAmazonRoute53RouteTable2'
        shape :awssubnet_block2                                            , "#{ss}aws3.permissions;verticalLabelPosition=bottom;align=center;verticalAlign=top", 'AWSSubnetBlock2'
      end
      section :aws_containers do
        shape :awsrounded_rectangle_container_block2                       , cs.to_s, 'AWSRoundedRectangleContainerBlock2'
        shape :awsrounded_rectangle_container_block                        , cs.to_s, 'AWSRoundedRectangleContainerBlock'
      end
      section :azure_cloud do
        shape :acaccess_control_block                                      , "#{ssAzure}azure.access_control", 'ACAccessControlBlock'
        shape :acapiapps_block                                             , "#{ssAzure}mscae.cloud.api_app", 'ACAPIAppsBlock'
        shape :acapimanagement_block                                       , "#{ssAzure}mscae.cloud.api_management", 'ACAPIManagementBlock'
        shape :acapp_insights_block                                        , "#{ssAzure}mscae.cloud.application_insights", 'ACAppInsightsBlock'
        shape :acapp_services_block                                        , "#{ssAzure}mscae.cloud.app_service", 'ACAppServicesBlock'
        shape :acautoscaling_block                                         , "#{ssAzure}azure.autoscale", 'ACAutoscalingBlock'
        shape :acazure_active_directory_block                              , "#{ssAzure}azure.azure_active_directory", 'ACAzureActiveDirectoryBlock'
        shape :acazurealert_block                                          , "#{ssAzure}azure.azure_alert", 'ACAzurealertBlock'
        shape :acazure_automation_block                                    , "#{ssAzure}azure.automation", 'ACAzureAutomationBlock'
        shape :acazure_batch_block                                         , "#{ssAzure}mscae.cloud.azure_batch", 'ACAzureBatchBlock'
        shape :acazure_redis_block                                         , "#{ssAzure}azure.azure_cache", 'ACAzureRedisBlock'
        shape :acazure_files_block                                         , "#{ssAzure}mscae.cloud.azure_files_service", 'ACAzureFilesBlock'
        shape :acazureloadbalancer_block                                   , "#{ssAzure}mscae.cloud.azure_automatic_load_balancer", 'ACAzureloadbalancerBlock'
        shape :acazure_marketplace_block                                   , "#{ssAzure}azure.azure_marketplace", 'ACAzureMarketplaceBlock'
        shape :acazure_right_management_rmsblock                           , "#{ssAzure}mscae.cloud.azure_rights_management_rms", 'ACAzureRightManagementRMSBlock'
        shape :acazure_sdkblock                                            , "#{ssAzure}azure.azure_sdk", 'ACAzureSDKBlock'
        shape :acazure_search_block                                        , "#{ssAzure}mscae.cloud.azure_search", 'ACAzureSearchBlock'
        shape :acazure_sqldatabase_block                                   , "#{ssAzure}azure.sql_database_sql_azure", 'ACAzureSQLdatabaseBlock'
        shape :acazuresubscription_block                                   , "#{ssAzure}azure.azure_subscription", 'ACAzuresubscriptionBlock'
        shape :acazure_websites_block                                      , "#{ssAzure}azure.azure_website", 'ACAzureWebsitesBlock'
        shape :acbackup_service_block                                      , "#{ssAzure}azure.backup_service", 'ACBackupServiceBlock'
        shape :acbitbucketcodesource_block                                 , "#{ssAzure}azure.bitbucket_code_source", 'ACBitbucketcodesourceBlock'
        shape :acbiz_talk_services_block                                   , "#{ssAzure}azure.biztalk_services", 'ACBizTalkServicesBlock'
        shape :accloud_service_block                                       , "#{ssAzure}azure.cloud_service", 'ACCloudServiceBlock'
        shape :accode_plex_block                                           , "#{ssAzure}azure.codeplex_code_source", 'ACCodePlexBlock'
        shape :accontent_delivery_network_block                            , "#{ssAzure}azure.content_delivery_network", 'ACContentDeliveryNetworkBlock'
        shape :acdata_factory_block                                        , "#{ssAzure}mscae.cloud.data_factory", 'ACDataFactoryBlock'
        shape :acdocument_dbblock                                          , "#{ssAzure}mscae.cloud.documentdb", 'ACDocumentDBBlock'
        shape :acdropboxcodesource_block                                   , "#{ssAzure}azure.dropbox_code_source", 'ACDropboxcodesourceBlock'
        shape :acevents_hub_block                                          , "#{ssAzure}mscae.cloud.event_hubs", 'ACEventsHubBlock'
        shape :acexpress_route_block                                       , "#{ssAzure}azure.express_route", 'ACExpressRouteBlock'
        shape :acgit_hub_block                                             , "#{ssAzure}azure.github_code", 'ACGitHubBlock'
        shape :acgitrepository_block                                       , "#{ssAzure}azure.git_repository", 'ACGitrepositoryBlock'
        shape :achdinsight_block                                           , "#{ssAzure}mscae.cloud.hdinsight", 'ACHDInsightBlock'
        shape :achealthmonitoring_block                                    , "#{ssAzure}azure.health_monitoring", 'ACHealthmonitoringBlock'
        shape :achealthy_block                                             , "#{ssAzure}azure.healthy", 'ACHealthyBlock'
        shape :achybrid_connection_block                                   , "#{ssAzure}mscae.cloud.hybrid_connections", 'ACHybridConnectionBlock'
        shape :acbiz_talkhybridconnection_block                            , "#{ssAzure}mscae.cloud.hybrid_connection_manager", 'ACBizTalkhybridconnectionBlock'
        shape :ackey_vault_block                                           , "#{ssAzure}mscae.cloud.key_vault", 'ACKeyVaultBlock'
        shape :aclogic_app_block                                           , "#{ssAzure}mscae.cloud.logic_app", 'ACLogicAppBlock'
        shape :acmachine_learning_block                                    , "#{ssAzure}mscae.cloud.machine_learning", 'ACMachineLearningBlock'
        shape :acmedia_services_block                                      , "#{ssAzure}azure.media_service", 'ACMediaServicesBlock'
        shape :acmicrosoftaccount_block                                    , "#{ssAzure}mscae.cloud.microsoft_account", 'ACMicrosoftaccountBlock'
        shape :acmicrosoft_azure_block                                     , "#{ssAzure}mscae.cloud.microsoft_azure", 'ACMicrosoftAzureBlock'
        shape :acmobile_engagement_block                                   , "#{ssAzure}mscae.cloud.mobile_engagement", 'ACMobileEngagementBlock'
        shape :acmobile_services_block                                     , "#{ssAzure}mscae.cloud.mobile_app", 'ACMobileServicesBlock'
        shape :acmulti_factor_auth_block                                   , "#{ssAzure}azure.multi_factor_authentication", 'ACMultiFactorAuthBlock'
        shape :acmy_sqldatabase_block                                      , "#{ssAzure}azure.mysql_database", 'ACMySQLdatabaseBlock'
        shape :acnotification_hubs_block                                   , "#{ssAzure}azure.notification_hub", 'ACNotificationHubsBlock'
        shape :acnotificationtopic_block                                   , "#{ssAzure}azure.notification_topic", 'ACNotificationtopicBlock'
        shape :acoperational_insights_block                                , "#{ssAzure}mscae.cloud.operational_insights", 'ACOperationalInsightsBlock'
        shape :acosimage_block                                             , "#{ssAzure}azure.operating_system_image", 'ACOSimageBlock'
        shape :acremote_app_block                                          , "#{ssAzure}mscae.cloud.remoteapp", 'ACRemoteAppBlock'
        shape :acrpd_remotingfile_block                                    , "#{ssAzure}azure.rdp_remoting_file", 'ACrpdRemotingfileBlock'
        shape :acscheduler_block                                           , "#{ssAzure}azure.scheduler", 'ACSchedulerBlock'
        shape :acservice_bus_block                                         , "#{ssAzure}azure.service_bus", 'ACServiceBusBlock'
        shape :acservice_bus_queue_block                                   , "#{ssAzure}azure.service_bus_queues", 'ACServiceBusQueueBlock'
        shape :acservice_bus_relay_block                                   , "#{ssAzure}azure.service_bus_relay", 'ACServiceBusRelayBlock'
        shape :acservice_bus_topic_block                                   , "#{ssAzure}azure.service_bus_topics_and_subscriptions", 'ACServiceBusTopicBlock'
        shape :acservice_endpoint_block                                    , "#{ssAzure}mscae.cloud.service_endpoint", 'ACServiceEndpointBlock'
        shape :acservicepackage_block                                      , "#{ssAzure}mscae.cloud.service_package", 'ACServicepackageBlock'
        shape :acsite_recovery_block                                       , "#{ssAzure}azure.hyper_v_recovery_manager", 'ACSiteRecoveryBlock'
        shape :acsqldatabasegeneric_block                                  , "#{ssAzure}azure.sql_database", 'ACSQLdatabasegenericBlock'
        shape :acsqldatasync_block                                         , "#{ssAzure}azure.sql_datasync", 'ACSQLdatasyncBlock'
        shape :acsqlreportingdeprecated_block                              , "#{ssAzure}azure.sql_reporting", 'ACSQLreportingdeprecatedBlock'
        shape :acstartuptask_block                                         , "#{ssAzure}azure.startup_task", 'ACStartuptaskBlock'
        shape :acstorage_azure_block                                       , "#{ssAzure}mscae.cloud.azure_storage", 'ACStorageAzureBlock'
        shape :acstorageblob_block                                         , "#{ssAzure}azure.storage_blob", 'ACStorageblobBlock'
        shape :acstoragequeue_block                                        , "#{ssAzure}azure.storage_queue", 'ACStoragequeueBlock'
        shape :acstoragetable_block                                        , "#{ssAzure}azure.storage_table", 'ACStoragetableBlock'
        shape :acstor_simple_block                                         , "#{ssAzure}azure.storsimple", 'ACStorSimpleBlock'
        shape :acstream_analytics_block                                    , "#{ssAzure}mscae.cloud.stream_analytics", 'ACStreamAnalyticsBlock'
        shape :actraffic_manager_block                                     , "#{ssAzure}azure.traffic_manager", 'ACTrafficManagerBlock'
        shape :acalien_block                                               , "#{ssAzure}azure.unidentified_code_object", 'ACAlienBlock'
        shape :acvhdblock                                                  , "#{ssAzure}azure.vhd", 'ACVHDBlock'
        shape :acvhddatadisk_block                                         , "#{ssAzure}azure.vhd_data_disk", 'ACVHDdatadiskBlock'
        shape :acvirtualmachine_block                                      , "#{ssAzure}azure.virtual_machine", 'ACVirtualmachineBlock'
        shape :acvirtualmachinecontainer_block                             , "#{ssAzure}mscae.cloud.virtual_machine_container", 'ACVirtualmachinecontainerBlock'
        shape :acvirtualnetwork_block                                      , "#{ssAzure}azure.virtual_network", 'ACVirtualnetworkBlock'
        shape :acvisual_studio_online_block                                , "#{ssAzure}azure.visual_studio_online", 'ACVisualStudioOnlineBlock'
        shape :acvmsymbolonly_block                                        , "#{ssAzure}azure.virtual_machine_feature", 'ACVMsymbolonlyBlock'
        shape :acweb_jobs_block                                            , "#{ssAzure}mscae.cloud.webjobs", 'ACWebJobsBlock'
        shape :acwebrole_block                                             , "#{ssAzure}azure.web_role", 'ACWebroleBlock'
        shape :acwebroles_block                                            , "#{ssAzure}azure.web_roles", 'ACWebrolesBlock'
        shape :acworkaccount_block                                         , "#{ssAzure}mscae.cloud.work_account", 'ACWorkaccountBlock'
        shape :acworkerrole_block                                          , "#{ssAzure}azure.worker_role", 'ACWorkerroleBlock'
        shape :acworkerroles_block                                         , "#{ssAzure}azure.worker_roles", 'ACWorkerrolesBlock'
        shape :adnsblock                                                   , "#{ssAzure}mscae.cloud.azure_dns", 'ADNSBlock'
        shape :acload_balancer_block                                       , "#{ssAzure}mscae.cloud.azure_load_balancer_feature", 'ACLoadBalancerBlock'
        shape :acresource_group_block                                      , "#{ssAzure}mscae.cloud.resource_group", 'ACResourceGroupBlock'
        shape :acvpngateway_block                                          , "#{ssAzure}mscae.cloud.vpn_gateway", 'ACVPNGatewayBlock'
      end
      section :azure_enterprise do
        shape :aeactive_directory_fspblock                                 , "#{ssAzure}mscae.enterprise.d", 'AEActiveDirectoryFSPBlock'
        shape :aeadfsblock                                                 , "#{ssAzure}mscae.enterprise.ad_fs", 'AEADFSBlock'
        shape :aeandroid_phone_block                                       , "#{ssAzure}mscae.enterprise.android_phone", 'AEAndroidPhoneBlock'
        shape :aeappblankfortext_block                                     , "#{ssAzure}mscae.enterprise.application_blank", 'AEappblankfortextBlock'
        shape :aeapp_generic_block                                         , "#{ssAzure}mscae.enterprise.app_generic", 'AEAppGenericBlock'
        shape :aeappserver_block                                           , "#{ssAzure}mscae.enterprise.application_server", 'AEAppserverBlock'
        shape :aebackuplocal_block                                         , "#{ssAzure}mscae.enterprise.backup_local", 'AEBackuplocalBlock'
        shape :aebackuponline_block                                        , "#{ssAzure}mscae.enterprise.backup_online", 'AEBackuponlineBlock'
        shape :aecalendar_block                                            , "#{ssAzure}mscae.general.calendar", 'AECalendarBlock'
        shape :aecertificate_block                                         , "#{ssAzure}azure.certificate", 'AECertificateBlock'
        shape :aeclient_app_block                                          , "#{ssAzure}mscae.enterprise.client_application", 'AEClientAppBlock'
        shape :aecloud_block                                               , "#{ssAzure}mscae.enterprise.internet", 'AECloudBlock'
        shape :aeclusterserver_block                                       , "#{ssAzure}mscae.enterprise.cluster_server", 'AEClusterserverBlock'
        shape :aecodefile_block                                            , "#{ssAzure}azure.code_file", 'AECodefileBlock'
        shape :aeconnectors_block                                          , "#{ssAzure}mscae.enterprise.connectors", 'AEConnectorsBlock'
        shape :aedatabasegeneric_block                                     , "#{ssAzure}mscae.enterprise.database_generic", 'AEDatabasegenericBlock'
        shape :aedatabaseserver_block                                      , "#{ssAzure}mscae.enterprise.database_server", 'AEDatabaseserverBlock'
        shape :aedatabasesync_block                                        , "#{ssAzure}mscae.enterprise.database_synchronization", 'AEDatabasesyncBlock'
        shape :aedevice_block                                              , "#{ssAzure}mscae.enterprise.device", 'AEDeviceBlock'
        shape :aedirectaccess_block                                        , "#{ssAzure}mscae.enterprise.direct_access_feature", 'AEDirectaccessBlock'
        shape :aedocument_block                                            , "#{ssAzure}mscae.enterprise.document", 'AEDocumentBlock'
        shape :aedomaincontroller_block                                    , "#{ssAzure}mscae.enterprise.domain_controller", 'AEDomaincontrollerBlock'
        shape :aeenterprise_building_block                                 , "#{ssAzure}azure.enterprise", 'AEEnterpriseBuildingBlock'
        shape :aefilegeneral_block                                         , "#{ssAzure}azure.file", 'AEFilegeneralBlock'
        shape :aefilter_block                                              , "#{ssAzure}mscae.enterprise.filter", 'AEFilterBlock'
        shape :aefirewall_block                                            , "#{ssAzure}mscae.enterprise.firewall", 'AEFirewallBlock'
        shape :aefolder_block                                              , "#{ssAzure}mscae.enterprise.folder", 'AEFolderBlock'
        shape :aegateway_block                                             , "#{ssAzure}mscae.enterprise.gateway", 'AEGatewayBlock'
        shape :aegenericcode_block                                         , "#{ssAzure}azure.code_file", 'AEGenericcodeBlock'
        shape :aegraph_block                                               , "#{ssAzure}mscae.general.graph", 'AEGraphBlock'
        shape :aehealthmonitoring_block                                    , "#{ssAzure}azure.health_monitoring", 'AEHealthmonitoringBlock'
        shape :aehealthy_block                                             , "#{ssAzure}azure.healthy", 'AEHealthyBlock'
        shape :aeimportgeneric_block                                       , "#{ssAzure}mscae.enterprise.import_generic", 'AEImportgenericBlock'
        shape :aeinternet_block                                            , "#{ssAzure}mscae.enterprise.internet", 'AEInternetBlock'
        shape :aekeyboard_block                                            , "#{ssAzure}mscae.enterprise.keyboard", 'AEKeyboardBlock'
        shape :aekeypermissions_block                                      , "#{ssAzure}mscae.enterprise.key_permissions", 'AEKeypermissionsBlock'
        shape :aelaptopcomputer_block                                      , "#{ssAzure}azure.laptop", 'AELaptopcomputerBlock'
        shape :aeloadbalancer_block                                        , "#{ssAzure}azure.load_balancer_generic", 'AELoadbalancerBlock'
        shape :aeload_testing_block                                        , "#{ssAzure}mscae.enterprise.load_testing", 'AELoadTestingBlock'
        shape :aelockprotected_block                                       , "#{ssAzure}mscae.enterprise.lock", 'AELockprotectedBlock'
        shape :aelockunprotected_block                                     , "#{ssAzure}mscae.enterprise.lock_unlocked", 'AELockunprotectedBlock'
        shape :aemaintenance_block                                         , "#{ssAzure}mscae.enterprise.maintenance", 'AEMaintenanceBlock'
        shape :aemanagementconsole_block                                   , "#{ssAzure}mscae.enterprise.management_console", 'AEManagementconsoleBlock'
        shape :aemessage_block                                             , "#{ssAzure}azure.message", 'AEMessageBlock'
        shape :aemonitor_block                                             , "#{ssAzure}azure.computer", 'AEMonitorBlock'
        shape :aemonitorrunningapps_block                                  , "#{ssAzure}mscae.enterprise.monitor_running_apps", 'AEMonitorrunningappsBlock'
        shape :aemouse_block                                               , "#{ssAzure}mscae.enterprise.mouse", 'AEMouseBlock'
        shape :aenetworkcard_block                                         , "#{ssAzure}mscae.enterprise.network_card", 'AENetworkcardBlock'
        shape :aenotallowed_block                                          , "#{ssAzure}mscae.general.not_allowed", 'AENotallowedBlock'
        shape :aeperformance_block                                         , "#{ssAzure}mscae.enterprise.performance", 'AEPerformanceBlock'
        shape :aeperformancemonitor_block                                  , "#{ssAzure}mscae.enterprise.performance_monitor", 'AEPerformancemonitorBlock'
        shape :aephone_block                                               , "#{ssAzure}azure.mobile", 'AEPhoneBlock'
        shape :aeplugandplay_block                                         , "#{ssAzure}mscae.enterprise.plug_and_play", 'AEPlugandplayBlock'
        shape :aepowershellscriptfile_block                                , "#{ssAzure}azure.powershell_file", 'AEPowershellscriptfileBlock'
        shape :aeprotocolstack_block                                       , "#{ssAzure}mscae.enterprise.protocol_stack", 'AEProtocolstackBlock'
        shape :aequeuegeneral_block                                        , "#{ssAzure}azure.queue_generic", 'AEQueuegeneralBlock'
        shape :aermsconnector_block                                        , "#{ssAzure}mscae.enterprise.rms_connector", 'AERMSconnectorBlock'
        shape :aerouter_block                                              , "#{ssAzure}mscae.enterprise.router", 'AERouterBlock'
        shape :aescriptfile_block                                          , "#{ssAzure}azure.script_file", 'AEScriptfileBlock'
        shape :aesecurevirtualmachine_block                                , "#{ssAzure}mscae.enterprise.secure_virtual_machine", 'AESecurevirtualmachineBlock'
        shape :aeserverblade_block                                         , "#{ssAzure}azure.server", 'AEServerbladeBlock'
        shape :aeserverdirectory_block                                     , "#{ssAzure}mscae.enterprise.server_directory", 'AEServerdirectoryBlock'
        shape :aeserverfarm_block                                          , "#{ssAzure}mscae.enterprise.server_farm", 'AEServerfarmBlock'
        shape :aeservergeneric_block                                       , "#{ssAzure}mscae.enterprise.server_generic", 'AEServergenericBlock'
        shape :aeserverrack_block                                          , "#{ssAzure}azure.server_rack", 'AEServerrackBlock'
        shape :aesettings_block                                            , "#{ssAzure}mscae.enterprise.settings", 'AESettingsBlock'
        shape :aesharedfolder_block                                        , "#{ssAzure}mscae.enterprise.shared_folder", 'AESharedfolderBlock'
        shape :aesmartcard_block                                           , "#{ssAzure}mscae.enterprise.smartcard", 'AESmartcardBlock'
        shape :aestorage_block                                             , "#{ssAzure}mscae.enterprise.storage", 'AEStorageBlock'
        shape :aetable_block                                               , "#{ssAzure}mscae.enterprise.table", 'AETableBlock'
        shape :aetablet_block                                              , "#{ssAzure}azure.tablet", 'AETabletBlock'
        shape :aetool_block                                                , "#{ssAzure}mscae.enterprise.tool", 'AEToolBlock'
        shape :aetunnel_block                                              , "#{ssAzure}mscae.general.tunnel", 'AETunnelBlock'
        shape :aeunhealthy_block                                           , "#{ssAzure}mscae.enterprise.unhealthy", 'AEUnhealthyBlock'
        shape :aeusbblock                                                  , "#{ssAzure}mscae.enterprise.usb", 'AEUSBBlock'
        shape :aeuser_block                                                , "#{ssAzure}azure.user", 'AEUserBlock'
        shape :aevideo_block                                               , "#{ssAzure}mscae.general.video", 'AEVideoBlock'
        shape :aevirtualmachine_block                                      , "#{ssAzure}azure.virtual_machine_feature", 'AEVirtualmachineBlock'
        shape :aeweb_block                                                 , "#{ssAzure}mscae.enterprise.web", 'AEWebBlock'
        shape :aewebserver_block                                           , "#{ssAzure}mscae.enterprise.web_server", 'AEWebserverBlock'
        shape :aewindowsserver_block                                       , "#{ssAzure}mscae.enterprise.windows_server", 'AEWindowsserverBlock'
        shape :aewirelessconnection_block                                  , "#{ssAzure}mscae.enterprise.wireless_connection", 'AEWirelessconnectionBlock'
        shape :aeworkstationclient_block                                   , "#{ssAzure}mscae.enterprise.workstation_client", 'AEWorkstationclientBlock'
        shape :aexmlwebservice_block                                       , "#{ssAzure}mscae.enterprise.xml_web_service", 'AEXMLwebserviceBlock'
        shape :agsaudio_block                                              , "#{ssAzure}mscae.general.audio", 'AGSAudioBlock'
        shape :agsbug_block                                                , "#{ssAzure}mscae.general.bug", 'AGSBugBlock'
        shape :agscablesettop_tvbox_block                                  , "#{ssAzure}mscae.general.cable_settop_tv_box", 'AGSCablesettopTVboxBlock'
        shape :agscalendar_block                                           , "#{ssAzure}mscae.general.calendar", 'AGSCalendarBlock'
        shape :agschart_block                                              , "#{ssAzure}mscae.general.chart", 'AGSChartBlock'
        shape :agscheckmark_success_block                                  , "#{ssAzure}mscae.general.checkmark", 'AGSCheckmarkSuccessBlock'
        shape :agscontinous_cycle_circle_block                             , "#{ssAzure}mscae.general.continuous_cycle", 'AGSContinousCycleCircleBlock'
        shape :agscrossout_failure_block                                   , "#{ssAzure}mscae.general.crossout", 'AGSCrossoutFailureBlock'
        shape :agscutandpaste_block                                        , "#{ssAzure}mscae.general.cut_and_paste", 'AGSCutandpasteBlock'
        shape :agsfolder_block                                             , "#{ssAzure}mscae.enterprise.folder", 'AGSFolderBlock'
        shape :agsgamecontroller_block                                     , "#{ssAzure}mscae.general.game_controller", 'AGSGamecontrollerBlock'
        shape :agsgears_block                                              , "#{ssAzure}mscae.general.gears", 'AGSGearsBlock'
        shape :agsgraph_block                                              , "#{ssAzure}mscae.general.graph", 'AGSGraphBlock'
        shape :agslike_block                                               , "#{ssAzure}mscae.general.like", 'AGSLikeBlock'
        shape :agsnotallowed_block                                         , "#{ssAzure}mscae.general.not_allowed", 'AGSNotallowedBlock'
        shape :agssliderbarhorizontal_block                                , "#{ssAzure}mscae.general.slider_bar_horizontal", 'AGSSliderbarhorizontalBlock'
        shape :agssliderbarvert_block                                      , "#{ssAzure}mscae.general.slider_bar_vertical", 'AGSSliderbarvertBlock'
        shape :agstasklistor_backlog_block                                 , "#{ssAzure}mscae.general.task_list", 'AGSTasklistorBacklogBlock'
        shape :agstasks_block                                              , "#{ssAzure}mscae.general.tasks", 'AGSTasksBlock'
        shape :agstunnel_block                                             , "#{ssAzure}mscae.general.tunnel", 'AGSTunnelBlock'
        shape :agsuser_block                                               , "#{ssAzure}azure.user", 'AGSUserBlock'
        shape :agsvideo_block                                              , "#{ssAzure}mscae.general.video", 'AGSVideoBlock'
      end
      section :azure_vms do
        shape :avmactive_directory_vmblock                                 , 'shape=mxgraph.mscae.vm.active_directory;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMActiveDirectoryVMBlock'
        shape :avmactive_directory_vmmulti_block                           , 'shape=mxgraph.mscae.vm.active_directory_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMActiveDirectoryVMmultiBlock'
        shape :avmapp_server_vmblock                                       , 'shape=mxgraph.mscae.vm.application_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMAppServerVMBlock'
        shape :avmapp_server_vmmulti_block                                 , 'shape=mxgraph.mscae.vm.application_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMAppServerVMmultiBlock'
        shape :avmdatabase_server_vmblock                                  , 'shape=mxgraph.mscae.vm.database_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMDatabaseServerVMBlock'
        shape :avmdatabase_server_vmmulti_block                            , 'shape=mxgraph.mscae.vm.database_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMDatabaseServerVMmultiBlock'
        shape :avmdirectory_server_vmblock                                 , 'shape=mxgraph.mscae.vm.directory_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMDirectoryServerVMBlock'
        shape :avmdirectory_server_vmmulti_block                           , 'shape=mxgraph.mscae.vm.directory_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMDirectoryServerVMmultiBlock'
        shape :avmdomain_server_vmblock                                    , 'shape=mxgraph.mscae.vm.domain_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMDomainServerVMBlock'
        shape :avmdomain_server_vmmulti_block                              , 'shape=mxgraph.mscae.vm.domain_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMDomainServerVMmultiBlock'
        shape :avmfile_server_vmblock                                      , 'shape=mxgraph.mscae.vm.file_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMFileServerVMBlock'
        shape :avmfile_server_vmmulti_block                                , 'shape=mxgraph.mscae.vm.file_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMFileServerVMmultiBlock'
        shape :avmweb_server_vmblock                                       , 'shape=mxgraph.mscae.vm.web_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none', 'AVMWebServerVMBlock'
        shape :avmweb_server_vmmulti_block                                 , 'shape=mxgraph.mscae.vm.web_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMWebServerVMmultiBlock'
        shape :avmwindows_server_vmblock                                   , 'shape=mxgraph.mscae.vm.windows_server;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMWindowsServerVMBlock'
        shape :avmwindows_server_vmmulti_block                             , 'shape=mxgraph.mscae.vm.windows_server_multi;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none',
              'AVMWindowsServerVMmultiBlock'
      end
      section :azure2019 do
        shape :access_review_azure2019                                     , "#{azur19}Access_Review.svg", 'AccessReviewAzure2019'
        shape :active_directory_connect_health_azure2019                   , "#{azur19}Active_Directory_Health_Monitoring.svg", 'ActiveDirectoryConnectHealthAzure2019'
        shape :active_directory_azure2019                                  , "#{azur19}Active_Directory.svg", 'ActiveDirectoryAzure2019'
        shape :active_directory_azure2019                                  , "#{azur19}ActiveDirectory.svg", 'ActiveDirectoryAzure2019_'
        shape :active_directory_domain_azure2019                           , "#{azur19}ActiveDirectoryDomain.svg", 'ActiveDirectoryDomainAzure2019'
        shape :address_space_azure2019                                     , "#{azur19}Address_Space.svg", 'AddressSpaceAzure2019'
        shape :add_team_member_azure2019                                   , "#{azur19}AddTeamMember.svg", 'AddTeamMemberAzure2019'
        shape :adfsazure2019                                               , "#{azur19}ADFS.svg", 'ADFSAzure2019'
        shape :advisor_azure2019                                           , "#{azur19}Advisor.svg", 'AdvisorAzure2019'
        shape :alien_azure2019                                             , "#{azur19}Alien.svg", 'AlienAzure2019'
        shape :alien_sad_azure2019                                         , "#{azur19}AlienSad.svg", 'AlienSadAzure2019'
        shape :analysis_services_azure2019                                 , "#{azur19}Analysis_Services.svg", 'AnalysisServicesAzure2019'
        shape :apimanagement_services_azure2019                            , "#{azur19}API_Management.svg", 'APIManagementServicesAzure2019'
        shape :apiazure2019                                                , "#{azur19}API.svg", 'APIAzure2019'
        shape :apidefinition_azure2019                                     , "#{azur19}APIDefinition.svg", 'APIDefinitionAzure2019'
        shape :app_configuration_azure2019                                 , "#{azur19}App_Configuration.svg", 'AppConfigurationAzure2019'
        shape :app_registrations_azure2019                                 , "#{azur19}App_Registrations.svg", 'AppRegistrationsAzure2019'
        shape :app_service_apiapps_azure2019                               , "#{azur19}App_Service_API_Apps.svg", 'AppServiceAPIAppsAzure2019'
        shape :app_service_frontend_azure2019                              , "#{azur19}App_Service_Frontend.svg", 'AppServiceFrontendAzure2019'
        shape :public_ipaddresses_azure2019                                , "#{azur19}App_Service_IPAddress.svg", 'PublicIPAddressesAzure2019'
        shape :azure_app_service_mobile_azure2019                          , "#{azur19}App_Service_Mobile_App.svg", 'AzureAppServiceMobileAzure2019'
        shape :app_service_worker_pools_azure2019                          , "#{azur19}App_Service_Worker_Pools.svg", 'AppServiceWorkerPoolsAzure2019'
        shape :app_service_azure2019                                       , "#{azur19}App_Service.svg", 'AppServiceAzure2019'
        shape :app_services_azure2019                                      , "#{azur19}App_Services.svg", 'AppServicesAzure2019'
        shape :app_service_environments_azure2019                          , "#{azur19}App_Services.svg", 'AppServiceEnvironmentsAzure2019'
        shape :application_gateway_azure2019                               , "#{azur19}Application_Gateway.svg", 'ApplicationGatewayAzure2019'
        shape :application_insights_azure2019                              , "#{azur19}Application_Insights.svg", 'ApplicationInsightsAzure2019'
        shape :application_security_groups_azure2019                       , "#{azur19}Application_Security_Groups.svg", 'ApplicationSecurityGroupsAzure2019'
        shape :app_service_connectivity_azure2019                          , "#{azur19}AppServiceConnectivity.svg", 'AppServiceConnectivityAzure2019'
        shape :app_service_environment_azure2019                           , "#{azur19}AppServiceEnvironment.svg", 'AppServiceEnvironmentAzure2019'
        shape :archive_storage_azure2019                                   , "#{azur19}Archive_Storage.svg", 'ArchiveStorageAzure2019'
        shape :armexplorer_azure2019                                       , "#{azur19}ARMExplorer.svg", 'ARMExplorerAzure2019'
        shape :auditing_azure2019                                          , "#{azur19}Auditing.svg", 'AuditingAzure2019'
        shape :auditing_server_azure2019                                   , "#{azur19}AuditingServer.svg", 'AuditingServerAzure2019'
        shape :auto_backup_azure2019                                       , "#{azur19}AutoBackup.svg", 'AutoBackupAzure2019'
        shape :automation_accounts_azure2019                               , "#{azur19}Automation.svg", 'AutomationAccountsAzure2019'
        shape :avatar_azure2019                                            , "#{azur19}Avatar.svg", 'AvatarAzure2019'
        shape :avatar_default_azure2019                                    , "#{azur19}AvatarDefault.svg", 'AvatarDefaultAzure2019'
        shape :avatar_unknown_azure2019                                    , "#{azur19}AvatarUnknown.svg", 'AvatarUnknownAzure2019'
        shape :azure_api_for_fhirazure2019                                 , "#{azur19}Azure API for FHIR.svg", 'Azure API for FHIRAzure2019'
        shape :azure_adb2cazure2019                                        , "#{azur19}Azure_AD_B2C.svg", 'AzureADB2CAzure2019'
        shape :azure_addomain_services_azure2019                           , "#{azur19}Azure_AD_Domain_Services.svg", 'AzureADDomainServicesAzure2019'
        shape :azure_adidentity_protection_azure2019                       , "#{azur19}Azure_AD_Identity_Protection.svg", 'AzureADIdentityProtectionAzure2019'
        shape :azure_adprivileged_identity_management_azure2019            , "#{azur19}Azure_AD_Privileged_Identity_Management.svg", 'AzureADPrivilegedIdentityManagementAzure2019'
        shape :azure_apifor_fhirazure2019                                  , "#{azur19}Azure_API_for_FHIR.svg", 'AzureAPIforFHIRAzure2019'
        shape :azure_artifacts_azure2019                                   , "#{azur19}Azure_Artifacts.svg", 'AzureArtifactsAzure2019'
        shape :azure_boards_azure2019                                      , "#{azur19}Azure_Boards.svg", 'AzureBoardsAzure2019'
        shape :azure_cachefor_redis_azure2019                              , "#{azur19}Azure_Cache_for_Redis.svg", 'AzureCacheforRedisAzure2019'
        shape :azure_data_explorer_clusters_azure2019                      , "#{azur19}Azure_Data_Explorer_Clusters.svg", 'AzureDataExplorerClustersAzure2019'
        shape :azure_databasefor_maria_dbservers_azure2019                 , "#{azur19}Azure_Database_for_MariaDB_servers.svg", 'AzureDatabaseforMariaDBServersAzure2019'
        shape :azure_databasefor_my_sqlservers_azure2019                   , "#{azur19}Azure_Database_for_MySQL_servers.svg", 'AzureDatabaseforMySQLServersAzure2019'
        shape :azure_databasefor_postgre_sqlservers_azure2019              , "#{azur19}Azure_Database_for_PostgreSQL_servers.svg", 'AzureDatabaseforPostgreSQLServersAzure2019'
        shape :azure_database_migration_services_azure2019                 , "#{azur19}Azure_Database_Migration_Services.svg", 'AzureDatabaseMigrationServicesAzure2019'
        shape :azure_dev_ops_azure2019                                     , "#{azur19}Azure_DevOps.svg", 'AzureDevOpsAzure2019'
        shape :azure_digital_twins_azure2019                               , "#{azur19}Azure_Digital_Twins.svg", 'AzureDigitalTwinsAzure2019'
        shape :azure_firewall_azure2019                                    , "#{azur19}Azure_Firewall.svg", 'AzureFirewallAzure2019'
        shape :azure_home_azure2019                                        , "#{azur19}Azure_Home.svg", 'AzureHomeAzure2019'
        shape :azure_io_thub_security_azure2019                            , "#{azur19}Azure_IoT_Hub_Security.svg", 'AzureIoTHubSecurityAzure2019'
        shape :azure_io_thub_azure2019                                     , "#{azur19}Azure_IoT_Hub.svg", 'AzureIoTHubAzure2019'
        shape :azure_maps_azure2019                                        , "#{azur19}Azure_Maps.svg", 'AzureMapsAzure2019'
        shape :azure_media_player_azure2019                                , "#{azur19}Azure_Media_Player.svg", 'AzureMediaPlayerAzure2019'
        shape :azure_net_appfiles_azure2019                                , "#{azur19}Azure_NetApp_files.svg", 'AzureNetAppfilesAzure2019'
        shape :azure_pipelines_azure2019                                   , "#{azur19}Azure_Pipelines.svg", 'AzurePipelinesAzure2019'
        shape :azure_repos_azure2019                                       , "#{azur19}Azure_Repos.svg", 'AzureReposAzure2019'
        shape :azure_sentinel_azure2019                                    , "#{azur19}Azure_Sentinel.svg", 'AzureSentinelAzure2019'
        shape :azure_sphere_azure2019                                      , "#{azur19}Azure_Sphere.svg", 'AzureSphereAzure2019'
        shape :azure_test_plans_azure2019                                  , "#{azur19}Azure_Test_Plans.svg", 'AzureTestPlansAzure2019'
        shape :azure_fxtedge_filer_azure2019                               , "#{azur19}AzureFXTEdgeFiler.svg", 'AzureFXTEdgeFilerAzure2019'
        shape :backlog_azure2019                                           , "#{azur19}Backlog.svg", 'BacklogAzure2019'
        shape :recovery_services_vaults_azure2019                          , "#{azur19}Backup.svg", 'RecoveryServicesVaultsAzure2019'
        shape :batch_accounts_azure2019                                    , "#{azur19}Batch_Accounts.svg", 'BatchAccountsAzure2019'
        shape :batch_aiazure2019                                           , "#{azur19}Batch_AI.svg", 'BatchAIAzure2019'
        shape :batch_task_azure2019                                        , "#{azur19}Batch_Task.svg", 'BatchTaskAzure2019'
        shape :batch_task_vmazure2019                                      , "#{azur19}Batch_TaskVM.svg", 'BatchTaskVMAzure2019'
        shape :batch_azure2019                                             , "#{azur19}Batch.svg", 'BatchAzure2019'
        shape :billing_hub_azure2019                                       , "#{azur19}BillingHub.svg", 'BillingHubAzure2019'
        shape :biz_talk_services_hybrid_connections_azure2019              , "#{azur19}BizTalk_Services_Hybrid_Connections.svg", 'BizTalkServicesHybridConnectionsAzure2019'
        shape :biz_talk_services_azure2019                                 , "#{azur19}BizTalk_Services.svg", 'BizTalkServicesAzure2019'
        shape :blob_storage_azure2019                                      , "#{azur19}BlobBlock.svg", 'BlobStorageAzure2019'
        shape :blob_page_azure2019                                         , "#{azur19}BlobPage.svg", 'BlobPageAzure2019'
        shape :blockchain_azure2019                                        , "#{azur19}Blockchain.svg", 'BlockchainAzure2019'
        shape :blog_storage_azure2019                                      , "#{azur19}Blog_Storage.svg", 'BlogStorageAzure2019'
        shape :blueprints_azure2019                                        , "#{azur19}Blueprints.svg", 'BlueprintsAzure2019'
        shape :book_azure2019                                              , "#{azur19}Book.svg", 'BookAzure2019'
        shape :bot_services_azure2019                                      , "#{azur19}Bot_Services.svg", 'BotServicesAzure2019'
        shape :branch_azure2019                                            , "#{azur19}Branch.svg", 'BranchAzure2019'
        shape :browser_azure2019                                           , "#{azur19}Browser.svg", 'BrowserAzure2019'
        shape :bug_azure2019                                               , "#{azur19}Bug.svg", 'BugAzure2019'
        shape :building_blocks_azure2019                                   , "#{azur19}Building_Blocks.svg", 'BuildingBlocksAzure2019'
        shape :builds_azure2019                                            , "#{azur19}Builds.svg", 'BuildsAzure2019'
        shape :azure_cacheplus_redis_azure2019                             , "#{azur19}Cache_including_Redis.svg", 'AzureCacheplusRedisAzure2019'
        shape :azure_cache_redis_azure2019                                 , "#{azur19}Cache_Redis_Product.svg", 'AzureCacheRedisAzure2019'
        shape :calendar_azure2019                                          , "#{azur19}Calendar.svg", 'CalendarAzure2019'
        shape :cdnrocket_azure2019                                         , "#{azur19}CDNrocket.svg", 'CDNrocketAzure2019'
        shape :certificate_azure2019                                       , "#{azur19}Certificate.svg", 'CertificateAzure2019'
        shape :app_service_certificates_azure2019                          , "#{azur19}Certificate.svg", 'AppServiceCertificatesAzure2019'
        shape :metrics_azure2019                                           , "#{azur19}Chart.svg", 'MetricsAzure2019'
        shape :check_azure2019                                             , "#{azur19}Check.svg", 'CheckAzure2019'
        shape :citrix_virtual_desktops_essentials_azure2019                , "#{azur19}Citrix_Virtual_Desktops_Essentials.svg", 'CitrixVirtualDesktopsEssentialsAzure2019'
        shape :reserved_ipaddresses_classic_azure2019                      , "#{azur19}ClassicIPAddress.svg", 'ReservedIPAddressesClassicAzure2019'
        shape :classic_storage_azure2019                                   , "#{azur19}ClassicStorage.svg", 'ClassicStorageAzure2019'
        shape :client_apps_azure2019                                       , "#{azur19}Client_Apps.svg", 'ClientAppsAzure2019'
        shape :recent_azure2019                                            , "#{azur19}Clock.svg", 'RecentAzure2019'
        shape :cycle_cloud_azure2019                                       , "#{azur19}Cloud_Cycle.svg", 'CycleCloudAzure2019'
        shape :cloud_services_azure2019                                    , "#{azur19}Cloud_Service.svg", 'CloudServicesAzure2019'
        shape :cloud_services_classic_azure2019                            , "#{azur19}Cloud_Services_Classic.svg", 'CloudServicesClassicAzure2019'
        shape :cloud_simple_nodes_azure2019                                , "#{azur19}CloudSimple_Nodes.svg", 'CloudSimpleNodesAzure2019'
        shape :cloud_simple_services_azure2019                             , "#{azur19}CloudSimple_Services.svg", 'CloudSimpleServicesAzure2019'
        shape :cloud_simple_virtual_machines_azure2019                     , "#{azur19}CloudSimple_Virtual_Machines.svg", 'CloudSimpleVirtualMachinesAzure2019'
        shape :code_azure2019                                              , "#{azur19}Code.svg", 'CodeAzure2019'
        shape :cognitive_services_computer_vision_azure2019                , "#{azur19}Cognitive_Services_Computer_Vision.svg", 'CognitiveServicesComputerVisionAzure2019'
        shape :cognitive_servicesemotion_azure2019                         , "#{azur19}Cognitive_Services_emotion.svg", 'CognitiveServicesemotionAzure2019'
        shape :cognitive_servicesface_azure2019                            , "#{azur19}Cognitive_Services_face.svg", 'CognitiveServicesfaceAzure2019'
        shape :cognitive_servicesluis_azure2019                            , "#{azur19}Cognitive_Services_luis.svg", 'CognitiveServicesluisAzure2019'
        shape :cognitive_servicesrecommendations_azure2019                 , "#{azur19}Cognitive_Services_recommendations.svg", 'CognitiveServicesrecommendationsAzure2019'
        shape :cognitive_services_speech_azure2019                         , "#{azur19}Cognitive_Services_Speech.svg", 'CognitiveServicesSpeechAzure2019'
        shape :cognitive_servicestextanalytics_azure2019                   , "#{azur19}Cognitive_Services_textanalytics.svg", 'CognitiveServicestextanalyticsAzure2019'
        shape :cognitive_servicesweblanguagemodel_azure2019                , "#{azur19}Cognitive_Services_web_language_model.svg", 'CognitiveServicesweblanguagemodelAzure2019'
        shape :cognitive_services_azure2019                                , "#{azur19}Cognitive_Services.svg", 'CognitiveServicesAzure2019'
        shape :commits_azure2019                                           , "#{azur19}Commits.svg", 'CommitsAzure2019'
        shape :connection_azure2019                                        , "#{azur19}Connection.svg", 'ConnectionAzure2019'
        shape :connections_azure2019                                       , "#{azur19}Connections.svg", 'ConnectionsAzure2019'
        shape :contact_info_azure2019                                      , "#{azur19}ContactInfo.svg", 'ContactInfoAzure2019'
        shape :container_instances_azure2019                               , "#{azur19}Container_Instances.svg", 'ContainerInstancesAzure2019'
        shape :container_registries_azure2019                              , "#{azur19}Container_Registries.svg", 'ContainerRegistriesAzure2019'
        shape :container_service_azure2019                                 , "#{azur19}Container_Service.svg", 'ContainerServiceAzure2019'
        shape :cdnprofiles_azure2019                                       , "#{azur19}Content_Delivery_Network.svg", 'CDNProfilesAzure2019'
        shape :content_protection_azure2019                                , "#{azur19}Content_Protection.svg", 'ContentProtectionAzure2019'
        shape :content_management_system_azure2019                         , "#{azur19}ContentManagementSystem.svg", 'ContentManagementSystemAzure2019'
        shape :continuous_export_azure2019                                 , "#{azur19}ContinuousExport.svg", 'ContinuousExportAzure2019'
        shape :controllers_azure2019                                       , "#{azur19}Controllers.svg", 'ControllersAzure2019'
        shape :controls_azure2019                                          , "#{azur19}Controls.svg", 'ControlsAzure2019'
        shape :controls_horizontal_azure2019                               , "#{azur19}ControlsHorizontal.svg", 'ControlsHorizontalAzure2019'
        shape :azure_cosmos_dbazure2019                                    , "#{azur19}CosmosDB.svg", 'AzureCosmosDBAzure2019'
        shape :counter_azure2019                                           , "#{azur19}Counter.svg", 'CounterAzure2019'
        shape :cubes_azure2019                                             , "#{azur19}Cubes.svg", 'CubesAzure2019'
        shape :custom_domain_azure2019                                     , "#{azur19}CustomDomain.svg", 'CustomDomainAzure2019'
        shape :app_service_domains_azure2019                               , "#{azur19}CustomDomain.svg", 'AppServiceDomainsAzure2019'
        shape :customer_lockbox_azure2019                                  , "#{azur19}Customer_Lockbox.svg", 'CustomerLockboxAzure2019'
        shape :customer_insights_azure2019                                 , "#{azur19}CustomerInsights.svg", 'CustomerInsightsAzure2019'
        shape :data_box_edge_data_box_gateway_azure2019                    , "#{azur19}Data_Box_Edge_Data_Box_Gateway.svg", 'DataBoxEdgeDataBoxGatewayAzure2019'
        shape :data_box_azure2019                                          , "#{azur19}Data_Box.svg", 'DataBoxAzure2019'
        shape :import_export_jobs_azure2019                                , "#{azur19}Data_Box.svg", 'ImportExportJobsAzure2019'
        shape :azure_data_catalog_azure2019                                , "#{azur19}Data_Catalog.svg", 'AzureDataCatalogAzure2019'
        shape :data_factories_azure2019                                    , "#{azur19}Data_Factory.svg", 'DataFactoriesAzure2019'
        shape :data_lake_analytics_azure2019                               , "#{azur19}Data_Lake_Analytics.svg", 'DataLakeAnalyticsAzure2019'
        shape :data_lake_storage_azure2019                                 , "#{azur19}Data_Lake_Storage.svg", 'DataLakeStorageAzure2019'
        shape :data_lake_store_gen1azure2019                               , "#{azur19}Data_Lake_Store.svg", 'DataLakeStoreGen1Azure2019'
        shape :data_lake_azure2019                                         , "#{azur19}Data_Lake.svg", 'DataLakeAzure2019'
        shape :data_warehouse_azure2019                                    , "#{azur19}Data_Warehouse.svg", 'DataWarehouseAzure2019'
        shape :azure_database_generic_azure2019                            , "#{azur19}Database_General.svg", 'AzureDatabaseGenericAzure2019'
        shape :database_restore_azure2019                                  , "#{azur19}DatabaseRestore.svg", 'DatabaseRestoreAzure2019'
        shape :azure_databricks_azure2019                                  , "#{azur19}Databricks.svg", 'AzureDatabricksAzure2019'
        shape :data_export_azure2019                                       , "#{azur19}dataExport.svg", 'dataExportAzure2019'
        shape :data_retention_azure2019                                    , "#{azur19}dataRetention.svg", 'dataRetentionAzure2019'
        shape :data_servicescategoryrollup_azure2019                       , "#{azur19}DataServices_category_rollup.svg", 'DataServicescategoryrollupAzure2019'
        shape :dcosazure2019                                               , "#{azur19}DC_OS.svg", 'DCOSAzure2019'
        shape :ddosprotection_plans_azure2019                              , "#{azur19}DDOS_Protection_Plans.svg", 'DDOSProtectionPlansAzure2019'
        shape :dedicated_event_hub_azure2019                               , "#{azur19}Dedicated_Event_Hub.svg", 'DedicatedEventHubAzure2019'
        shape :dev_console_azure2019                                       , "#{azur19}DevConsole.svg", 'DevConsoleAzure2019'
        shape :developer_tools_azure2019                                   , "#{azur19}Developer_Tools.svg", 'DeveloperToolsAzure2019'
        shape :device_compliance_azure2019                                 , "#{azur19}Device_Compliance.svg", 'DeviceComplianceAzure2019'
        shape :device_config_azure2019                                     , "#{azur19}Device_Config.svg", 'DeviceConfigAzure2019'
        shape :device_provisioning_services_azure2019                      , "#{azur19}Device_Provisioning_Services.svg", 'DeviceProvisioningServicesAzure2019'
        shape :devices_groups_azure2019                                    , "#{azur19}Devices_Groups.svg", 'DevicesGroupsAzure2019'
        shape :azure_dev_test_labs_azure2019                               , "#{azur19}DevTest_Labs.svg", 'AzureDevTestLabsAzure2019'
        shape :directory_sync_azure2019                                    , "#{azur19}DirectorySync.svg", 'DirectorySyncAzure2019'
        shape :discard_azure2019                                           , "#{azur19}Discard.svg", 'DiscardAzure2019'
        shape :disks_azure2019                                             , "#{azur19}Discs.svg", 'DisksAzure2019'
        shape :dnsprivate_zones_azure2019                                  , "#{azur19}DNS_Private_Zones.svg", 'DNSPrivateZonesAzure2019'
        shape :dnszones_azure2019                                          , "#{azur19}DNS.svg", 'DNSZonesAzure2019'
        shape :docker_azure2019                                            , "#{azur19}Docker.svg", 'DockerAzure2019'
        shape :document_dbazure2019                                        , "#{azur19}DocumentDB.svg", 'DocumentDBAzure2019'
        shape :download_azure2019                                          , "#{azur19}Download.svg", 'DownloadAzure2019'
        shape :ebooks_azure2019                                            , "#{azur19}eBooks.svg", 'EBooksAzure2019'
        shape :education_azure2019                                         , "#{azur19}Education.svg", 'EducationAzure2019'
        shape :elastic_database_pools_azure2019                            , "#{azur19}Elastic_Database_Pools.svg", 'ElasticDatabasePoolsAzure2019'
        shape :elastic_job_agents_azure2019                                , "#{azur19}Elastic_Job_Agents.svg", 'ElasticJobAgentsAzure2019'
        shape :enrollment_azure2019                                        , "#{azur19}Enrollment.svg", 'EnrollmentAzure2019'
        shape :enterprise_applications_azure2019                           , "#{azur19}Enterprise_Applications.svg", 'EnterpriseApplicationsAzure2019'
        shape :event_grid_topics_azure2019                                 , "#{azur19}Event_Grid_Topics.svg", 'EventGridTopicsAzure2019'
        shape :event_grid_domains_azure2019                                , "#{azur19}Event_Grid.svg", 'EventGridDomainsAzure2019'
        shape :event_grid_subscriptions_azure2019                          , "#{azur19}Event_Grid.svg", 'EventGridSubscriptionsAzure2019'
        shape :event_hub_clusters_azure2019                                , "#{azur19}Event_Hub_Clusters.svg", 'EventHubClustersAzure2019'
        shape :event_hubs_azure2019                                        , "#{azur19}Event_Hubs.svg", 'EventHubsAzure2019'
        shape :event_log_azure2019                                         , "#{azur19}EventLog.svg", 'EventLogAzure2019'
        shape :exchange_on_premises_access_azure2019                       , "#{azur19}Exchange_On_premises_Access.svg", 'ExchangeOnPremisesAccessAzure2019'
        shape :express_route_circuits_azure2019                            , "#{azur19}Express_Route.svg", 'ExpressRouteCircuitsAzure2019'
        shape :extensions_azure2019                                        , "#{azur19}Extensions.svg", 'ExtensionsAzure2019'
        shape :favorite_azure2019                                          , "#{azur19}Favorite.svg", 'FavoriteAzure2019'
        shape :file_azure2019                                              , "#{azur19}File.svg", 'FileAzure2019'
        shape :files_azure2019                                             , "#{azur19}Files.svg", 'FilesAzure2019'
        shape :folder_azure2019                                            , "#{azur19}Folder.svg", 'FolderAzure2019'
        shape :folder_blank_azure2019                                      , "#{azur19}FolderBlank.svg", 'FolderBlankAzure2019'
        shape :folder_cube_azure2019                                       , "#{azur19}FolderCube.svg", 'FolderCubeAzure2019'
        shape :folder_website_azure2019                                    , "#{azur19}FolderWebsite.svg", 'FolderWebsiteAzure2019'
        shape :for_placement_only_azure2019                                , "#{azur19}ForPlacementOnly.svg", 'ForPlacementOnlyAzure2019'
        shape :free_services_azure2019                                     , "#{azur19}Free_Services.svg", 'FreeServicesAzure2019'
        shape :front_doors_azure2019                                       , "#{azur19}Front_Doors.svg", 'FrontDoorsAzure2019'
        shape :ftp_azure2019                                               , "#{azur19}Ftp.svg", 'FtpAzure2019'
        shape :function_apps_azure2019                                     , "#{azur19}Functions.svg", 'FunctionAppsAzure2019'
        shape :gallery_management_azure2019                                , "#{azur19}GalleryManagement.svg", 'GalleryManagementAzure2019'
        shape :gateway_azure2019                                           , "#{azur19}Gateway.svg", 'GatewayAzure2019'
        shape :gear2azure2019                                              , "#{azur19}Gear_2.svg", 'Gear2Azure2019'
        shape :gear_azure2019                                              , "#{azur19}Gear.svg", 'GearAzure2019'
        shape :gear_alternate2azure2019                                    , "#{azur19}GearAlternate_2.svg", 'GearAlternate2Azure2019'
        shape :gear_alternate_azure2019                                    , "#{azur19}GearAlternate.svg", 'GearAlternateAzure2019'
        shape :general_storage_azure2019                                   , "#{azur19}General_Storage.svg", 'GeneralStorageAzure2019'
        shape :genomics_accounts_azure2019                                 , "#{azur19}Genomics_Accounts.svg", 'GenomicsAccountsAzure2019'
        shape :geo_replication_premium_azure2019                           , "#{azur19}GeoReplicationPremium.svg", 'GeoReplicationPremiumAzure2019'
        shape :geo_replication_standard_azure2019                          , "#{azur19}GeoReplicationStandard.svg", 'GeoReplicationStandardAzure2019'
        shape :get_more_license_azure2019                                  , "#{azur19}GetMoreLicense.svg", 'GetMoreLicenseAzure2019'
        shape :get_started_azure2019                                       , "#{azur19}GetStarted.svg", 'GetStartedAzure2019'
        shape :gift_azure2019                                              , "#{azur19}Gift.svg", 'GiftAzure2019'
        shape :globe_azure2019                                             , "#{azur19}Globe.svg", 'GlobeAzure2019'
        shape :globe_error_azure2019                                       , "#{azur19}GlobeError.svg", 'GlobeErrorAzure2019'
        shape :globe_success_azure2019                                     , "#{azur19}GlobeSuccess.svg", 'GlobeSuccessAzure2019'
        shape :globe_warning_azure2019                                     , "#{azur19}GlobeWarning.svg", 'GlobeWarningAzure2019'
        shape :go_azure2019                                                , "#{azur19}Go.svg", 'GoAzure2019'
        shape :great_scott_azure2019                                       , "#{azur19}GreatScott.svg", 'GreatScottAzure2019'
        shape :grid_azure2019                                              , "#{azur19}Grid.svg", 'GridAzure2019'
        shape :all_resources_azure2019                                     , "#{azur19}Grid3x3.svg", 'AllResourcesAzure2019'
        shape :guest_assignments_azure2019                                 , "#{azur19}Guest_Assignments.svg", 'GuestAssignmentsAzure2019'
        shape :guide2azure2019                                             , "#{azur19}Guide_2.svg", 'Guide2Azure2019'
        shape :guide_azure2019                                             , "#{azur19}Guide.svg", 'GuideAzure2019'
        shape :hammer_azure2019                                            , "#{azur19}Hammer.svg", 'HammerAzure2019'
        shape :hdinsight_azure2019                                         , "#{azur19}HDInsight.svg", 'HDInsightAzure2019'
        shape :hdinsight_clusters_azure2019                                , "#{azur19}HDInsightClusters.svg", 'HDInsightClustersAzure2019'
        shape :health_error_badge_azure2019                                , "#{azur19}HealthErrorBadge.svg", 'HealthErrorBadgeAzure2019'
        shape :health_warning_badge_azure2019                              , "#{azur19}HealthWarningBadge.svg", 'HealthWarningBadgeAzure2019'
        shape :heart_azure2019                                             , "#{azur19}Heart.svg", 'HeartAzure2019'
        shape :heart_pulse_azure2019                                       , "#{azur19}HeartPulse.svg", 'HeartPulseAzure2019'
        shape :home_azure2019                                              , "#{azur19}Home.svg", 'HomeAzure2019'
        shape :hybrid_connection_endpoint_azure2019                        , "#{azur19}HybridConnectionEndpoint.svg", 'HybridConnectionEndpointAzure2019'
        shape :identity_governance_azure2019                               , "#{azur19}Identity_Governance.svg", 'IdentityGovernanceAzure2019'
        shape :image_definitions_azure2019                                 , "#{azur19}Image_Definitions.svg", 'ImageDefinitionsAzure2019'
        shape :image_versions_azure2019                                    , "#{azur19}Image_Versions.svg", 'ImageVersionsAzure2019'
        shape :image_azure2019                                             , "#{azur19}Image.svg", 'ImageAzure2019'
        shape :inbound_natazure2019                                        , "#{azur19}InboundNAT.svg", 'InboundNATAzure2019'
        shape :inbound_rule_azure2019                                      , "#{azur19}InboundRule.svg", 'InboundRuleAzure2019'
        shape :information_azure2019                                       , "#{azur19}Info_2.svg", 'InformationAzure2019'
        shape :whats_new_azure2019                                         , "#{azur19}Info.svg", 'WhatsNewAzure2019'
        shape :azure_time_series_insights_events_sources_azure2019         , "#{azur19}Input.svg", 'AzureTimeSeriesInsightsEventsSourcesAzure2019'
        shape :input_output_azure2019                                      , "#{azur19}InputOutput.svg", 'InputOutputAzure2019'
        shape :install_visual_studio_azure2019                             , "#{azur19}InstallVisualStudio.svg", 'InstallVisualStudioAzure2019'
        shape :integration_accounts_azure2019                              , "#{azur19}Integration_Accounts.svg", 'IntegrationAccountsAzure2019'
        shape :integration_service_environments_azure2019                  , "#{azur19}Integration_Service_Environments.svg", 'IntegrationServiceEnvironmentsAzure2019'
        shape :intune_app_protection_azure2019                             , "#{azur19}Intune_App_Protection.svg", 'IntuneAppProtectionAzure2019'
        shape :intune_azure2019                                            , "#{azur19}Intune_App_Protection.svg", 'IntuneAzure2019'
        shape :iotedge_azure2019                                           , "#{azur19}IOT_edge.svg", 'IOTedgeAzure2019'
        shape :job_azure2019                                               , "#{azur19}Job.svg", 'JobAzure2019'
        shape :journey_hub_azure2019                                       , "#{azur19}JourneyHub.svg", 'JourneyHubAzure2019'
        shape :key_vaults_azure2019                                        , "#{azur19}Key_Vaults.svg", 'KeyVaultsAzure2019'
        shape :subscriptions_azure2019                                     , "#{azur19}Key.svg", 'SubscriptionsAzure2019'
        shape :keyboard_shortcuts_azure2019                                , "#{azur19}KeyboardShortcuts.svg", 'KeyboardShortcutsAzure2019'
        shape :key_vault_azure2019                                         , "#{azur19}KeyVault.svg", 'KeyVaultAzure2019'
        shape :kubernetes_services_azure2019                               , "#{azur19}Kubernetes_Services.svg", 'KubernetesServicesAzure2019'
        shape :kubernetes_azure2019                                        , "#{azur19}Kubernetes.svg", 'KubernetesAzure2019'
        shape :kudu_knife_azure2019                                        , "#{azur19}KuduKnife.svg", 'KuduKnifeAzure2019'
        shape :launch_portal_azure2019                                     , "#{azur19}LaunchPortal.svg", 'LaunchPortalAzure2019'
        shape :load_balancers_azure2019                                    , "#{azur19}Load_Balancer_feature.svg", 'LoadBalancersAzure2019'
        shape :load_test_azure2019                                         , "#{azur19}LoadTest.svg", 'LoadTestAzure2019'
        shape :local_network_gateways_azure2019                            , "#{azur19}Local_Network_Gateways.svg", 'LocalNetworkGatewaysAzure2019'
        shape :local_network_azure2019                                     , "#{azur19}LocalNetwork.svg", 'LocalNetworkAzure2019'
        shape :location_azure2019                                          , "#{azur19}Location.svg", 'LocationAzure2019'
        shape :log_analytics_workspaces_azure2019                          , "#{azur19}Log_Analytics_Workspaces.svg", 'LogAnalyticsWorkspacesAzure2019'
        shape :activity_log_azure2019                                      , "#{azur19}Log.svg", 'ActivityLogAzure2019'
        shape :diagnostic_settings_azure2019                               , "#{azur19}LogDiagnostics.svg", 'DiagnosticSettingsAzure2019'
        shape :logic_apps_custom_connector_azure2019                       , "#{azur19}Logic_Apps_Custom_Connector.svg", 'LogicAppsCustomConnectorAzure2019'
        shape :logic_apps_azure2019                                        , "#{azur19}Logic_Apps.svg", 'LogicAppsAzure2019'
        shape :log_streaming_azure2019                                     , "#{azur19}LogStreaming.svg", 'LogStreamingAzure2019'
        shape :machine_learning_service_workspaces_azure2019               , "#{azur19}Machine_Learning_Service_Workspaces.svg", 'MachineLearningServiceWorkspacesAzure2019'
        shape :machine_learning_studio_web_service_plans_azure2019         , "#{azur19}Machine_Learning_Studio_Web_Service_Plans.svg", 'MachineLearningStudioWebServicePlansAzure2019'
        shape :machine_learning_studio_web_services_azure2019              , "#{azur19}Machine_Learning_Studio_Web_Services.svg", 'MachineLearningStudioWebServicesAzure2019'
        shape :machine_learning_studio_workspaces_azure2019                , "#{azur19}Machine_Learning_Studio_Workspaces.svg", 'MachineLearningStudioWorkspacesAzure2019'
        shape :machine_learning_azure2019                                  , "#{azur19}Machine_Learning.svg", 'MachineLearningAzure2019'
        shape :machine_learning_service_plans_azure2019                    , "#{azur19}MachineLearningServicePlans.svg", 'MachineLearningServicePlansAzure2019'
        shape :machine_learning_web_services_azure2019                     , "#{azur19}MachineLearningWebServices.svg", 'MachineLearningWebServicesAzure2019'
        shape :machine_learning_workspaces_azure2019                       , "#{azur19}MachineLearningWorkspaces.svg", 'MachineLearningWorkspacesAzure2019'
        shape :managed_applications_azure2019                              , "#{azur19}Managed_Applications.svg", 'ManagedApplicationsAzure2019'
        shape :managed_databases_azure2019                                 , "#{azur19}Managed_Databases.svg", 'ManagedDatabasesAzure2019'
        shape :managed_desktop_azure2019                                   , "#{azur19}Managed_Desktop.svg", 'ManagedDesktopAzure2019'
        shape :managed_identities_azure2019                                , "#{azur19}Managed_Identities.svg", 'ManagedIdentitiesAzure2019'
        shape :managed_applications_azure2019                              , "#{azur19}ManagedApplications.svg", 'ManagedApplicationsAzure2019_'
        shape :management_groups_azure2019                                 , "#{azur19}Management_Groups.svg", 'ManagementGroupsAzure2019'
        shape :management_portal_azure2019                                 , "#{azur19}Management_Portal.svg", 'ManagementPortalAzure2019'
        shape :manage_portal_azure2019                                     , "#{azur19}ManagePortal.svg", 'ManagePortalAzure2019'
        shape :disk_snapshots_azure2019                                    , "#{azur19}MD_snapshot.svg", 'DiskSnapshotsAzure2019'
        shape :media_encoding_azure2019                                    , "#{azur19}Media_Encoding.svg", 'MediaEncodingAzure2019'
        shape :media_on_demand_azure2019                                   , "#{azur19}Media_On_Demand.svg", 'MediaOnDemandAzure2019'
        shape :media_services_azure2019                                    , "#{azur19}Media_Services.svg", 'MediaServicesAzure2019'
        shape :azure_media_services_azure2019                              , "#{azur19}Media_Services.svg", 'AzureMediaServicesAzure2019'
        shape :media_file_azure2019                                        , "#{azur19}MediaFile.svg", 'MediaFileAzure2019'
        shape :migration_projects_azure2019                                , "#{azur19}Migration_Projects.svg", 'MigrationProjectsAzure2019'
        shape :azure_mobile_engagement_azure2019                           , "#{azur19}Mobile_Engagement.svg", 'AzureMobileEngagementAzure2019'
        shape :module_azure2019                                            , "#{azur19}Module.svg", 'ModuleAzure2019'
        shape :monitor_azure2019                                           , "#{azur19}Monitor.svg", 'MonitorAzure2019'
        shape :monitoring_azure2019                                        , "#{azur19}Monitoring.svg", 'MonitoringAzure2019'
        shape :multi_factor_authentication_azure2019                       , "#{azur19}Multi_Factor_Authentication.svg", 'MultiFactorAuthenticationAzure2019'
        shape :my_sqlclear_dbdatabase_azure2019                            , "#{azur19}MySQL_ClearDB_database.svg", 'MySQLClearDBdatabaseAzure2019'
        shape :network_security_groups_classic_azure2019                   , "#{azur19}Network_Security_Groups_Classic.svg", 'NetworkSecurityGroupsClassicAzure2019'
        shape :network_watcher_azure2019                                   , "#{azur19}Network_watcher.svg", 'NetworkWatcherAzure2019'
        shape :network_interfaces_azure2019                                , "#{azur19}NetworkInterfaceCard.svg", 'NetworkInterfacesAzure2019'
        shape :new_azure2019                                               , "#{azur19}New.svg", 'NewAzure2019'
        shape :next_bill_azure2019                                         , "#{azur19}NextBill.svg", 'NextBillAzure2019'
        shape :non_azure_machine_azure2019                                 , "#{azur19}Non_Azure_Machine.svg", 'NonAzureMachineAzure2019'
        shape :notification_hubs_azure2019                                 , "#{azur19}Notification_Hubs.svg", 'NotificationHubsAzure2019'
        shape :notification_hub_namespaces_azure2019                       , "#{azur19}Notification_Hubs.svg", 'NotificationHubNamespacesAzure2019'
        shape :alerts_azure2019                                            , "#{azur19}Notification.svg", 'AlertsAzure2019'
        shape :nsgazure2019                                                , "#{azur19}NSG.svg", 'NSGAzure2019'
        shape :offer_azure2019                                             , "#{azur19}Offer.svg", 'OfferAzure2019'
        shape :on_premises_data_gateways_azure2019                         , "#{azur19}On_Premises_Data_Gateways.svg", 'OnPremisesDataGatewaysAzure2019'
        shape :on_premise_setup_azure2019                                  , "#{azur19}OnPremiseSetup.svg", 'OnPremiseSetupAzure2019'
        shape :azure_open_shift_azure2019                                  , "#{azur19}OpenShift.svg", 'AzureOpenShiftAzure2019'
        shape :operations_management_suite_azure2019                       , "#{azur19}Operations_Management_Suite.svg", 'OperationsManagementSuiteAzure2019'
        shape :osimages_classic_azure2019                                  , "#{azur19}OS_Images_Classic.svg", 'OSImagesClassicAzure2019'
        shape :outbound_natazure2019                                       , "#{azur19}OutboundNAT.svg", 'OutboundNATAzure2019'
        shape :outbound_rule_azure2019                                     , "#{azur19}OutboundRule.svg", 'OutboundRuleAzure2019'
        shape :output_azure2019                                            , "#{azur19}Output.svg", 'OutputAzure2019'
        shape :overage_costs_azure2019                                     , "#{azur19}overageCosts.svg", 'overageCostsAzure2019'
        shape :paused_azure2019                                            , "#{azur19}Paused.svg", 'PausedAzure2019'
        shape :peerings_azure2019                                          , "#{azur19}Peerings.svg", 'PeeringsAzure2019'
        shape :pending_azure2019                                           , "#{azur19}Pending.svg", 'PendingAzure2019'
        shape :user_icon_azure2019                                         , "#{azur19}Person.svg", 'UserIconAzure2019'
        shape :person_with_friend_azure2019                                , "#{azur19}PersonWithFriend.svg", 'PersonWithFriendAzure2019'
        shape :phone_azure2019                                             , "#{azur19}Phone.svg", 'PhoneAzure2019'
        shape :pluralsight_azure2019                                       , "#{azur19}PluralSight_mono.svg", 'PluralsightAzure2019'
        shape :policy_azure2019                                            , "#{azur19}Policy.svg", 'PolicyAzure2019'
        shape :portal_current_azure2019                                    , "#{azur19}PortalCurrent.svg", 'PortalCurrentAzure2019'
        shape :postpone_azure2019                                          , "#{azur19}Postpone.svg", 'PostponeAzure2019'
        shape :power_azure2019                                             , "#{azur19}Power.svg", 'PowerAzure2019'
        shape :powershell_azure2019                                        , "#{azur19}Powershell.svg", 'PowershellAzure2019'
        shape :power_up2azure2019                                          , "#{azur19}PowerUp_2.svg", 'PowerUp2Azure2019'
        shape :power_up_azure2019                                          , "#{azur19}PowerUp.svg", 'PowerUpAzure2019'
        shape :preview_right_azure2019                                     , "#{azur19}PreviewRight.svg", 'PreviewRightAzure2019'
        shape :probe_azure2019                                             , "#{azur19}Probe.svg", 'ProbeAzure2019'
        shape :process_explorer_azure2019                                  , "#{azur19}ProcessExplorer.svg", 'ProcessExplorerAzure2019'
        shape :production_ready_dbazure2019                                , "#{azur19}ProductionReadyDB.svg", 'ProductionReadyDBAzure2019'
        shape :publish_azure2019                                           , "#{azur19}Publish.svg", 'PublishAzure2019'
        shape :pull_request_azure2019                                      , "#{azur19}PullRequest.svg", 'PullRequestAzure2019'
        shape :qsdiagnostics_azure2019                                     , "#{azur19}QSDiagnostics.svg", 'QSDiagnosticsAzure2019'
        shape :qsfile_azure2019                                            , "#{azur19}QSFile.svg", 'QSFileAzure2019'
        shape :qsmail_azure2019                                            , "#{azur19}QSMail.svg", 'QSMailAzure2019'
        shape :qswarning_azure2019                                         , "#{azur19}QSWarning.svg", 'QSWarningAzure2019'
        shape :queued_azure2019                                            , "#{azur19}Queued.svg", 'QueuedAzure2019'
        shape :queues_storage_azure2019                                    , "#{azur19}Queues_Storage.svg", 'QueuesStorageAzure2019'
        shape :quick_start_center_azure2019                                , "#{azur19}Quick_Start_Center.svg", 'QuickStartCenterAzure2019'
        shape :quickstart_azure2019                                        , "#{azur19}Quickstart.svg", 'QuickstartAzure2019'
        shape :quota_azure2019                                             , "#{azur19}Quota.svg", 'QuotaAzure2019'
        shape :rain_azure2019                                              , "#{azur19}Rain.svg", 'RainAzure2019'
        shape :rdmaazure2019                                               , "#{azur19}RDMA.svg", 'RDMAAzure2019'
        shape :recommendation_azure2019                                    , "#{azur19}Recommendation.svg", 'RecommendationAzure2019'
        shape :remote_app_azure2019                                        , "#{azur19}RemoteApp.svg", 'RemoteAppAzure2019'
        shape :reservations_azure2019                                      , "#{azur19}Reservations.svg", 'ReservationsAzure2019'
        shape :resource_explorer_azure2019                                 , "#{azur19}Resource_Explorer.svg", 'ResourceExplorerAzure2019'
        shape :resource_graph_explorer_azure2019                           , "#{azur19}Resource_Graph_Explorer.svg", 'ResourceGraphExplorerAzure2019'
        shape :resource_groups_azure2019                                   , "#{azur19}Resource_Groups.svg", 'ResourceGroupsAzure2019'
        shape :resource_default_azure2019                                  , "#{azur19}ResourceDefault.svg", 'ResourceDefaultAzure2019'
        shape :resource_group_azure2019                                    , "#{azur19}ResourceGroup.svg", 'ResourceGroupAzure2019'
        shape :resource_linked_azure2019                                   , "#{azur19}ResourceLinked.svg", 'ResourceLinkedAzure2019'
        shape :resource_provider_azure2019                                 , "#{azur19}ResourceProvider.svg", 'ResourceProviderAzure2019'
        shape :resource_role_azure2019                                     , "#{azur19}ResourceRole.svg", 'ResourceRoleAzure2019'
        shape :route_filters_azure2019                                     , "#{azur19}Route_Filter.svg", 'RouteFiltersAzure2019'
        shape :rule_azure2019                                              , "#{azur19}Rule.svg", 'RuleAzure2019'
        shape :runbooks_azure2019                                          , "#{azur19}Runbooks.svg", 'RunbooksAzure2019'
        shape :runbook_source_azure2019                                    , "#{azur19}RunbookSource.svg", 'RunbookSourceAzure2019'
        shape :saphanaon_azure_azure2019                                   , "#{azur19}SAP_HANA_on_Azure.svg", 'SAPHANAonAzureAzure2019'
        shape :scale_azure2019                                             , "#{azur19}Scale.svg", 'ScaleAzure2019'
        shape :scale_alt_azure2019                                         , "#{azur19}ScaleAlt.svg", 'ScaleAltAzure2019'
        shape :scheduler_job_azure2019                                     , "#{azur19}SchedulerJob.svg", 'SchedulerJobAzure2019'
        shape :scheduler_job_collections_azure2019                         , "#{azur19}SchedulerJobCollection.svg", 'SchedulerJobCollectionsAzure2019'
        shape :sdkazure2019                                                , "#{azur19}SDK.svg", 'SDKAzure2019'
        shape :search_azure2019                                            , "#{azur19}Search.svg", 'SearchAzure2019'
        shape :azure_search_azure2019                                      , "#{azur19}Search.svg", 'AzureSearchAzure2019'
        shape :search_grid_azure2019                                       , "#{azur19}SearchGrid.svg", 'SearchGridAzure2019'
        shape :security_baselines_azure2019                                , "#{azur19}Security_Baselines.svg", 'SecurityBaselinesAzure2019'
        shape :conditional_access_azure2019                                , "#{azur19}Security_Center.svg", 'ConditionalAccessAzure2019'
        shape :security_center_azure2019                                   , "#{azur19}Security_Center.svg", 'SecurityCenterAzure2019'
        shape :send_grid_accounts_azure2019                                , "#{azur19}SendGrid_Accounts.svg", 'SendGridAccountsAzure2019'
        shape :server_azure2019                                            , "#{azur19}Server.svg", 'ServerAzure2019'
        shape :server_farm_azure2019                                       , "#{azur19}ServerFarm.svg", 'ServerFarmAzure2019'
        shape :server_proxy_azure2019                                      , "#{azur19}ServerProxy.svg", 'ServerProxyAzure2019'
        shape :servers_and_mobile_devices_azure2019                        , "#{azur19}serversAndMobileDevices.svg", 'serversAndMobileDevicesAzure2019'
        shape :service_bus_queues_azure2019                                , "#{azur19}Service_Bus_Queues.svg", 'ServiceBusQueuesAzure2019'
        shape :azure_service_bus_relays_azure2019                          , "#{azur19}Service_Bus_Relay.svg", 'AzureServiceBusRelaysAzure2019'
        shape :service_bus_topics_azure2019                                , "#{azur19}Service_Bus_Topics.svg", 'ServiceBusTopicsAzure2019'
        shape :azure_service_bus_azure2019                                 , "#{azur19}Service_Bus.svg", 'AzureServiceBusAzure2019'
        shape :service_catalog_managed_application_definitions_azure2019   , "#{azur19}Service_Catalog_Managed_Application_Definitions.svg", 'ServiceCatalogManagedApplicationDefinitionsAzure2019'
        shape :service_endpoint_policies_azure2019                         , "#{azur19}Service_Endpoint_Policies.svg", 'ServiceEndpointPoliciesAzure2019'
        shape :service_fabric_clusters_azure2019                           , "#{azur19}Service_Fabric.svg", 'ServiceFabricClustersAzure2019'
        shape :service_health_azure2019                                    , "#{azur19}ServiceHealth.svg", 'ServiceHealthAzure2019'
        shape :shared_dashboard_azure2019                                  , "#{azur19}Shared_Dashboard.svg", 'SharedDashboardAzure2019'
        shape :shared_image_galleries_azure2019                            , "#{azur19}Shared_Image_Galleries.svg", 'SharedImageGalleriesAzure2019'
        shape :shield_firewall_azure2019                                   , "#{azur19}ShieldFirewall.svg", 'ShieldFirewallAzure2019'
        shape :signal_razure2019                                           , "#{azur19}SignalR.svg", 'SignalRAzure2019'
        shape :site_recovery_azure2019                                     , "#{azur19}Site_Recovery.svg", 'SiteRecoveryAzure2019'
        shape :softwareasa_service_saa_sazure2019                          , "#{azur19}Software_as_a_Service.svg", 'SoftwareasaServiceSaaSAzure2019'
        shape :software_update_azure2019                                   , "#{azur19}Software_Update.svg", 'SoftwareUpdateAzure2019'
        shape :solutions_azure2019                                         , "#{azur19}Solutions.svg", 'SolutionsAzure2019'
        shape :spatial_anchor_azure2019                                    , "#{azur19}Spatial_Anchor.svg", 'SpatialAnchorAzure2019'
        shape :sqldatabases_azure2019                                      , "#{azur19}SQL_Database_generic.svg", 'SQLDatabasesAzure2019'
        shape :azure_sqldata_warehouse_azure2019                           , "#{azur19}SQL_DataWarehouse.svg", 'AzureSQLDataWarehouseAzure2019'
        shape :sqlmanaged_instances_azure2019                              , "#{azur19}SQL_Managed_Instances.svg", 'SQLManagedInstancesAzure2019'
        shape :sqlservers_azure2019                                        , "#{azur19}SQL_Servers.svg", 'SQLServersAzure2019'
        shape :sqlstretch_database_azure2019                               , "#{azur19}SQL_Stretch_Database.svg", 'SQLStretchDatabaseAzure2019'
        shape :sqlserver_stretch_databases_azure2019                       , "#{azur19}dep/SQL_Server_Stretch_DB.svg", 'SQLServerStretchDatabasesAzure2019'
        shape :sqlquery_performance_check_azure2019                        , "#{azur19}SQLQueryPerformanceCheck.svg", 'SQLQueryPerformanceCheckAzure2019'
        shape :ssdazure2019                                                , "#{azur19}SSD.svg", 'SSDAzure2019'
        shape :stack_overflow_azure2019                                    , "#{azur19}StackOverflow.svg", 'StackOverflowAzure2019'
        shape :storage_accounts_azure2019                                  , "#{azur19}Storage_Accounts.svg", 'StorageAccountsAzure2019'
        shape :storage_explorer_azure2019                                  , "#{azur19}Storage_Explorer.svg", 'StorageExplorerAzure2019'
        shape :storage_sync_services_azure2019                             , "#{azur19}Storage_sync_service.svg", 'StorageSyncServicesAzure2019'
        shape :storage_azure2019                                           , "#{azur19}Storage.svg", 'StorageAzure2019'
        shape :storage_azure_files_azure2019                               , "#{azur19}StorageAzureFiles.svg", 'StorageAzureFilesAzure2019'
        shape :storage_container_azure2019                                 , "#{azur19}StorageContainer.svg", 'StorageContainerAzure2019'
        shape :storage_queue_azure2019                                     , "#{azur19}StorageQueue.svg", 'StorageQueueAzure2019'
        shape :storage_replica_azure2019                                   , "#{azur19}StorageReplica.svg", 'StorageReplicaAzure2019'
        shape :marketplace_azure2019                                       , "#{azur19}Store_Marketplace.svg", 'MarketplaceAzure2019'
        shape :stor_simple_data_managers_azure2019                         , "#{azur19}StorSimple_Data_Managers.svg", 'StorSimpleDataManagersAzure2019'
        shape :azure_stor_simple_device_managers_azure2019                 , "#{azur19}StorSimple.svg", 'AzureStorSimpleDeviceManagersAzure2019'
        shape :stor_simple_device_managers_azure2019                       , "#{azur19}StorSimple.svg", 'StorSimpleDeviceManagersAzure2019'
        shape :stream_analytics_jobs_azure2019                             , "#{azur19}Stream_Analytics.svg", 'StreamAnalyticsJobsAzure2019'
        shape :subnet_azure2019                                            , "#{azur19}Subnet.svg", 'SubnetAzure2019'
        shape :help_support_azure2019                                      , "#{azur19}Support_2.svg", 'HelpSupportAzure2019'
        shape :support_requests_azure2019                                  , "#{azur19}Support_Requests.svg", 'SupportRequestsAzure2019'
        shape :support_azure2019                                           , "#{azur19}Support.svg", 'SupportAzure2019'
        shape :table_storage_azure2019                                     , "#{azur19}Table_Storage.svg", 'TableStorageAzure2019'
        shape :tag_azure2019                                               , "#{azur19}Tag.svg", 'TagAzure2019'
        shape :tags_azure2019                                              , "#{azur19}Tags.svg", 'TagsAzure2019'
        shape :task_azure2019                                              , "#{azur19}Task.svg", 'TaskAzure2019'
        shape :tasks_azure2019                                             , "#{azur19}Tasks.svg", 'TasksAzure2019'
        shape :tasks_polychromatic_azure2019                               , "#{azur19}TasksPolychromatic.svg", 'TasksPolychromaticAzure2019'
        shape :task_vmazure2019                                            , "#{azur19}TaskVM.svg", 'TaskVMAzure2019'
        shape :tax_azure2019                                               , "#{azur19}Tax.svg", 'TaxAzure2019'
        shape :team_project_azure2019                                      , "#{azur19}TeamProject.svg", 'TeamProjectAzure2019'
        shape :templates_azure2019                                         , "#{azur19}Templates.svg", 'TemplatesAzure2019'
        shape :tenant_status_azure2019                                     , "#{azur19}Tenant_Status.svg", 'TenantStatusAzure2019'
        shape :tfsvcrepository_azure2019                                   , "#{azur19}TFSVCRepository.svg", 'TFSVCRepositoryAzure2019'
        shape :azure_time_series_insights_environments_azure2019           , "#{azur19}Time_Series_Insights_environments.svg", 'AzureTimeSeriesInsightsEnvironmentsAzure2019'
        shape :time_series_insights_azure2019                              , "#{azur19}TimeSeriesInsights.svg", 'TimeSeriesInsightsAzure2019'
        shape :toolbox_azure2019                                           , "#{azur19}Toolbox.svg", 'ToolboxAzure2019'
        shape :tools_azure2019                                             , "#{azur19}Tools.svg", 'ToolsAzure2019'
        shape :traffic_manager_profiles_azure2019                          , "#{azur19}Traffic_Manager.svg", 'TrafficManagerProfilesAzure2019'
        shape :traffic_manager_disabled_azure2019                          , "#{azur19}TrafficManagerDisabled.svg", 'TrafficManagerDisabledAzure2019'
        shape :traffic_manager_enabled_azure2019                           , "#{azur19}TrafficManagerEnabled.svg", 'TrafficManagerEnabledAzure2019'
        shape :two_user_icon_azure2019                                     , "#{azur19}Two_User_Icon.svg", 'TwoUserIconAzure2019'
        shape :unidentified_feature_object_azure2019                       , "#{azur19}Unidentified_Feature_Object.svg", 'UnidentifiedFeatureObjectAzure2019'
        shape :user_health_icon_azure2019                                  , "#{azur19}User_Health_Icon.svg", 'UserHealthIconAzure2019'
        shape :user_privacy_azure2019                                      , "#{azur19}User_Privacy.svg", 'UserPrivacyAzure2019'
        shape :user_resource_azure2019                                     , "#{azur19}User_Resource.svg", 'UserResourceAzure2019'
        shape :route_tables_azure2019                                      , "#{azur19}UserDefinedRoute.svg", 'RouteTablesAzure2019'
        shape :variables_azure2019                                         , "#{azur19}Variables.svg", 'VariablesAzure2019'
        shape :versions_azure2019                                          , "#{azur19}Versions.svg", 'VersionsAzure2019'
        shape :virtual_clusters_azure2019                                  , "#{azur19}Virtual_Clusters.svg", 'VirtualClustersAzure2019'
        shape :virtual_datacenter_azure2019                                , "#{azur19}Virtual_Datacenter.svg", 'VirtualDatacenterAzure2019'
        shape :vmclassic_azure2019                                         , "#{azur19}Virtual_Machine_2.svg", 'VMClassicAzure2019'
        shape :vmazure2019                                                 , "#{azur19}Virtual_Machine.svg", 'VMAzure2019'
        shape :availability_sets_azure2019                                 , "#{azur19}Virtual_Machines_Availability_Set.svg", 'AvailabilitySetsAzure2019'
        shape :virtual_machines_linux_azure2019                            , "#{azur19}Virtual_Machines_Linux.svg", 'VirtualMachinesLinuxAzure2019'
        shape :virtual_network_classic_azure2019                           , "#{azur19}Virtual_Network_Classic.svg", 'VirtualNetworkClassicAzure2019'
        shape :virtual_networks_azure2019                                  , "#{azur19}Virtual_Network.svg", 'VirtualNetworksAzure2019'
        shape :virtual_wans_azure2019                                      , "#{azur19}Virtual_WANs.svg", 'VirtualWANsAzure2019'
        shape :virtual_machine_linux_azure2019                             , "#{azur19}VirtualMachineLinux.svg", 'VirtualMachineLinuxAzure2019'
        shape :vmwindows_azure2019                                         , "#{azur19}VirtualMachineWindows.svg", 'VMWindowsAzure2019'
        shape :visual_studio_team_services_code_plexsource_azure2019       , "#{azur19}Visual_Studio_Team_Services_CodePlex_source.svg", 'VisualStudioTeamServicesCodePlexsourceAzure2019'
        shape :vmimages_azure2019                                          , "#{azur19}VM_Images.svg", 'VMImagesAzure2019'
        shape :vmlinux_non_azure_azure2019                                 , "#{azur19}VM_Linux_Non_Azure.svg", 'VMLinuxNonAzureAzure2019'
        shape :vmlinux_azure2019                                           , "#{azur19}VM_Linux.svg", 'VMLinuxAzure2019'
        shape :vmscale_sets_azure2019                                      , "#{azur19}VM_Scale_Set.svg", 'VMScaleSetsAzure2019'
        shape :vmwindows_non_azure_azure2019                               , "#{azur19}VM_Windows_Non_Azure.svg", 'VMWindowsNonAzureAzure2019'
        shape :vmscale_azure2019                                           , "#{azur19}VMScale.svg", 'VMScaleAzure2019'
        shape :virtual_network_gateways_azure2019                          , "#{azur19}VPN_Gateway.svg", 'VirtualNetworkGatewaysAzure2019'
        shape :vpnpoint_to_site_azure2019                                  , "#{azur19}VPNPointToSite.svg", 'VPNPointToSiteAzure2019'
        shape :vpnsite_to_site_azure2019                                   , "#{azur19}VPNSiteToSite.svg", 'VPNSiteToSiteAzure2019'
        shape :web_app_firewall_azure2019                                  , "#{azur19}Web_App_Firewall.svg", 'WebAppFirewallAzure2019'
        shape :web_app_web_jobs_azure2019                                  , "#{azur19}WebApp_WebJobs.svg", 'WebAppWebJobsAzure2019'
        shape :umbraco_azure2019                                           , "#{azur19}WebAppUmbraco.svg", 'UmbracoAzure2019'
        shape :word_press_azure2019                                        , "#{azur19}WebAppWordPress.svg", 'WordPressAzure2019'
        shape :web_environment_azure2019                                   , "#{azur19}WebEnvironment.svg", 'WebEnvironmentAzure2019'
        shape :webhooks_azure2019                                          , "#{azur19}Webhooks.svg", 'WebhooksAzure2019'
        shape :web_hosting_azure2019                                       , "#{azur19}WebHosting.svg", 'WebHostingAzure2019'
        shape :app_service_plans_azure2019                                 , "#{azur19}WebHosting.svg", 'AppServicePlansAzure2019'
        shape :web_network_azure2019                                       , "#{azur19}WebNetwork.svg", 'WebNetworkAzure2019'
        shape :website_power_azure2019                                     , "#{azur19}WebsitePower.svg", 'WebsitePowerAzure2019'
        shape :website_replicator_azure2019                                , "#{azur19}WebsiteReplicator.svg", 'WebsiteReplicatorAzure2019'
        shape :website_settings_azure2019                                  , "#{azur19}WebsiteSettings.svg", 'WebsiteSettingsAzure2019'
        shape :website_staging_azure2019                                   , "#{azur19}WebsiteStaging.svg", 'WebsiteStagingAzure2019'
        shape :web_slots_azure2019                                         , "#{azur19}WebSlots.svg", 'WebSlotsAzure2019'
        shape :web_test_azure2019                                          , "#{azur19}WebTest.svg", 'WebTestAzure2019'
        shape :windows10io_tcore_services_azure2019                        , "#{azur19}Windows_10_IoT_Core_Services.svg", 'Windows10IoTCoreServicesAzure2019'
        shape :workflow_azure2019                                          , "#{azur19}Workflow.svg", 'WorkflowAzure2019'
        shape :wrench_azure2019                                            , "#{azur19}Wrench.svg", 'WrenchAzure2019'
        shape :xbox_controller_azure2019                                   , "#{azur19}XboxController.svg", 'XboxControllerAzure2019'
        shape :hockey_app_azure2019                                        ,
              'shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;shape=mxgraph.mscae.cloud.hockeyapp;fillColor=#0079D6;pointerEvents=1', 'HockeyAppAzure2019'
        shape :app_service_logic_app_azure2019                             , "#{azur19}dep/App_Service_Logic_App.svg", 'AppServiceLogicAppAzure2019'
        shape :content_delivery_network_azure2019                          , "#{azur19}dep/Content_Delivery_Network.svg", 'ContentDeliveryNetworkAzure2019'
        shape :data_lake_store_azure2019                                   , "#{azur19}dep/Data_Lake_Store.svg", 'DataLakeStoreAzure2019'
        shape :azure_information_protection_azure2019                      ,
              'aspect=fixed;shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;shape=mxgraph.mscae.cloud.azure_rights_management_rms;fillColor=#58B4D9;', 'AzureInformationProtectionAzure2019'
        shape :io_tcentral_applications_azure2019                          ,
              'aspect=fixed;shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;shape=mxgraph.mscae.cloud.central;fillColor=#0079D6;pointerEvents=1', 'IoTCentralApplicationsAzure2019'
      end
      section :cisco_basic do
        shape :cisco_cisco_androgenous_person                              , "#{s}cisco.people.androgenous_person; + c", 'Cisco_cisco_androgenous_person'
        shape :cisco_cisco_atm_switch                                      , "#{s}cisco.switches.atm_switch; + c", 'Cisco_cisco_atm_switch'
        shape :cisco_cisco_cloud                                           , "#{s}cisco.storage.cloud;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897;fillColor=#ffffff",
              'Cisco_cisco_cloud'
        shape :cisco_cisco_fileserver                                      , "#{s}cisco.servers.fileserver; + c", 'Cisco_cisco_fileserver'
        shape :cisco_cisco_firewall                                        , "#{s}cisco.security.firewall; + c", 'Cisco_cisco_firewall'
        shape :cisco_cisco_generic_building                                , "#{s}cisco.buildings.generic_building; + c", 'Cisco_cisco_generic_building'
        shape :cisco_cisco_laptop                                          , "#{s}cisco.computers_and_peripherals.laptop; + c", 'Cisco_cisco_laptop'
        shape :cisco_cisco_lock                                            , "#{s}cisco.security.lock; + c", 'Cisco_cisco_lock'
        shape :cisco_cisco_microwebserver                                  , "#{s}cisco.servers.microwebserver; + c", 'Cisco_cisco_microwebserver'
        shape :cisco_cisco_pc                                              , "#{s}cisco.computers_and_peripherals.pc; + c", 'Cisco_cisco_pc'
        shape :cisco_cisco_pda                                             , "#{s}cisco.misc.pda; + c", 'Cisco_cisco_pda'
        shape :cisco_cisco_phone                                           , "#{s}cisco.modems_and_phones.hootphone; + c", 'Cisco_cisco_phone'
        shape :cisco_cisco_printer                                         , "#{s}cisco.computers_and_peripherals.printer; + c", 'Cisco_cisco_printer'
        shape :cisco_cisco_relational_database                             , "#{s}cisco.storage.relational_database; + c", 'Cisco_cisco_relational_database'
        shape :cisco_cisco_router                                          , "#{s}cisco.routers.router; + c", 'Cisco_cisco_router'
        shape :cisco_cisco_standing_man                                    , "#{s}cisco.people.standing_man; + c", 'Cisco_cisco_standing_man'
        shape :cisco_cisco_standing_woman                                  , "#{s}cisco.people.standing_woman; + c", 'Cisco_cisco_standing_woman'
        shape :cisco_cisco_ups                                             , "#{s}cisco.misc.ups; + c", 'Cisco_cisco_ups'
        shape :cisco_cisco_wireless_router                                 , "#{s}cisco.routers.wireless_router; + c", 'Cisco_cisco_wireless_router'
      end
      section :cisco_extended do
        shape :cisco_cisco_100baset_hub                                    , "#{s}cisco.hubs_and_gateways.100baset_hub; + c", 'Cisco_cisco_100baset_hub'
        shape :cisco_cisco_10700                                           , "#{s}cisco.routers.10700; + c", 'Cisco_cisco_10700'
        shape :cisco_cisco_10ge_fco_e                                      , "#{s}cisco.controllers_and_modules.10ge_fcoe; + c", 'Cisco_cisco_10GE_FCoE'
        shape :cisco_cisco_15200                                           , "#{s}cisco.misc.15200; + c", 'Cisco_cisco_15200'
        shape :cisco_cisco_3174_desktop                                    , "#{s}cisco.controllers_and_modules.3174_(desktop)_cluster_controller; + c", 'Cisco_cisco_3174__desktop_'
        shape :cisco_cisco_3200_mobile_access_router                       , "#{s}cisco.routers.mobile_access_router; + c", 'Cisco_cisco_3200_mobile_access_router'
        shape :cisco_cisco_3x74_floor                                      , "#{s}cisco.controllers_and_modules.3x74_(floor)_cluster_controller; + c", 'Cisco_cisco_3x74__floor_'
        shape :cisco_cisco_6700_series                                     , "#{s}cisco.misc.6700_series; + c", 'Cisco_cisco_6700_series'
        shape :cisco_cisco_7500ars_7513                                    , "#{s}cisco.misc.7500ars_(7513); + c", 'Cisco_cisco_7500ars__7513_'
        shape :cisco_cisco_accesspoint                                     , "#{s}cisco.misc.access_point; + c", 'Cisco_cisco_accesspoint'
        shape :cisco_cisco_ace                                             , "#{s}cisco.misc.ace; + c", 'Cisco_cisco_ace'
        shape :cisco_cisco_acs                                             , "#{s}cisco.misc.acs; + c", 'Cisco_cisco_ACS'
        shape :cisco_cisco_adm                                             , "#{s}cisco.misc.adm; + c", 'Cisco_cisco_adm'
        shape :cisco_cisco_antenna                                         , "#{s}cisco.wireless.antenna; + c", 'Cisco_cisco_antenna'
        shape :cisco_cisco_asic_processor                                  , "#{s}cisco.misc.asic_processor; + c", 'Cisco_cisco_asic_processor'
        shape :cisco_cisco_asr_1000_series                                 , "#{s}cisco.misc.asr_1000_series; + c", 'Cisco_cisco_ASR_1000_Series'
        shape :cisco_cisco_ata                                             , "#{s}cisco.misc.ata; + c", 'Cisco_cisco_ata'
        shape :cisco_cisco_atm_3800                                        , "#{s}cisco.misc.atm_3800; + c", 'Cisco_cisco_atm_3800'
        shape :cisco_cisco_atm_fast_gigabit_etherswitch                    , "#{s}cisco.switches.atm_fast_gigabit_etherswitch; + c", 'Cisco_cisco_atm_fast_gigabit_etherswitch'
        shape :cisco_cisco_atm_router                                      , "#{s}cisco.routers.atm_router; + c", 'Cisco_cisco_atm_router'
        shape :cisco_cisco_atm_tag_switch_router                           , "#{s}cisco.routers.atm_tag_switch_router; + c", 'Cisco_cisco_atm_tag_switch_router'
        shape :cisco_cisco_avs                                             , "#{s}cisco.misc.avs; + c", 'Cisco_cisco_avs'
        shape :cisco_cisco_axp                                             , "#{s}cisco.misc.axp; + c", 'Cisco_cisco_AXP'
        shape :cisco_cisco_bbsm                                            , "#{s}cisco.misc.bbsm; + c", 'Cisco_cisco_bbsm'
        shape :cisco_cisco_branch_office                                   , "#{s}cisco.buildings.branch_office; + c", 'Cisco_cisco_branch_office'
        shape :cisco_cisco_breakout_box                                    , "#{s}cisco.misc.breakout_box; + c", 'Cisco_cisco_breakout_box'
        shape :cisco_cisco_bridge                                          , "#{s}cisco.misc.bridge; + c", 'Cisco_cisco_bridge'
        shape :cisco_cisco_broadband_router                                , "#{s}cisco.routers.broadcast_router; + c", 'Cisco_cisco_broadband_router'
        shape :cisco_cisco_bts_10200                                       , "#{s}cisco.misc.bts_10200; + c", 'Cisco_cisco_bts_10200'
        shape :cisco_cisco_cable_modem                                     , "#{s}cisco.modems_and_phones.cable_modem; + c", 'Cisco_cisco_cable_modem'
        shape :cisco_cisco_callmanager                                     , "#{s}cisco.misc.call_manager; + c", 'Cisco_cisco_callmanager'
        shape :cisco_cisco_car                                             , "#{s}cisco.misc.car; + c", 'Cisco_cisco_car'
        shape :cisco_cisco_carrier_routing_system                          , "#{s}cisco.misc.carrier_routing_system; + c", 'Cisco_cisco_carrier_routing_system'
        shape :cisco_cisco_cddi_fddi                                       , "#{s}cisco.misc.cddi_fddi; + c", 'Cisco_cisco_cddi_fddi'
        shape :cisco_cisco_cdm                                             , "#{s}cisco.misc.cdm; + c", 'Cisco_cisco_cdm'
        shape :cisco_cisco_cellular_phone                                  , "#{s}cisco.modems_and_phones.cell_phone; + c", 'Cisco_cisco_cellular_phone'
        shape :cisco_cisco_centri_firewall                                 , "#{s}cisco.security.centri_firewall; + c", 'Cisco_cisco_centri_firewall'
        shape :cisco_cisco_cisco_1000                                      , "#{s}cisco.misc.cisco_1000; + c", 'Cisco_cisco_cisco_1000'
        shape :cisco_cisco_cisco_asa_5500                                  , "#{s}cisco.misc.asa_5500; + c", 'Cisco_cisco_cisco_asa_5500'
        shape :cisco_cisco_cisco_ca                                        , "#{s}cisco.misc.cisco_ca; + c", 'Cisco_cisco_cisco_ca'
        shape :cisco_cisco_cisco_file_engine                               , "#{s}cisco.storage.cisco_file_engine; + c", 'Cisco_cisco_cisco_file_engine'
        shape :cisco_cisco_cisco_hub                                       , "#{s}cisco.hubs_and_gateways.cisco_hub; + c", 'Cisco_cisco_cisco_hub'
        shape :cisco_cisco_ciscosecurity                                   , "#{s}cisco.security.cisco_security; + c", 'Cisco_cisco_ciscosecurity'
        shape :cisco_cisco_cisco_unified_presence_server                   , "#{s}cisco.servers.cisco_unified_presence_server; + c", 'Cisco_cisco_cisco_unified_presence_server'
        shape :cisco_cisco_cisco_unityexpress                              , "#{s}cisco.misc.cisco_unity_express; + c", 'Cisco_cisco_cisco_unityexpress'
        shape :cisco_cisco_ciscoworks                                      , "#{s}cisco.misc.cisco_works; + c", 'Cisco_cisco_ciscoworks'
        shape :cisco_cisco_class_4_5_switch                                , "#{s}cisco.switches.class_4_5_switch; + c", 'Cisco_cisco_class_4_5_switch'
        shape :cisco_cisco_communications_server                           , "#{s}cisco.servers.communications_server; + c", 'Cisco_cisco_communications_server'
        shape :cisco_cisco_contact_center                                  , "#{s}cisco.misc.contact_center; + c", 'Cisco_cisco_contact_center'
        shape :cisco_cisco_content_engine_cache_director                   , "#{s}cisco.directors.content_engine_(cache_director); + c", 'Cisco_cisco_content_engine__cache_director_'
        shape :cisco_cisco_content_service_router                          , "#{s}cisco.routers.content_service_router; + c", 'Cisco_cisco_content_service_router'
        shape :cisco_cisco_content_service_switch_1100                     , "#{s}cisco.switches.content_service_switch_1100; + c", 'Cisco_cisco_content_service_switch_1100'
        shape :cisco_cisco_content_switch_module                           , "#{s}cisco.controllers_and_modules.content_switch_module; + c", 'Cisco_cisco_content_switch_module'
        shape :cisco_cisco_content_switch                                  , "#{s}cisco.switches.content_switch; + c", 'Cisco_cisco_content_switch'
        shape :cisco_cisco_content_transformation_engine_cte               , "#{s}cisco.misc.content_transformation_engine_(cte); + c", 'Cisco_cisco_content_transformation_engine__cte_'
        shape :cisco_cisco_cs_mars                                         , "#{s}cisco.misc.cs-mars; + c", 'Cisco_cisco_cs_mars'
        shape :cisco_cisco_csm_s                                           , "#{s}cisco.misc.csm-s; + c", 'Cisco_cisco_csm_s'
        shape :cisco_cisco_csu_dsu                                         , "#{s}cisco.misc.csu_dsu; + c", 'Cisco_cisco_csu_dsu'
        shape :cisco_cisco_cube                                            , "#{s}cisco.misc.cube; + c", 'Cisco_cisco_CUBE'
        shape :cisco_cisco_detector                                        , "#{s}cisco.misc.detector; + c", 'Cisco_cisco_detector'
        shape :cisco_cisco_director_class_fibre_channel_director           , "#{s}cisco.directors.director-class_fibre_channel_director; + c", 'Cisco_cisco_director_class_fibre_channel_director'
        shape :cisco_cisco_directory_server                                , "#{s}cisco.servers.directory_server; + c", 'Cisco_cisco_directory_server'
        shape :cisco_cisco_diskette                                        , "#{s}cisco.storage.diskette; + c", 'Cisco_cisco_diskette'
        shape :cisco_cisco_distributed_director                            , "#{s}cisco.directors.distributed_director; + c", 'Cisco_cisco_distributed_director'
        shape :cisco_cisco_dot_dot                                         , "#{s}cisco.misc.dot-dot; + c", 'Cisco_cisco_dot_dot'
        shape :cisco_cisco_dpt                                             , "#{s}cisco.misc.dpt; + c", 'Cisco_cisco_dpt'
        shape :cisco_cisco_dslam                                           , "#{s}cisco.misc.dslam; + c", 'Cisco_cisco_dslam'
        shape :cisco_cisco_dual_mode_ap                                    , "#{s}cisco.misc.dual_mode; + c", 'Cisco_cisco_dual_mode_ap'
        shape :cisco_cisco_dwdm_filter                                     , "#{s}cisco.misc.dwdm_filter; + c", 'Cisco_cisco_dwdm_filter'
        shape :cisco_cisco_end_office                                      , "#{s}cisco.buildings.end_office; + c", 'Cisco_cisco_end_office'
        shape :cisco_cisco_fax                                             , "#{s}cisco.modems_and_phones.fax; + c", 'Cisco_cisco_fax'
        shape :cisco_cisco_fc_storage                                      , "#{s}cisco.storage.fc_storage; + c", 'Cisco_cisco_fc_storage'
        shape :cisco_cisco_fddi_ring                                       , "#{s}cisco.misc.fddi_ring;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897;", 'Cisco_cisco_fddi_ring'
        shape :cisco_cisco_fibre_channel_disk_subsystem                    , "#{s}cisco.storage.fibre_channel_disk_subsystem; + c", 'Cisco_cisco_fibre_channel_disk_subsystem'
        shape :cisco_cisco_fibre_channel_fabric_switch                     , "#{s}cisco.switches.fibre_channel_fabric_switch; + c", 'Cisco_cisco_fibre_channel_fabric_switch'
        shape :cisco_cisco_file_cabinet                                    , "#{s}cisco.storage.file_cabinet; + c", 'Cisco_cisco_file_cabinet'
        shape :cisco_cisco_file_server                                     , "#{s}cisco.servers.file_server; + c", 'Cisco_cisco_file_server'
        shape :cisco_cisco_firewall_service_module_fwsm                    , "#{s}cisco.controllers_and_modules.firewall_service_module_(fwsm); + c", 'Cisco_cisco_firewall_service_module__fwsm_'
        shape :cisco_cisco_front_end_processor                             , "#{s}cisco.misc.front_end_processor; + c", 'Cisco_cisco_front_end_processor'
        shape :cisco_cisco_gatekeeper                                      , "#{s}cisco.security.gatekeeper;strokeColor=#036897;", 'Cisco_cisco_gatekeeper'
        shape :cisco_cisco_general_applicance                              , "#{s}cisco.misc.general_appliance; + c", 'Cisco_cisco_general_applicance'
        shape :cisco_cisco_generic_gateway                                 , "#{s}cisco.hubs_and_gateways.generic_gateway; + c", 'Cisco_cisco_generic_gateway'
        shape :cisco_cisco_generic_processor                               , "#{s}cisco.misc.generic_processor; + c", 'Cisco_cisco_generic_processor'
        shape :cisco_cisco_generic_softswitch                              , "#{s}cisco.switches.generic_softswitch; + c", 'Cisco_cisco_generic_softswitch'
        shape :cisco_cisco_gigabit_switch_atm_tag_router                   , "#{s}cisco.routers.gigabit_switch_atm_tag_router; + c", 'Cisco_cisco_gigabit_switch_atm_tag_router'
        shape :cisco_cisco_government_building                             , "#{s}cisco.buildings.government_building; + c", 'Cisco_cisco_government_building'
        shape :cisco_cisco_ground_terminal                                 , "#{s}cisco.wireless.ground_terminal; + c", 'Cisco_cisco_Ground_terminal'
        shape :cisco_cisco_guard                                           , "#{s}cisco.security.guard; + c", 'Cisco_cisco_guard'
        shape :cisco_cisco_handheld                                        , "#{s}cisco.misc.handheld; + c", 'Cisco_cisco_handheld'
        shape :cisco_cisco_hootphone                                       , "#{s}cisco.modems_and_phones.hootphone; + c", 'Cisco_cisco_hootphone'
        shape :cisco_cisco_host                                            , "#{s}cisco.servers.host; + c", 'Cisco_cisco_host'
        shape :cisco_cisco_hp_mini                                         , "#{s}cisco.misc.hp_mini; + c", 'Cisco_cisco_hp_mini'
        shape :cisco_cisco_h                                               , "#{s}cisco.misc.h_323; + c", 'Cisco_cisco_h'
        shape :cisco_cisco_hub                                             , "#{s}cisco.hubs_and_gateways.hub; + c", 'Cisco_cisco_hub'
        shape :cisco_cisco_iad_router                                      , "#{s}cisco.routers.iad_router; + c", 'Cisco_cisco_iad_router'
        shape :cisco_cisco_ibm_mainframe                                   , "#{s}cisco.computers_and_peripherals.ibm_mainframe; + c", 'Cisco_cisco_ibm_mainframe'
        shape :cisco_cisco_ibm_mini_as400                                  , "#{s}cisco.computers_and_peripherals.ibm_mini_as400; + c", 'Cisco_cisco_ibm_mini_as400'
        shape :cisco_cisco_ibm_tower                                       , "#{s}cisco.computers_and_peripherals.ibm_tower; + c", 'Cisco_cisco_ibm_tower'
        shape :cisco_cisco_icm                                             , "#{s}cisco.misc.icm; + c", 'Cisco_cisco_icm'
        shape :cisco_cisco_ics                                             , "#{s}cisco.misc.ics; + c", 'Cisco_cisco_ics'
        shape :cisco_cisco_intelliswitch_stack                             , "#{s}cisco.switches.intelliswitch_stack; + c", 'Cisco_cisco_intelliswitch_stack'
        shape :cisco_cisco_ios_firewall                                    , "#{s}cisco.security.ios_firewall; + c", 'Cisco_cisco_ios_firewall'
        shape :cisco_cisco_ios_slb                                         , "#{s}cisco.misc.ios_slb; + c", 'Cisco_cisco_ios_slb'
        shape :cisco_cisco_ip_communicator                                 , "#{s}cisco.misc.ip_communicator; + c", 'Cisco_cisco_ip_communicator'
        shape :cisco_cisco_ip_dsl                                          , "#{s}cisco.misc.ip_dsl; + c", 'Cisco_cisco_ip_dsl'
        shape :cisco_cisco_ip_phone                                        , "#{s}cisco.modems_and_phones.ip_phone; + c", 'Cisco_cisco_ip_phone'
        shape :cisco_cisco_ip                                              , "#{s}cisco.misc.ip; + c", 'Cisco_cisco_ip'
        shape :cisco_cisco_iptc                                            , "#{s}cisco.misc.iptc; + c", 'Cisco_cisco_iptc'
        shape :cisco_cisco_ip_telephony_router                             , "#{s}cisco.routers.ip_telephony_router; + c", 'Cisco_cisco_ip_telephony_router'
        shape :cisco_cisco_iptv_content_manager                            , "#{s}cisco.misc.iptv_content_manager; + c", 'Cisco_cisco_iptv_content_manager'
        shape :cisco_cisco_iptv_server                                     , "#{s}cisco.servers.iptv_server; + c", 'Cisco_cisco_iptv_server'
        shape :cisco_cisco_iscsi_router                                    , "#{s}cisco.routers.isci_router; + c", 'Cisco_cisco_iscsi_router'
        shape :cisco_cisco_isdn_switch                                     , "#{s}cisco.switches.isdn_switch; + c", 'Cisco_cisco_isdn_switch'
        shape :cisco_cisco_itp                                             , "#{s}cisco.misc.itp; + c", 'Cisco_cisco_itp'
        shape :cisco_cisco_jbod                                            , "#{s}cisco.misc.jbod; + c", 'Cisco_cisco_jbod'
        shape :cisco_cisco_key                                             , "#{s}cisco.misc.key; + c", 'Cisco_cisco_key'
        shape :cisco_cisco_keys                                            , "#{s}cisco.misc.keys; + c", 'Cisco_cisco_keys'
        shape :cisco_cisco_lan_to_lan                                      , "#{s}cisco.misc.lan_to_lan; + c", 'Cisco_cisco_lan_to_lan'
        shape :cisco_cisco_layer_2_remote_switch                           , "#{s}cisco.switches.layer_2_remote_switch; + c", 'Cisco_cisco_layer_2_remote_switch'
        shape :cisco_cisco_layer_3_switch                                  , "#{s}cisco.switches.layer_3_switch; + c", 'Cisco_cisco_layer_3_switch'
        shape :cisco_cisco_lightweight_ap                                  , "#{s}cisco.misc.lightweight_ap; + c", 'Cisco_cisco_lightweight_ap'
        shape :cisco_cisco_localdirector                                   , "#{s}cisco.directors.localdirector; + c", 'Cisco_cisco_localdirector'
        shape :cisco_cisco_longreach_cpe                                   , "#{s}cisco.misc.longreach_cpe; + c", 'Cisco_cisco_longreach_cpe'
        shape :cisco_cisco_macintosh                                       , "#{s}cisco.computers_and_peripherals.macintosh; + c", 'Cisco_cisco_macintosh'
        shape :cisco_cisco_mac_woman                                       , "#{s}cisco.people.mac_woman; + c", 'Cisco_cisco_mac_woman'
        shape :cisco_cisco_man_woman                                       , "#{s}cisco.people.man_woman; + c", 'Cisco_cisco_man_woman'
        shape :cisco_cisco_mas_gateway                                     , "#{s}cisco.hubs_and_gateways.mas_gateway; + c", 'Cisco_cisco_mas_gateway'
        shape :cisco_cisco_mau                                             , "#{s}cisco.misc.mau; + c", 'Cisco_cisco_mau'
        shape :cisco_cisco_mcu                                             , "#{s}cisco.misc.mcu; + c", 'Cisco_cisco_mcu'
        shape :cisco_cisco_mdu                                             , "#{s}cisco.buildings.mdu; + c", 'Cisco_cisco_mdu'
        shape :cisco_cisco_me_1100                                         , "#{s}cisco.misc.me1100; + c", 'Cisco_cisco_me_1100'
        shape :cisco_cisco_mediator                                        , "#{s}cisco.misc.mediator; + c", 'Cisco_cisco_Mediator'
        shape :cisco_cisco_meetingplace                                    , "#{s}cisco.misc.meetingplace; + c", 'Cisco_cisco_meetingplace'
        shape :cisco_cisco_mesh_ap                                         , "#{s}cisco.misc.mesh_ap; + c", 'Cisco_cisco_mesh_ap'
        shape :cisco_cisco_metro_1500                                      , "#{s}cisco.misc.metro_1500; + c", 'Cisco_cisco_metro_1500'
        shape :cisco_cisco_mgx_8000_multiservice_switch                    , "#{s}cisco.switches.mgx_8000_multiservice_switch; + c", 'Cisco_cisco_mgx_8000_multiservice_switch'
        shape :cisco_cisco_microphone                                      , "#{s}cisco.computers_and_peripherals.microphone; + c", 'Cisco_cisco_microphone'
        shape :cisco_cisco_mini_vax                                        , "#{s}cisco.misc.mini_vax; + c", 'Cisco_cisco_mini_vax'
        shape :cisco_cisco_mobile_access_ip_phone                          , "#{s}cisco.modems_and_phones.mobile_access_ip_phone; + c", 'Cisco_cisco_mobile_access_ip_phone'
        shape :cisco_cisco_mobile_access_router                            , "#{s}cisco.routers.mobile_access_router; + c", 'Cisco_cisco_mobile_access_router'
        shape :cisco_cisco_modem                                           , "#{s}cisco.modems_and_phones.modem; + c", 'Cisco_cisco_modem'
        shape :cisco_cisco_moh_server                                      , "#{s}cisco.servers.moh_server; + c", 'Cisco_cisco_moh_server'
        shape :cisco_cisco_mse                                             , "#{s}cisco.misc.mse; + c", 'Cisco_cisco_MSE'
        shape :cisco_cisco_mulitswitch_device                              , "#{s}cisco.switches.multiswitch_device; + c", 'Cisco_cisco_mulitswitch_device'
        shape :cisco_cisco_multi_fabric_server_switch                      , "#{s}cisco.switches.multi-fabric_server_switch; + c", 'Cisco_cisco_multi_fabric_server_switch'
        shape :cisco_cisco_multilayer_remote_switch                        , "#{s}cisco.switches.multilayer_remote_switch; + c", 'Cisco_cisco_multilayer_remote_switch'
        shape :cisco_cisco_mux                                             , "#{s}cisco.misc.mux; + c", 'Cisco_cisco_mux'
        shape :cisco_cisco_mxe                                             , "#{s}cisco.misc.mxe; + c", 'Cisco_cisco_MXE'
        shape :cisco_cisco_nac_appliance                                   , "#{s}cisco.misc.nac_appliance; + c", 'Cisco_cisco_nac_appliance'
        shape :cisco_cisco_nce                                             , "#{s}cisco.misc.nce; + c", 'Cisco_cisco_NCE'
        shape :cisco_cisco_nce_router                                      , "#{s}cisco.routers.nce_router; + c", 'Cisco_cisco_NCE_router'
        shape :cisco_cisco_netflow_router                                  , "#{s}cisco.routers.netflow_router; + c", 'Cisco_cisco_netflow_router'
        shape :cisco_cisco_netranger                                       , "#{s}cisco.misc.netranger; + c", 'Cisco_cisco_netranger'
        shape :cisco_cisco_netsonar                                        , "#{s}cisco.misc.netsonar; + c", 'Cisco_cisco_netsonar'
        shape :cisco_cisco_network_management                              , "#{s}cisco.misc.network_management; + c", 'Cisco_cisco_network_management'
        shape :cisco_cisco_nexus_1000                                      , "#{s}cisco.misc.nexus_1000; + c", 'Cisco_cisco_Nexus_1000'
        shape :cisco_cisco_nexus_2000                                      , "#{s}cisco.misc.nexus_2000_fabric_extender; + c", 'Cisco_cisco_Nexus_2000'
        shape :cisco_cisco_nexus_5000                                      , "#{s}cisco.misc.nexus_5000; + c", 'Cisco_cisco_Nexus_5000'
        shape :cisco_cisco_nexus_7000                                      , "#{s}cisco.misc.nexus_7000; + c", 'Cisco_cisco_Nexus_7000'
        shape :cisco_cisco_octel                                           , "#{s}cisco.misc.octel; + c", 'Cisco_cisco_octel'
        shape :cisco_cisco_ons15500                                        , "#{s}cisco.misc.ons15500; + c", 'Cisco_cisco_ons15500'
        shape :cisco_cisco_optical_amplifier                               , "#{s}cisco.misc.optical_amplifier; + c", 'Cisco_cisco_optical_amplifier'
        shape :cisco_cisco_optical_services_router                         , "#{s}cisco.routers.optical_services_router; + c", 'Cisco_cisco_optical_services_router'
        shape :cisco_cisco_optical_transport                               , "#{s}cisco.misc.optical_transport; + c", 'Cisco_cisco_optical_transport'
        shape :cisco_cisco_pad                                             , "#{s}cisco.misc.pad_2; + c", 'Cisco_cisco_pad'
        shape :cisco_cisco_pad_x                                           , "#{s}cisco.misc.pad_1; + c", 'Cisco_cisco_pad_x'
        shape :cisco_cisco_page_icon                                       , "#{s}cisco.misc.page_icon;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897;", 'Cisco_cisco_page_icon'
        shape :cisco_cisco_pbx                                             , "#{s}cisco.misc.pbx; + c", 'Cisco_cisco_pbx'
        shape :cisco_cisco_pbx_switch                                      , "#{s}cisco.switches.pbx_switch; + c", 'Cisco_cisco_pbx_switch'
        shape :cisco_cisco_pc_adapter_card                                 , "#{s}cisco.computers_and_peripherals.pc_adapter_card; + c", 'Cisco_cisco_pc_adapter_card'
        shape :cisco_cisco_pc_man                                          , "#{s}cisco.people.pc_man; + c", 'Cisco_cisco_pc_man'
        shape :cisco_cisco_pc_routercard                                   , "#{s}cisco.computers_and_peripherals.pc_routercard; + c", 'Cisco_cisco_pc_routercard'
        shape :cisco_cisco_pc_software                                     , "#{s}cisco.misc.pc_software; + c", 'Cisco_cisco_pc_software'
        shape :cisco_cisco_pc_video                                        , "#{s}cisco.misc.pc_video; + c", 'Cisco_cisco_pc_video'
        shape :cisco_cisco_phone_fax                                       , "#{s}cisco.modems_and_phones.phone-fax; + c", 'Cisco_cisco_phone_fax'
        shape :cisco_cisco_pix_firewall                                    , "#{s}cisco.security.pix_firewall; + c", 'Cisco_cisco_pix_firewall'
        shape :cisco_cisco_pmc                                             , "#{s}cisco.misc.pmc; + c", 'Cisco_cisco_pmc'
        shape :cisco_cisco_programmable_switch                             , "#{s}cisco.switches.programmable_switch; + c", 'Cisco_cisco_programmable_switch'
        shape :cisco_cisco_protocol_translator                             , "#{s}cisco.misc.protocol_translator; + c", 'Cisco_cisco_protocol_translator'
        shape :cisco_cisco_pxf                                             , "#{s}cisco.misc.pxf; + c", 'Cisco_cisco_pxf'
        shape :cisco_cisco_radio_tower                                     , "#{s}cisco.wireless.radio_tower;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897",
              'Cisco_cisco_radio_tower'
        shape :cisco_cisco_ratemux                                         , "#{s}cisco.misc.ratemux; + c", 'Cisco_cisco_ratemux'
        shape :cisco_cisco_repeater                                        , "#{s}cisco.misc.repeater; + c", 'Cisco_cisco_repeater'
        shape :cisco_cisco_rf_modem                                        , "#{s}cisco.modems_and_phones.rf_modem; + c", 'Cisco_cisco_RF_modem'
        shape :cisco_cisco_router_firewall                                 , "#{s}cisco.security.router_firewall; + c", 'Cisco_cisco_router_firewall'
        shape :cisco_cisco_routerin_building                               , "#{s}cisco.routers.router_in_building; + c", 'Cisco_cisco_routerin_building'
        shape :cisco_cisco_router_with_silicon_switch                      , "#{s}cisco.routers.router_with_silicon_switch; + c", 'Cisco_cisco_router_with_silicon_switch'
        shape :cisco_cisco_route_switch_processor                          , "#{s}cisco.misc.route_switch_processor; + c", 'Cisco_cisco_route_switch_processor'
        shape :cisco_cisco_rpsrps                                          , "#{s}cisco.misc.rpsrps; + c", 'Cisco_cisco_rpsrps'
        shape :cisco_cisco_running_man                                     , "#{s}cisco.people.running_man; + c", 'Cisco_cisco_running_man'
        shape :cisco_cisco_sattelite_dish                                  , "#{s}cisco.wireless.satellite_dish; + c", 'Cisco_cisco_sattelite_dish'
        shape :cisco_cisco_sattelite                                       , "#{s}cisco.wireless.satellite; + c", 'Cisco_cisco_sattelite'
        shape :cisco_cisco_scanner                                         , "#{s}cisco.computers_and_peripherals.scanner; + c", 'Cisco_cisco_scanner'
        shape :cisco_cisco_server_switch                                   , "#{s}cisco.switches.server_switch; + c", 'Cisco_cisco_server_switch'
        shape :cisco_cisco_server_with_router                              , "#{s}cisco.servers.server_with_router; + c", 'Cisco_cisco_server_with_router'
        shape :cisco_cisco_service_control                                 , "#{s}cisco.misc.service_control; + c", 'Cisco_cisco_service_control'
        shape :cisco_cisco_service_module                                  , "#{s}cisco.controllers_and_modules.service_module; + c", 'Cisco_cisco_Service_Module'
        shape :cisco_cisco_service_router                                  , "#{s}cisco.routers.service_router; + c", 'Cisco_cisco_Service_router'
        shape :cisco_cisco_services                                        , "#{s}cisco.misc.services; + c", 'Cisco_cisco_Services'
        shape :cisco_cisco_set_top_box                                     , "#{s}cisco.misc.set_top_box; + c", 'Cisco_cisco_Set_top_box'
        shape :cisco_cisco_simulitlayer_switch                             , "#{s}cisco.switches.simultilayer_switch; + c", 'Cisco_cisco_simulitlayer_switch'
        shape :cisco_cisco_sip_proxy_werver                                , "#{s}cisco.servers.sip_proxy_server; + c", 'Cisco_cisco_sip_proxy_werver'
        shape :cisco_cisco_sitting_woman                                   , "#{s}cisco.people.sitting_woman; + c", 'Cisco_cisco_sitting_woman'
        shape :cisco_cisco_small_business                                  , "#{s}cisco.buildings.small_business; + c", 'Cisco_cisco_small_business'
        shape :cisco_cisco_small_hub                                       , "#{s}cisco.hubs_and_gateways.small_hub; + c", 'Cisco_cisco_small_hub'
        shape :cisco_cisco_softphone                                       , "#{s}cisco.modems_and_phones.softphone; + c", 'Cisco_cisco_softphone'
        shape :cisco_cisco_softswitch_pgw_mgc                              , "#{s}cisco.switches.softswitch_pgw_mgc; + c", 'Cisco_cisco_softswitch_pgw_mgc'
        shape :cisco_cisco_software_based_server                           , "#{s}cisco.servers.software_based_server; + c", 'Cisco_cisco_software_based_server'
        shape :cisco_cisco_speaker                                         , "#{s}cisco.computers_and_peripherals.speaker; + c", 'Cisco_cisco_speaker'
        shape :cisco_cisco_ssc                                             , "#{s}cisco.misc.ssc; + c", 'Cisco_cisco_ssc'
        shape :cisco_cisco_ssl_terminator                                  , "#{s}cisco.misc.ssl_terminator; + c", 'Cisco_cisco_ssl_terminator'
        shape :cisco_cisco_standard_host                                   , "#{s}cisco.servers.standard_host; + c", 'Cisco_cisco_standard_host'
        shape :cisco_cisco_stb                                             , "#{s}cisco.misc.stb; + c", 'Cisco_cisco_stb'
        shape :cisco_cisco_storage_router                                  , "#{s}cisco.routers.storage_router; + c", 'Cisco_cisco_storage_router'
        shape :cisco_cisco_storage_server                                  , "#{s}cisco.servers.storage_server; + c", 'Cisco_cisco_storage_server'
        shape :cisco_cisco_stp                                             , "#{s}cisco.misc.stp; + c", 'Cisco_cisco_stp'
        shape :cisco_cisco_streamer                                        , "#{s}cisco.misc.streamer; + c", 'Cisco_cisco_streamer'
        shape :cisco_cisco_sun_workstation                                 , "#{s}cisco.computers_and_peripherals.workstation; + c", 'Cisco_cisco_sun_workstation'
        shape :cisco_cisco_supercomputer                                   , "#{s}cisco.computers_and_peripherals.supercomputer; + c", 'Cisco_cisco_supercomputer'
        shape :cisco_cisco_svx                                             , "#{s}cisco.misc.svx; + c", 'Cisco_cisco_svx'
        shape :cisco_cisco_system_controller                               , "#{s}cisco.controllers_and_modules.system_controller; + c", 'Cisco_cisco_system_controller'
        shape :cisco_cisco_tablet                                          , "#{s}cisco.computers_and_peripherals.tablet; + c", 'Cisco_cisco_tablet'
        shape :cisco_cisco_tape_array                                      , "#{s}cisco.storage.tape_array; + c", 'Cisco_cisco_tape_array'
        shape :cisco_cisco_tdm_router                                      , "#{s}cisco.routers.tdm_router; + c", 'Cisco_cisco_tdm_router'
        shape :cisco_cisco_telecommuter_house_pc                           , "#{s}cisco.buildings.telecommuter_house_pc; + c", 'Cisco_cisco_telecommuter_house_pc'
        shape :cisco_cisco_telecommuter_house                              , "#{s}cisco.buildings.telecommuter_house; + c", 'Cisco_cisco_telecommuter_house'
        shape :cisco_cisco_telecommuter_icon                               , "#{s}cisco.misc.telecommuter_icon; + c", 'Cisco_cisco_telecommuter_icon'
        shape :cisco_cisco_telepresence_3200                               , "#{s}cisco.misc.telepresence; + c", 'Cisco_cisco_Telepresence_3200'
        shape :cisco_cisco_terminal                                        , "#{s}cisco.computers_and_peripherals.terminal; + c", 'Cisco_cisco_terminal'
        shape :cisco_cisco_token                                           , "#{s}cisco.misc.token;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#036897", 'Cisco_cisco_token'
        shape :cisco_cisco_tp_mcu                                          , "#{s}cisco.misc.tp_mcu; + c", 'Cisco_cisco_TP_MCU'
        shape :cisco_cisco_transpath                                       , "#{s}cisco.misc.transpath; + c", 'Cisco_cisco_transpath'
        shape :cisco_cisco_truck                                           , "#{s}cisco.misc.truck; + c", 'Cisco_cisco_truck'
        shape :cisco_cisco_turret                                          , "#{s}cisco.misc.turret; + c", 'Cisco_cisco_turret'
        shape :cisco_cisco_tv                                              , "#{s}cisco.misc.tv; + c", 'Cisco_cisco_tv'
        shape :cisco_cisco_ubr910                                          , "#{s}cisco.misc.ubr910; + c", 'Cisco_cisco_ubr910'
        shape :cisco_cisco_umg_series                                      , "#{s}cisco.misc.umg_series; + c", 'Cisco_cisco_umg_series'
        shape :cisco_cisco_unity_server                                    , "#{s}cisco.servers.unity_server; + c", 'Cisco_cisco_unity_server'
        shape :cisco_cisco_universal_gateway                               , "#{s}cisco.hubs_and_gateways.universal_gateway; + c", 'Cisco_cisco_universal_gateway'
        shape :cisco_cisco_university                                      , "#{s}cisco.buildings.university; + c", 'Cisco_cisco_university'
        shape :cisco_cisco_upc                                             , "#{s}cisco.computers_and_peripherals.upc; + c", 'Cisco_cisco_upc'
        shape :cisco_cisco_vault                                           , "#{s}cisco.misc.vault; + c", 'Cisco_cisco_vault'
        shape :cisco_cisco_video_camera                                    , "#{s}cisco.computers_and_peripherals.video_camera; + c", 'Cisco_cisco_video_camera'
        shape :cisco_cisco_vip                                             , "#{s}cisco.misc.vip; + c", 'Cisco_cisco_vip'
        shape :cisco_cisco_virtual_layer_switch                            , "#{s}cisco.switches.virtual_layer_switch; + c", 'Cisco_cisco_virtual_layer_switch'
        shape :cisco_cisco_virtual_switch_controller_vsc3000               , "#{s}cisco.controllers_and_modules.virtual_switch_controller_(vsc3000); + c",
              'Cisco_cisco_virtual_switch_controller__vsc3000_'
        shape :cisco_cisco_voice_atm_switch                                , "#{s}cisco.switches.voice_atm_switch; + c", 'Cisco_cisco_voice_atm_switch'
        shape :cisco_cisco_voice_commserver                                , "#{s}cisco.servers.voice_commserver; + c", 'Cisco_cisco_voice_commserver'
        shape :cisco_cisco_voice_router                                    , "#{s}cisco.routers.voice_router; + c", 'Cisco_cisco_voice_router'
        shape :cisco_cisco_voice_switch                                    , "#{s}cisco.switches.voice_switch; + c", 'Cisco_cisco_voice_switch'
        shape :cisco_cisco_vpn_concentrator                                , "#{s}cisco.misc.vpn_concentrator; + c", 'Cisco_cisco_vpn_concentrator'
        shape :cisco_cisco_vpn_gateway                                     , "#{s}cisco.hubs_and_gateways.vpn_gateway; + c", 'Cisco_cisco_vpn_gateway'
        shape :cisco_cisco_vss                                             , "#{s}cisco.misc.vss; + c", 'Cisco_cisco_VSS'
        shape :cisco_cisco_wae                                             , "#{s}cisco.misc.wae; + c", 'Cisco_cisco_wae'
        shape :cisco_cisco_wavelength_router                               , "#{s}cisco.routers.wavelength_router; + c", 'Cisco_cisco_wavelength_router'
        shape :cisco_cisco_web_browser                                     , "#{s}cisco.computers_and_peripherals.web_browser; + c", 'Cisco_cisco_web_browser'
        shape :cisco_cisco_web_cluster                                     , "#{s}cisco.storage.web_cluster; + c", 'Cisco_cisco_web_cluster'
        shape :cisco_cisco_wi_fi_tag                                       , "#{s}cisco.wireless.wi-fi_tag; + c", 'Cisco_cisco_wi_fi_tag'
        shape :cisco_cisco_wireless_bridge                                 , "#{s}cisco.wireless.wireless_bridge; + c", 'Cisco_cisco_wireless_bridge'
        shape :cisco_cisco_wireless_location_appliance                     , "#{s}cisco.wireless.wireless_location_appliance; + c", 'Cisco_cisco_wireless_location_appliance'
        shape :cisco_cisco_wireless                                        , "#{s}cisco.wireless.wireless; + c", 'Cisco_cisco_wireless'
        shape :cisco_cisco_wireless_transport                              , "#{s}cisco.wireless.wireless_transport; + c", 'Cisco_cisco_wireless_transport'
        shape :cisco_cisco_wism                                            , "#{s}cisco.misc.wism; + c", 'Cisco_cisco_wism'
        shape :cisco_cisco_wlan_controller                                 , "#{s}cisco.wireless.wlan_controller; + c", 'Cisco_cisco_wlan_controller'
        shape :cisco_cisco_workgroup_director                              , "#{s}cisco.directors.workgroup_director; + c", 'Cisco_cisco_workgroup_director'
        shape :cisco_cisco_workgroup_switch                                , "#{s}cisco.switches.workgroup_switch; + c", 'Cisco_cisco_workgroup_switch'
        shape :cisco_cisco_workstation                                     , "#{s}cisco.computers_and_peripherals.workstation; + c", 'Cisco_cisco_workstation'
        shape :cisco_cisco_www_server                                      , "#{s}cisco.servers.www_server; + c", 'Cisco_cisco_www_server'
      end
      section :computers_and_monitors do
        shape :net_pc                                                      ,
              "#{s}networks.pc;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_PC'
        shape :net_virtual_pc                                              ,
              "#{s}networks.virtual_pc;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Virtual-PC'
        shape :net_terminal                                                ,
              "#{s}networks.terminal;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Terminal'
        shape :net_data_pipe                                               ,
              "#{s}networks.bus;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_DataPipe'
        shape :net_slate_device                                            ,
              "#{s}networks.tablet;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_SlateDevice'
        shape :net_tablet_device                                           ,
              "#{s}networks.tablet;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_TabletDevice'
        shape :net_laptop                                                  ,
              "#{s}networks.laptop;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Laptop'
        shape :net_pda                                                     ,
              "#{s}networks.mobile;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_PDA'
        shape :net_crtmonitor                                              ,
              "#{s}networks.monitor;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_CRTMonitor'
        shape :net_lcdmonitor                                              ,
              "#{s}networks.monitor;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_LCDMonitor'
      end
      section :detailed_network_diagrams do
        shape :net_radio_tower                                             ,
              "#{s}networks.radio_tower;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_RadioTower'
        shape :net_external_hard_drive                                     ,
              "#{s}networks.external_storage;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_ExternalHardDrive'
        shape :net_satellite_dish                                          ,
              "#{s}networks.satellite_dish;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_SatelliteDish'
        shape :net_satellite                                               ,
              "#{s}networks.satellite;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Satellite'
      end
      section :basic_network_shapes do
        shape :net_wireless_access_point                                   ,
              "#{s}networks.radio_tower;fillColor=#29AAE1;strokeColor=#29AAE1;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_WirelessAccessPoint'
        shape :net_ring_network                                            , cs.to_s, 'NET_RingNetwork'
        shape :net_ethernet                                                , cs.to_s, 'NET_Ethernet'
        shape :net_server                                                  ,
              "#{s}networks.server;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Server'
        shape :net_mainframe                                               ,
              "#{s}networks.mainframe;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Mainframe'
        shape :net_router                                                  ,
              "#{s}networks.wireless_hub;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Router'
        shape :net_switch                                                  ,
              "#{s}networks.switch;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Switch'
        shape :net_firewall                                                ,
              "#{s}networks.firewall;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Firewall'
        shape :net_user                                                    ,
              "#{s}networks.user_male;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_User'
        shape :net_comm_link                                               ,
              "#{s}networks.comm_link_edge;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_CommLink'
        shape :net_super_computer                                          ,
              "#{s}networks.supercomputer;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_SuperComputer'
        shape :net_virtual_server                                          ,
              "#{s}networks.virtual_server;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_VirtualServer'
        shape :net_printer                                                 ,
              "#{s}networks.printer;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Printer'
        shape :net_scanner                                                 ,
              "#{s}networks.scanner;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Scanner'
        shape :net_copier                                                  ,
              "#{s}networks.copier;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Copier'
        shape :net_multi_function_machine                                  ,
              "#{s}networks.copier;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_MultiFunctionMachine'
        shape :net_projector                                               ,
              "#{s}networks.video_projector;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Projector'
        shape :net_projector_screen                                        ,
              "#{s}networks.video_projector_screen;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_ProjectorScreen'
        shape :net_bridge                                                  ,
              "#{s}networks.router;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Bridge'
        shape :net_hub                                                     ,
              "#{s}networks.hub;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Hub'
        shape :net_modem                                                   ,
              "#{s}networks.modem;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Modem'
        shape :net_telephone                                               ,
              "#{s}signs.tech.telephone_5;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Telephone'
        shape :net_cell_phone                                              ,
              "#{s}networks.mobile;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_CellPhone'
        shape :net_smart_phone                                             ,
              "#{s}networks.mobile;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_SmartPhone'
        shape :net_camera                                                  ,
              "#{s}signs.tech.camera_2;fillColor=#29AAE1;strokeColor=#ffffff;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;", 'NET_Camera'
      end
      section :server_racks do
        shape :rack_server_rack                                            ,
              "#{s}rackGeneral.container;childLayout=rack;marginLeft=9;marginRight=9;marginTop=21;marginBottom=22;textColor=#000000;numDisp=off#{containerStyle}", 'RackServerRack'
        shape :rack_blank                                                  , "#{s}rackGeneral.plate;strokeColor=#666666;labelPosition=left;align=right;spacingRight=15;fillColor=#e8e8e8", 'RackBlank'
        shape :rack_raid_array                                             , "#{s}rack.cisco.cisco_carrier_packet_transport_50;labelPosition=left;align=right;spacingRight=15", 'RackRaidArray'
        shape :rack_server                                                 , "#{s}rack.oracle.sunfire_x4100;labelPosition=left;align=right;spacingRight=15", 'RackServer'
        shape :rack_ethernet_switch                                        , "#{s}rack.cisco.cisco_nexus_3016_switch;labelPosition=left;align=right;spacingRight=15", 'RackEthernetSwitch'
        shape :rack_patch_panel                                            ,
              "#{s}rack.general.cat5e_rack_mount_patch_panel_24_ports;strokeColor=#666666;labelPosition=left;align=right;spacingRight=15", 'RackPatchPanel'
        shape :rack_router                                                 , "#{s}rack.cisco.cisco_asr_1001_router;labelPosition=left;align=right;spacingRight=15", 'RackRouter'
        shape :rack_monitor                                                , "#{s}rack.ibm.ibm_1u_flat_panel_console_kit;labelPosition=left;align=right;spacingRight=15", 'RackMonitor'
        shape :rack_keyboard                                               , "#{s}rack.cisco.cisco_1905_serial_integrated_services_router;labelPosition=left;align=right;spacingRight=15",
              'RackKeyboard'
        shape :rack_power_strip                                            , "#{s}rack.dell.power_strip;labelPosition=left;align=right;spacingRight=15", 'RackPowerStrip'
        shape :rack_power_supply                                           , "#{s}rack.cisco.cisco_web_security_appliance_s170;labelPosition=left;align=right;spacingRight=15", 'RackPowerSupply'
        shape :rack_bridge                                                 , "#{s}rack.cisco.cisco_nexus_5548p_switch;labelPosition=left;align=right;spacingRight=15", 'RackBridge'
        shape :rack_tape_drive                                             , "#{s}rack.ibm.ibm_1754_local_console_manager;labelPosition=left;align=right;spacingRight=15", 'RackTapeDrive'
      end
      section :network do
        shape :image_network_server                                        , 'image;image=img/lib/clip_art/computers/Server_Tower_128x128.png;flipH=1', 'Image_network_server'
        shape :image_network_server_file                                   , 'image;image=img/lib/clip_art/computers/Server_128x128.png', 'Image_network_server_file'
        shape :image_network_server_net                                    , 'image;image=img/lib/clip_art/networking/Print_Server_128x128.png', 'Image_network_server_net'
        shape :image_network_server_net_large                              , 'image;image=img/lib/clip_art/computers/Server_128x128.png', 'Image_network_server_net_large'
        shape :image_network_raid                                          , 'image;image=img/lib/clip_art/computers/Server_Tower_128x128.png;flipH=1', 'Image_network_raid'
        shape :image_network_raid_large                                    , 'image;image=img/lib/clip_art/computers/Server_Tower_128x128.png;flipH=1', 'Image_network_raid_large'
        shape :image_network_rack_server                                   , 'image;image=img/lib/clip_art/computers/Server_Rack_128x128.png', 'Image_network_rack_server'
        shape :image_network_rack_tape                                     , 'image;image=img/lib/clip_art/computers/Server_Rack_Partial_128x128.png', 'Image_network_rack_tape'
        shape :image_network_printer_small                                 , 'image;image=img/lib/clip_art/computers/Printer_128x128.png;flipH=1', 'Image_network_printer_small'
        shape :image_network_printer_large                                 , 'image;image=img/lib/clip_art/computers/Printer_128x128.png;flipH=1', 'Image_network_printer_large'
        shape :image_network_printer_multipurpose                          , 'image;image=img/lib/clip_art/computers/Printer_Commercial_128x128.png;flipH=1', 'Image_network_printer_multipurpose'
        shape :image_network_copier_small                                  , 'image;image=img/lib/clip_art/computers/Printer_Commercial_128x128.png', 'Image_network_copier_small'
        shape :image_network_copier_large                                  , 'image;image=img/lib/clip_art/computers/Printer_Commercial_128x128.png', 'Image_network_copier_large'
        shape :image_network_router                                        , 'image;image=img/lib/clip_art/networking/Router_128x128.png', 'Image_network_router'
        shape :image_network_router_wireless                               , 'image;image=img/lib/clip_art/networking/Wireless_Router_128x128.png', 'Image_network_router_wireless'
        shape :image_network_ups                                           , 'image;image=img/lib/clip_art/networking/UPS_128x128.png', 'Image_network_ups'
      end
      section :electroni_cs do
        shape :image_electronics_lcd                                       , 'image;image=img/lib/clip_art/computers/Monitor_128x128.png', 'Image_electronics_lcd'
        shape :image_electronics_pda                                       , 'image;image=img/lib/clip_art/telecommunication/Palm_Treo_128x128.png', 'Image_electronics_pda'
        shape :image_electronics_drive_cardreader                          , 'image;image=img/lib/clip_art/finance/Credit_Card_128x128.png', 'Image_electronics_drive_cardreader'
        shape :image_electronics_camcorder                                 , 'image;image=img/lib/clip_art/networking/Ip_Camera_128x128.png', 'Image_electronics_camcorder'
        shape :image_electronics_printer_photo                             , 'image;image=img/lib/clip_art/computers/Printer_128x128.png;flipH=1', 'Image_electronics_printer_photo'
        shape :image_electronics_drive_firewire                            , 'image;image=img/lib/clip_art/computers/Harddrive_128x128.png;flipH=1', 'Image_electronics_drive_firewire'
        shape :image_electronics_drive_usb                                 , 'image;image=img/lib/clip_art/computers/Harddrive_128x128.png;flipH=1', 'Image_electronics_drive_usb'
        shape :image_electronics_modem_external                            , 'image;image=img/lib/clip_art/networking/Modem_128x128.png;flipH=1', 'Image_electronics_modem_external'
        shape :image_electronics_lcd_wide                                  , 'image;image=img/lib/clip_art/computers/Monitor_128x128.png', 'Image_electronics_lcd_wide'
      end
      section :electrical do
        shape :ee_amplifier                                                , "#{s}electrical.abstract.amplifier", 'EE_Amplifier'
        shape :ee_op_amp                                                   , cs.to_s, 'EE_OpAmp'
        shape :ee_controlled_amp                                           , "#{s}electrical.abstract.controlled_amplifier", 'EE_ControlledAmp'
        shape :ee_multiplexer                                              , 'shape=mxgraph.electrical.abstract.mux2', 'EE_Multiplexer'
        shape :ee_demultiplexer                                            , 'shape=mxgraph.electrical.abstract.mux2;operation=demux', 'EE_Demultiplexer'
        shape :ee_capacitor1                                               , "#{s}electrical.capacitors.capacitor_1", 'EE_Capacitor1'
        shape :ee_capacitor2                                               , "#{s}electrical.capacitors.capacitor_3", 'EE_Capacitor2'
        shape :ee_diode                                                    , "#{s}electrical.diodes.diode", 'EE_Diode'
        shape :ee_resistor                                                 , "#{s}electrical.resistors.resistor_2", 'EE_Resistor'
        shape :ee_var_resistor                                             , "#{s}electrical.resistors.variable_resistor_2", 'EE_VarResistor'
        shape :ee_potentiometer                                            , "#{s}electrical.resistors.potentiometer_2", 'EE_Potentiometer'
        shape :ee_prot_ground                                              , "#{s}electrical.signal_sources.protective_earth", 'EE_ProtGround'
        shape :ee_signal_ground                                            , "#{s}electrical.signal_sources.signal_ground", 'EE_SignalGround'
        shape :ee_transformer                                              , "#{s}electrical.inductors.transformer_1", 'EE_Transformer'
        shape :ee_inductor                                                 , "#{s}electrical.inductors.inductor_3", 'EE_Inductor'
        shape :ee_variable_inductor                                        , "#{s}electrical.inductors.variable_inductor", 'EE_Variable Inductor'
        shape :ee_two_way_switch                                           , "#{s}electrical.electro-mechanical.2-way_switch", 'EE_TwoWaySwitch'
        shape :ee_on_off_switch                                            , "#{s}electrical.electro-mechanical.simple_switch", 'EE_OnOffSwitch'
        shape :ee_loudspeaker                                              , "#{s}electrical.electro-mechanical.loudspeaker", 'EE_Loudspeaker'
        shape :ee_motor                                                    , "#{s}electrical.electro-mechanical.motor_1", 'EE_Motor'
        shape :ee_led1                                                     , "#{s}electrical.opto_electronics.led_2", 'EE_LED1'
        shape :ee_lightbulb                                                , "#{s}electrical.miscellaneous.light_bulb", 'EE_Lightbulb'
        shape :ee_integrated_circuit                                       , 'shape=mxgraph.electrical.logic_gates.dual_inline_ic', 'EE_IntegratedCircuit'
      end
      section :power_sources do
        shape :ee_ac_source                                                ,
              "#{s}electrical.signal_sources.ac_source;strokeWidth=1;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;", 'EE_AcSource'
        shape :ee_voltage_source                                           ,
              "#{s}electrical.signal_sources.dc_source_3;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;", 'EE_VoltageSource'
        shape :ee_current_source                                           ,
              "#{s}electrical.signal_sources.dc_source_2;direction=north;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;", 'EE_CurrentSource'
        shape :ee_controlled_current_source                                ,
              "#{s}electrical.signal_sources.dependent_source_2;direction=west;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;", 'EE_ControlledCurrentSource'
        shape :ee_controlled_voltage_source                                ,
              "#{s}electrical.signal_sources.dependent_source_3;verticalLabelPosition=middle;align=left;verticalAlign=top;labelPosition=right;", 'EE_ControlledVoltageSource'
        shape :ee_dc_source1                                               , "#{s}electrical.miscellaneous.monocell_battery;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'EE_DcSource1'
        shape :ee_dc_source2                                               , "#{s}electrical.miscellaneous.multicell_battery;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'EE_DcSource2'
        shape :ee_vss                                                      , "#{s}electrical.signal_sources.vss2;verticalLabelPosition=top;verticalAlign=bottom;fontSize=24", 'EE_Vss'
        shape :ee_vdd                                                      , "#{s}electrical.signal_sources.vdd;verticalLabelPosition=bottom;verticalAlign=top", 'EE_Vdd'
      end
      section :transistors do
        shape :ee_bjt_npn1                                                 , "#{s}electrical.transistors.pnp_transistor_1", 'EE_BJT_NPN1'
        shape :ee_bjt_npn1_v2                                              , "#{s}electrical.transistors.npn_transistor_1;", 'EE_BJT_NPN1_V2'
        shape :ee_bjt_pnp1                                                 , "#{s}electrical.transistors.npn_transistor_1", 'EE_BJT_PNP1'
        shape :ee_bjt_pnp1_v2                                              , "#{s}electrical.transistors.pnp_transistor_1", 'EE_BJT_PNP1_V2'
        shape :ee_jfet_p                                                   , "#{s}electrical.transistors.p-channel_jfet_1;flipV=1", 'EE_JFET_P'
        shape :ee_jfet_p_v2                                                , "#{s}electrical.transistors.p-channel_jfet_1;flipV=1", 'EE_JFET_P_V2'
        shape :ee_jfet_n                                                   , "#{s}electrical.transistors.n-channel_jfet_1", 'EE_JFET_N'
        shape :ee_jfet_n_v2                                                , "#{s}electrical.transistors.n-channel_jfet_1", 'EE_JFET_N_V2'
        shape :ee_mosfet_p1                                                , "#{s}electrical.mosfets1.mosfet_ic_p;flipV=1", 'EE_MOSFET_P1'
        shape :ee_mosfet_p1_v2                                             , "#{s}electrical.mosfets1.mosfet_ic_p;flipV=1", 'EE_MOSFET_P1_V2'
        shape :ee_mosfet_p2                                                , "#{s}electrical.mosfets1.mosfet_p_no_bulk", 'EE_MOSFET_P2'
        shape :ee_mosfet_p2_v2                                             , "#{s}electrical.mosfets1.mosfet_p_no_bulk", 'EE_MOSFET_P2_V2'
        shape :ee_mosfet_p3                                                , "#{s}electrical.mosfets1.p-channel_mosfet_1;flipV=1", 'EE_MOSFET_P3'
        shape :ee_mosfet_p3_v2                                             , "#{s}electrical.mosfets1.p-channel_mosfet_1;flipV=1", 'EE_MOSFET_P3_V2'
        shape :ee_mosfet_n1                                                , "#{s}electrical.mosfets1.mosfet_ic_n", 'EE_MOSFET_N1'
        shape :ee_mosfet_n1_v2                                             , "#{s}electrical.mosfets1.mosfet_ic_n", 'EE_MOSFET_N1_V2'
        shape :ee_mosfet_n2                                                , "#{s}electrical.mosfets1.mosfet_n_no_bulk", 'EE_MOSFET_N2'
        shape :ee_mosfet_n2_v2                                             , "#{s}electrical.mosfets1.mosfet_n_no_bulk", 'EE_MOSFET_N2_V2'
        shape :ee_mosfet_n3                                                , "#{s}electrical.mosfets1.n-channel_mosfet_1", 'EE_MOSFET_N3'
        shape :ee_mosfet_n3_v2                                             , "#{s}electrical.mosfets1.n-channel_mosfet_1", 'EE_MOSFET_N3_V2'
      end
      section :logic_gates do
        shape :ee_and                                                      , "#{s}electrical.logic_gates.and", 'EE_AND'
        shape :ee_or                                                       , "#{s}electrical.logic_gates.or", 'EE_OR'
        shape :ee_inverter                                                 , "#{s}electrical.logic_gates.inverter", 'EE_Inverter'
        shape :ee_nand                                                     , "#{s}electrical.logic_gates.nand", 'EE_NAND'
        shape :ee_nor                                                      , "#{s}electrical.logic_gates.nor", 'EE_NOR'
        shape :ee_xor                                                      , "#{s}electrical.logic_gates.xor", 'EE_XOR'
        shape :ee_nxor                                                     , "#{s}electrical.logic_gates.xnor", 'EE_NXOR'
        shape :ee_dtype_rsflip_flop                                        , "#{s}electrical.logic_gates.d_type_rs_flip-flop", 'EE_DTypeRSFlipFlop'
        shape :ee_dtype_flip_flop                                          , "#{s}electrical.logic_gates.d_type_flip-flop", 'EE_DTypeFlipFlop'
        shape :ee_dtype_flip_flop_with_clear                               , "#{s}electrical.logic_gates.d_type_flip-flop_with_clear", 'EE_DTypeFlipFlopWithClear'
        shape :ee_rslatch                                                  , "#{s}electrical.logic_gates.rs_latch", 'EE_RSLatch'
        shape :ee_sync_rslatch                                             , "#{s}electrical.logic_gates.synchronous_rs_latch", 'EE_SyncRSLatch'
        shape :ee_ttype_flip_flop                                          , "#{s}electrical.logic_gates.t_type_flip-flop", 'EE_TTypeFlipFlop'
      end
      section :miscellaneous do
        shape :ee_plus                                                     , "#{s}ios7.misc.flagged", 'EE_Plus'
        shape :ee_negative                                                 , 'shape=line', 'EE_Negative'
        shape :ee_inverter_contact                                         , 'ellipse', 'EE_InverterContact'
        shape :ee_voltmeter                                                , "#{s}electrical.instruments.voltmeter", 'EE_Voltmeter'
        shape :ee_ammeter                                                  , "#{s}electrical.instruments.ampermeter", 'EE_Ammeter'
        shape :ee_sine_wave                                                , "#{s}electrical.waveforms.sine_wave", 'EE_SineWave'
        shape :ee_sawtooth                                                 , "#{s}electrical.waveforms.sawtooth", 'EE_Sawtooth'
        shape :ee_square_wave                                              , "#{s}electrical.waveforms.square_wave", 'EE_SquareWave'
      end
      section :messaging_systems do
        shape :eichannel_block                                             , "#{s}eip.messageChannel;verticalLabelPosition=bottom;verticalAlign=top", 'EIChannelBlock'
        shape :eimessage_channel_block                                     , cs.to_s, 'EIMessageChannelBlock'
        shape :eimessage_block                                             , cs.to_s, 'EIMessageBlock'
        shape :eimessage_router_block                                      , "#{s}eip.content_based_router;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessageRouterBlock'
        shape :eimessage_translator_block                                  , "#{s}eip.message_translator;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessageTranslatorBlock'
        shape :eimessage_endpoint_block                                    , cs.to_s, 'EIMessageEndpointBlock'
      end
      section :messaging_channels do
        shape :eipublish_subscribe_channel_block                           , cs.to_s, 'EIPublishSubscribeChannelBlock'
        shape :eidatatype_channel_block                                    , cs.to_s, 'EIDatatypeChannelBlock'
        shape :eiinvalid_message_channel_block                             , cs.to_s, 'EIInvalidMessageChannelBlock'
        shape :eidead_letter_channel_block                                 , cs.to_s, 'EIDeadLetterChannelBlock'
        shape :eiguaranteed_delivery_block                                 , cs.to_s, 'EIGuaranteedDeliveryBlock'
        shape :eichannel_adapter_block                                     , cs.to_s, 'EIChannelAdapterBlock'
        shape :eimessaging_bridge_block                                    , "#{s}eip.messaging_bridge;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessagingBridgeBlock'
        shape :eimessage_bus_block                                         , cs.to_s, 'EIMessageBusBlock'
      end
      section :message_construction do
        shape :eicommand_message_block                                     , cs.to_s, 'EICommandMessageBlock'
        shape :eidocument_message_block                                    , cs.to_s, 'EIDocumentMessageBlock'
        shape :eievent_message_block                                       , cs.to_s, 'EIEventMessageBlock'
        shape :eirequest_reply_block                                       , cs.to_s, 'EIRequestReplyBlock'
        shape :eireturn_address_block                                      , cs.to_s, 'EIReturnAddressBlock'
        shape :eicorrelation_idblock                                       , cs.to_s, 'EICorrelationIDBlock'
        shape :eimessage_sequence_block                                    , cs.to_s, 'EIMessageSequenceBlock'
        shape :eimessage_expiration_block                                  , cs.to_s, 'EIMessageExpirationBlock'
      end
      section :message_routing do
        shape :eicontent_based_router_block                                , "#{s}eip.content_based_router;verticalLabelPosition=bottom;verticalAlign=top", 'EIContentBasedRouterBlock'
        shape :eimessage_filter_block                                      , "#{s}eip.message_filter;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessageFilterBlock'
        shape :eidynamic_router_block                                      , "#{s}eip.dynamic_router;verticalLabelPosition=bottom;verticalAlign=top", 'EIDynamicRouterBlock'
        shape :eirecipient_list_block                                      , "#{s}eip.recipient_list;verticalLabelPosition=bottom;verticalAlign=top", 'EIRecipientListBlock'
        shape :eisplitter_block                                            , "#{s}eip.splitter;verticalLabelPosition=bottom;verticalAlign=top", 'EISplitterBlock'
        shape :eiaggregator_block                                          , "#{s}eip.aggregator;verticalLabelPosition=bottom;verticalAlign=top", 'EIAggregatorBlock'
        shape :eiresequencer_block                                         , "#{s}eip.resequencer;verticalLabelPosition=bottom;verticalAlign=top", 'EIResequencerBlock'
        shape :eicomposed_message_block                                    , "#{s}eip.composed_message_processor;verticalLabelPosition=bottom;verticalAlign=top", 'EIComposedMessageBlock'
        shape :eirouting_slip_block                                        , "#{s}eip.routing_slip;verticalLabelPosition=bottom;verticalAlign=top", 'EIRoutingSlipBlock'
        shape :eiprocess_manager_block                                     , "#{s}eip.process_manager;verticalLabelPosition=bottom;verticalAlign=top", 'EIProcessManagerBlock'
        shape :eimessage_broker_block                                      , cs.to_s, 'EIMessageBrokerBlock'
      end
      section :message_transformation do
        shape :eienvelope_wrapper_block                                    , "#{s}eip.envelope_wrapper;verticalLabelPosition=bottom;verticalAlign=top", 'EIEnvelopeWrapperBlock'
        shape :eicontent_enricher_block                                    , "#{s}eip.content_enricher;verticalLabelPosition=bottom;verticalAlign=top", 'EIContentEnricherBlock'
        shape :eicontent_filter_block                                      , "#{s}eip.content_filter;verticalLabelPosition=bottom;verticalAlign=top", 'EIContentFilterBlock'
        shape :eiclaim_check_block                                         , "#{s}eip.claim_check;verticalLabelPosition=bottom;verticalAlign=top", 'EIClaimCheckBlock'
        shape :einormalizer_block                                          , "#{s}eip.normalizer;verticalLabelPosition=bottom;verticalAlign=top", 'EINormalizerBlock'
      end
      section :messaging_endpoints do
        shape :eimessaging_gateway_block                                   , "#{s}eip.messaging_gateway;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessagingGatewayBlock'
        shape :eitransactional_client_block                                , "#{s}eip.transactional_client;verticalLabelPosition=bottom;verticalAlign=top", 'EITransactionalClientBlock'
        shape :eipolling_consumer_block                                    , "#{s}eip.polling_consumer;verticalLabelPosition=bottom;verticalAlign=top", 'EIPollingConsumerBlock'
        shape :eievent_driven_consumer_block                               , "#{s}eip.event_driven_consumer;verticalLabelPosition=bottom;verticalAlign=top", 'EIEventDrivenConsumerBlock'
        shape :eicompeting_consumers_block                                 , "#{s}eip.competing_consumers;verticalLabelPosition=bottom;verticalAlign=top", 'EICompetingConsumersBlock'
        shape :eimessage_dispatcher_block                                  , "#{s}eip.message_dispatcher;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessageDispatcherBlock'
        shape :eiselective_consumer_block                                  , "#{s}eip.selective_consumer;verticalLabelPosition=bottom;verticalAlign=top", 'EISelectiveConsumerBlock'
        shape :eidurable_subscriber_block                                  , cs.to_s, 'EIDurableSubscriberBlock'
        shape :eiservice_activator_block                                   , "#{s}eip.service_activator;verticalLabelPosition=bottom;verticalAlign=top", 'EIServiceActivatorBlock'
      end
      section :system_management do
        shape :eicontrol_bus_block                                         , cs.to_s, 'EIControlBusBlock'
        shape :eidetour_block                                              , "#{s}eip.detour;verticalLabelPosition=bottom;verticalAlign=top", 'EIDetourBlock'
        shape :eiwire_tap_block                                            , "#{s}eip.wire_tap;verticalLabelPosition=bottom;verticalAlign=top", 'EIWireTapBlock'
        shape :eimessage_history_block                                     , cs.to_s, 'EIMessageHistoryBlock'
        shape :eimessage_store_block                                       , "#{s}eip.message_store;verticalLabelPosition=bottom;verticalAlign=top", 'EIMessageStoreBlock'
        shape :eismart_proxy_block                                         , "#{s}eip.smart_proxy;verticalLabelPosition=bottom;verticalAlign=top", 'EISmartProxyBlock'
        shape :eitest_message_block                                        , "#{s}eip.test_message;verticalLabelPosition=bottom;verticalAlign=top", 'EITestMessageBlock'
        shape :eichannel_purger_block                                      , "#{s}eip.channel_purger;verticalLabelPosition=bottom;verticalAlign=top", 'EIChannelPurgerBlock'
      end
      section :google_cloud_platform do
        shape :gcpicon_compute_engine_block                                , "#{gcpIcon}compute_engine", 'GCPIconComputeEngineBlock'
        shape :gcpicon_app_engine_block                                    , "#{gcpIcon}app_engine", 'GCPIconAppEngineBlock'
        shape :gcpicon_container_engine_block                              , "#{gcpIcon}container_engine", 'GCPIconContainerEngineBlock'
        shape :gcpicon_container_registry_block                            , "#{gcpIcon}container_registry", 'GCPIconContainerRegistryBlock'
        shape :gcpicon_cloud_functions_block                               , "#{gcpIcon}cloud_functions", 'GCPIconCloudFunctionsBlock'
        shape :gcpicon_cloud_storage_block                                 , "#{gcpIcon}cloud_storage", 'GCPIconCloudStorageBlock'
        shape :gcpicon_cloud_sqlblock                                      , "#{gcpIcon}cloud_sql", 'GCPIconCloudSQLBlock'
        shape :gcpicon_cloud_bigtable_block                                , "#{gcpIcon}cloud_bigtable", 'GCPIconCloudBigtableBlock'
        shape :gcpicon_cloud_datastore_block                               , "#{gcpIcon}cloud_datastore", 'GCPIconCloudDatastoreBlock'
        shape :gcpicon_persistent_disk_block                               , "#{gcpIcon}persistent_disk", 'GCPIconPersistentDiskBlock'
        shape :gcpicon_cloud_virtual_network_block                         , "#{ss}gcp.networking.cloud_virtual_network;verticalLabelPosition=bottom;verticalAlign=top",
              'GCPIconCloudVirtualNetworkBlock'
        shape :gcpicon_cloud_load_balancing_block                          , "#{gcpIcon}cloud_load_balancing", 'GCPIconCloudLoadBalancingBlock'
        shape :gcpicon_cloud_cdnblock                                      , "#{gcpIcon}cloud_cdn", 'GCPIconCloudCDNBlock'
        shape :gcpicon_cloud_interconnect_block                            , "#{gcpIcon}dedicated_interconnect", 'GCPIconCloudInterconnectBlock'
        shape :gcpicon_cloud_interconnect_block2                           , "#{gcpIcon}dedicated_interconnect", 'GCPIconCloudInterconnectBlock2'
        shape :gcpicon_cloud_dnsblock                                      , "#{gcpIcon}cloud_dns", 'GCPIconCloudDNSBlock'
        shape :gcpicon_big_query_block                                     , "#{gcpIcon}bigquery", 'GCPIconBigQueryBlock'
        shape :gcpicon_cloud_dataflow_block                                , "#{gcpIcon}cloud_dataflow", 'GCPIconCloudDataflowBlock'
        shape :gcpicon_cloud_dataproc_block                                , "#{gcpIcon}cloud_dataproc", 'GCPIconCloudDataprocBlock'
        shape :gcpicon_cloud_datalab_block                                 , "#{gcpIcon}cloud_datalab", 'GCPIconCloudDatalabBlock'
        shape :gcpicon_cloud_pub_sub_block                                 , "#{gcpIcon}cloud_pubsub", 'GCPIconCloudPubSubBlock'
        shape :gcpicon_genomics_block                                      , "#{gcpIcon}genomics", 'GCPIconGenomicsBlock'
        shape :gcpicon_cloud_machine_learning_services_block               , "#{gcpIcon}cloud_machine_learning", 'GCPIconCloudMachineLearningServicesBlock'
        shape :gcpicon_cloud_machine_learning_services_block2              , "#{gcpIcon}cloud_machine_learning", 'GCPIconCloudMachineLearningServicesBlock2'
        shape :gcpicon_vision_apiblock                                     , "#{gcpIcon}cloud_vision_api", 'GCPIconVisionAPIBlock'
        shape :gcpicon_vision_apiblock2                                    , "#{gcpIcon}cloud_vision_api", 'GCPIconVisionAPIBlock2'
        shape :gcpicon_speech_apiblock                                     , "#{gcpIcon}cloud_speech_api", 'GCPIconSpeechAPIBlock'
        shape :gcpicon_speech_apiblock2                                    , "#{gcpIcon}cloud_speech_api", 'GCPIconSpeechAPIBlock2'
        shape :gcpicon_natural_language_apiblock                           , "#{gcpIcon}cloud_natural_language_api", 'GCPIconNaturalLanguageAPIBlock'
        shape :gcpicon_natural_language_apiblock2                          , "#{gcpIcon}cloud_natural_language_api", 'GCPIconNaturalLanguageAPIBlock2'
        shape :gcpicon_translate_apiblock                                  , "#{gcpIcon}cloud_translation_api", 'GCPIconTranslateAPIBlock'
        shape :gcpicon_translate_apiblock2                                 , "#{gcpIcon}cloud_translation_api", 'GCPIconTranslateAPIBlock2'
        shape :gcpicon_stackdriver_overview_block                          , "#{gcpIcon}stackdriver", 'GCPIconStackdriverOverviewBlock'
        shape :gcpicon_stackdriver_overview_block2                         , "#{gcpIcon}stackdriver", 'GCPIconStackdriverOverviewBlock2'
        shape :gcpicon_monitoring_block                                    , "#{gcpIcon}cloud_deployment_manager", 'GCPIconMonitoringBlock'
        shape :gcpicon_logging_block                                       , "#{gcpIcon}logging", 'GCPIconLoggingBlock'
        shape :gcpicon_error_reporting_block                               , "#{gcpIcon}error_reporting", 'GCPIconErrorReportingBlock'
        shape :gcpicon_trace_block                                         , "#{gcpIcon}trace", 'GCPIconTraceBlock'
        shape :gcpicon_debugger_block                                      , "#{gcpIcon}debugger", 'GCPIconDebuggerBlock'
        shape :gcpicon_deployment_manager_block                            , "#{gcpIcon}cloud_deployment_manager", 'GCPIconDeploymentManagerBlock'
        shape :gcpicon_deployment_manager_block2                           , "#{gcpIcon}cloud_deployment_manager", 'GCPIconDeploymentManagerBlock2'
        shape :gcpicon_cloud_endpoints_block                               , "#{gcpIcon}cloud_endpoints", 'GCPIconCloudEndpointsBlock'
        shape :gcpicon_cloud_tools_for_power_shell_block                   , "#{gcpIcon}cloud_tools_for_powershell", 'GCPIconCloudToolsForPowerShellBlock'
        shape :gcpicon_cloud_tools_for_visual_studio_block                 , "#{gcpIcon}cloud_tools_for_powershell", 'GCPIconCloudToolsForVisualStudioBlock'
        shape :gcpicon_cloud_iamblock                                      , "#{gcpIcon}cloud_iam", 'GCPIconCloudIAMBlock'
        shape :gcpicon_gcplogo_block                                       , "#{gcpIcon}placeholder", 'GCPIconGCPLogoBlock'
        shape :gcpicon_gcplogo_block2                                      , "#{gcpIcon}placeholder", 'GCPIconGCPLogoBlock2'
        shape :gcpicon_blank_block                                         , "#{gcpIcon}blue_hexagon", 'GCPIconBlankBlock'
        shape :gcpicon_blank_block2                                        , "#{gcpIcon}blue_hexagon", 'GCPIconBlankBlock2'
        shape :gcpicon_apianalytics_block                                  , "#{gcpIcon}api_analytics", 'GCPIconAPIAnalyticsBlock'
        shape :gcpicon_apigee_apiplatform_block                            , "#{gcpIcon}apigee_api_platform", 'GCPIconApigeeAPIPlatformBlock'
        shape :gcpicon_apigee_sense_block                                  , "#{gcpIcon}apigee_sense", 'GCPIconApigeeSenseBlock'
        shape :gcpicon_apimonetization_block                               , "#{gcpIcon}api_monetization", 'GCPIconAPIMonetizationBlock'
        shape :gcpicon_cloud_endpoints_block2                              , "#{gcpIcon}cloud_endpoints", 'GCPIconCloudEndpointsBlock2'
        shape :gcpicon_developer_portal_block                              , "#{gcpIcon}developer_portal", 'GCPIconDeveloperPortalBlock'
        shape :gcpicon_big_query_block2                                    , "#{gcpIcon}bigquery", 'GCPIconBigQueryBlock2'
        shape :gcpicon_cloud_composer_block                                , "#{gcpIcon}cloud_composer", 'GCPIconCloudComposerBlock'
        shape :gcpicon_cloud_dataflow_block2                               , "#{gcpIcon}cloud_dataflow", 'GCPIconCloudDataflowBlock2'
        shape :gcpicon_cloud_datalab_block2                                , "#{gcpIcon}cloud_datalab", 'GCPIconCloudDatalabBlock2'
        shape :gcpicon_cloud_dataprep_block                                , "#{gcpIcon}cloud_dataprep", 'GCPIconCloudDataprepBlock'
        shape :gcpicon_cloud_dataproc_block2                               , "#{gcpIcon}cloud_dataproc", 'GCPIconCloudDataprocBlock2'
        shape :gcpicon_cloud_pub_sub_block2                                , "#{gcpIcon}cloud_pubsub", 'GCPIconCloudPubSubBlock2'
        shape :gcpicon_data_studio_block                                   , "#{gcpIcon}data_studio", 'GCPIconDataStudioBlock'
        shape :gcpicon_genomics_block2                                     , "#{gcpIcon}genomics", 'GCPIconGenomicsBlock2'
        shape :gcpicon_advanced_solutions_lab_block                        , "#{gcpIcon}advanced_solutions_lab", 'GCPIconAdvancedSolutionsLabBlock'
        shape :gcpicon_cloud_auto_mlblock                                  , "#{gcpIcon}cloud_automl", 'GCPIconCloudAutoMLBlock'
        shape :gcpicon_cloud_natural_language_apiblock                     , "#{gcpIcon}cloud_natural_language_api", 'GCPIconCloudNaturalLanguageAPIBlock'
        shape :gcpicon_cloud_jobs_apiblock                                 , "#{gcpIcon}cloud_jobs_api", 'GCPIconCloudJobsAPIBlock'
        shape :gcpicon_cloud_tpublock                                      , "#{gcpIcon}cloud_tpu", 'GCPIconCloudTPUBlock'
        shape :gcpicon_cloud_machine_learning_block                        , "#{gcpIcon}cloud_machine_learning", 'GCPIconCloudMachineLearningBlock'
        shape :gcpicon_cloud_vision_apiblock                               , "#{gcpIcon}cloud_vision_api", 'GCPIconCloudVisionAPIBlock'
        shape :gcpicon_cloud_translation_apiblock                          , "#{gcpIcon}cloud_translation_api", 'GCPIconCloudTranslationAPIBlock'
        shape :gcpicon_dialogflow_enterprise_edition_block                 , "#{gcpIcon}dialogflow_enterprise_edition", 'GCPIconDialogflowEnterpriseEditionBlock'
        shape :gcpicon_cloud_speech_apiblock                               , "#{gcpIcon}cloud_speech_api", 'GCPIconCloudSpeechAPIBlock'
        shape :gcpicon_cloud_textto_speech_block                           , "#{gcpIcon}cloud_text_to_speech", 'GCPIconCloudTexttoSpeechBlock'
        shape :gcpicon_cloud_video_intelligence_apiblock                   , "#{gcpIcon}cloud_video_intelligence_api", 'GCPIconCloudVideoIntelligenceAPIBlock'
        shape :gcpicon_app_engine_block2                                   , "#{gcpIcon}app_engine", 'GCPIconAppEngineBlock2'
        shape :gcpicon_cloud_toolsfor_visual_studio_block                  , "#{gcpIcon}cloud_tools_for_powershell", 'GCPIconCloudToolsforVisualStudioBlock'
        shape :gcpicon_cloud_deployment_manager_block                      , "#{gcpIcon}cloud_deployment_manager", 'GCPIconCloudDeploymentManagerBlock'
        shape :gcpicon_cloud_functions_block2                              , "#{gcpIcon}cloud_functions", 'GCPIconCloudFunctionsBlock2'
        shape :gcpicon_container_builder_block                             , "#{gcpIcon}container_builder", 'GCPIconContainerBuilderBlock'
        shape :gcpicon_cloud_sdkblock                                      , "#{gcpIcon}placeholder", 'GCPIconCloudSDKBlock'
        shape :gcpicon_cloud_source_repositories_block                     , "#{gcpIcon}placeholder", 'GCPIconCloudSourceRepositoriesBlock'
        shape :gcpicon_container_registry_block2                           , "#{gcpIcon}container_registry", 'GCPIconContainerRegistryBlock2'
        shape :gcpicon_cloud_test_lab_block                                , "#{gcpIcon}placeholder", 'GCPIconCloudTestLabBlock'
        shape :gcpicon_gpublock                                            , "#{gcpIcon}gpu", 'GCPIconGPUBlock'
        shape :gcpicon_container_engine_block2                             , "#{gcpIcon}container_engine", 'GCPIconContainerEngineBlock2'
        shape :gcpicon_transfer_appliance_block                            , "#{gcpIcon}transfer_appliance", 'GCPIconTransferApplianceBlock'
        shape :gcpicon_cloud_toolsfor_power_shell_block                    , "#{gcpIcon}cloud_tools_for_powershell", 'GCPIconCloudToolsforPowerShellBlock'
        shape :gcpicon_cloud_toolsfor_intelli_jblock                       , "#{gcpIcon}placeholder", 'GCPIconCloudToolsforIntelliJBlock'
        shape :gcpicon_cloud_toolsfor_android_studio_block                 , "#{gcpIcon}placeholder", 'GCPIconCloudToolsforAndroidStudioBlock'
        shape :gcpicon_google_pluginfor_eclipse_block                      , "#{gcpIcon}placeholder", 'GCPIconGooglePluginforEclipseBlock'
        shape :gcpicon_container_optimized_osblock                         , "#{gcpIcon}container_optimized_os", 'GCPIconContainerOptimizedOSBlock'
        shape :gcpicon_compute_engine_block2                               , "#{gcpIcon}compute_engine", 'GCPIconComputeEngineBlock2'
        shape :gcpicon_beyond_corp_block                                   , "#{gcpIcon}beyondcorp", 'GCPIconBeyondCorpBlock'
        shape :gcpicon_cloud_iamblock2                                     , "#{gcpIcon}cloud_iam", 'GCPIconCloudIAMBlock2'
        shape :gcpicon_cloud_resource_manager_block                        , "#{gcpIcon}cloud_iam", 'GCPIconCloudResourceManagerBlock'
        shape :gcpicon_cloud_security_command_center_block                 , "#{gcpIcon}cloud_security_command_center", 'GCPIconCloudSecurityCommandCenterBlock'
        shape :gcpicon_cloud_security_scanner_block                        , "#{gcpIcon}cloud_security_scanner", 'GCPIconCloudSecurityScannerBlock'
        shape :gcpicon_data_loss_prevention_apiblock                       , "#{gcpIcon}data_loss_prevention_api", 'GCPIconDataLossPreventionAPIBlock'
        shape :gcpicon_identity_aware_proxy_block                          , "#{gcpIcon}identity_aware_proxy", 'GCPIconIdentityAwareProxyBlock'
        shape :gcpicon_key_management_service_block                        , "#{gcpIcon}key_management_service", 'GCPIconKeyManagementServiceBlock'
        shape :gcpicon_security_key_enforcement_block                      , "#{gcpIcon}security_key_enforcement", 'GCPIconSecurityKeyEnforcementBlock'
        shape :gcpicon_cloud_io_tcore_block                                , "#{gcpIcon}cloud_iot_core", 'GCPIconCloudIoTCoreBlock'
        shape :gcpicon_cloud_apis_block                                    , "#{gcpIcon}cloud_apis", 'GCPIconCloudAPIsBlock'
        shape :gcpicon_cloud_billing_apiblock                              , "#{gcpIcon}placeholder", 'GCPIconCloudBillingAPIBlock'
        shape :gcpicon_cloud_console_block                                 , "#{gcpIcon}placeholder", 'GCPIconCloudConsoleBlock'
        shape :gcpicon_cloud_deployment_manager_block2                     , "#{gcpIcon}cloud_deployment_manager", 'GCPIconCloudDeploymentManagerBlock2'
        shape :gcpicon_cloud_mobile_app_block                              , "#{gcpIcon}placeholder", 'GCPIconCloudMobileAppBlock'
        shape :gcpicon_cloud_shell_block                                   , "#{gcpIcon}placeholder", 'GCPIconCloudShellBlock'
        shape :gcpicon_debugger_block2                                     , "#{gcpIcon}debugger", 'GCPIconDebuggerBlock2'
        shape :gcpicon_error_reporting_block2                              , "#{gcpIcon}error_reporting", 'GCPIconErrorReportingBlock2'
        shape :gcpicon_logging_block2                                      , "#{gcpIcon}logging", 'GCPIconLoggingBlock2'
        shape :gcpicon_monitoring_block2                                   , "#{gcpIcon}cloud_deployment_manager", 'GCPIconMonitoringBlock2'
        shape :gcpicon_stackdriver_block                                   , "#{gcpIcon}stackdriver", 'GCPIconStackdriverBlock'
        shape :gcpicon_trace_block2                                        , "#{gcpIcon}trace", 'GCPIconTraceBlock2'
        shape :gcpicon_cloud_armor_block                                   , "#{gcpIcon}cloud_armor", 'GCPIconCloudArmorBlock'
        shape :gcpicon_cloud_cdnblock2                                     , "#{gcpIcon}cloud_cdn", 'GCPIconCloudCDNBlock2'
        shape :gcpicon_cloud_dnsblock2                                     , "#{gcpIcon}cloud_dns", 'GCPIconCloudDNSBlock2'
        shape :gcpicon_cloud_external_ipaddresses_block                    , "#{gcpIcon}cloud_external_ip_addresses", 'GCPIconCloudExternalIPAddressesBlock'
        shape :gcpicon_cloud_firewall_rules_block                          , "#{gcpIcon}cloud_firewall_rules", 'GCPIconCloudFirewallRulesBlock'
        shape :gcpicon_cloud_load_balancing_block2                         , "#{gcpIcon}cloud_load_balancing", 'GCPIconCloudLoadBalancingBlock2'
        shape :gcpicon_cloud_network_block                                 , "#{gcpIcon}cloud_network", 'GCPIconCloudNetworkBlock'
        shape :gcpicon_cloud_router_block                                  , "#{gcpIcon}cloud_router", 'GCPIconCloudRouterBlock'
        shape :gcpicon_cloud_routes_block                                  , "#{gcpIcon}cloud_routes", 'GCPIconCloudRoutesBlock'
        shape :gcpicon_cloud_vpnblock                                      , "#{gcpIcon}cloud_vpn", 'GCPIconCloudVPNBlock'
        shape :gcpicon_dedicated_interconnect_block                        , "#{gcpIcon}dedicated_interconnect", 'GCPIconDedicatedInterconnectBlock'
        shape :gcpicon_partner_interconnect_block                          , "#{gcpIcon}partner_interconnect", 'GCPIconPartnerInterconnectBlock'
        shape :gcpicon_premium_network_tier_block                          , "#{gcpIcon}premium_network_tier", 'GCPIconPremiumNetworkTierBlock'
        shape :gcpicon_standard_network_tier_block                         , "#{gcpIcon}standard_network_tier", 'GCPIconStandardNetworkTierBlock'
        shape :gcpicon_virtual_private_cloud_block                         , "#{gcpIcon}virtual_private_cloud", 'GCPIconVirtualPrivateCloudBlock'
        shape :gcpicon_cloud_bigtable_block2                               , "#{gcpIcon}cloud_bigtable", 'GCPIconCloudBigtableBlock2'
        shape :gcpicon_cloud_datastore_block2                              , "#{gcpIcon}cloud_datastore", 'GCPIconCloudDatastoreBlock2'
        shape :gcpicon_cloud_filestore_block                               , "#{gcpIcon}cloud_filestore", 'GCPIconCloudFilestoreBlock'
        shape :gcpicon_cloud_memorystore_block                             , "#{gcpIcon}cloud_memorystore", 'GCPIconCloudMemorystoreBlock'
        shape :gcpicon_cloud_spanner_block                                 , "#{gcpIcon}cloud_spanner", 'GCPIconCloudSpannerBlock'
        shape :gcpicon_cloud_sqlblock2                                     , "#{gcpIcon}cloud_sql", 'GCPIconCloudSQLBlock2'
        shape :gcpicon_cloud_storage_block2                                , "#{gcpIcon}cloud_storage", 'GCPIconCloudStorageBlock2'
        shape :gcpicon_persistent_disk_block2                              , "#{gcpIcon}persistent_disk", 'GCPIconPersistentDiskBlock2'
        shape :gcpicon_google_cloud_platform_block                         , "#{gcpIcon}google_cloud_platform", 'GCPIconGoogleCloudPlatformBlock'
        shape :gcpicon_blue_hexagon_block                                  , "#{gcpIcon}blue_hexagon", 'GCPIconBlueHexagonBlock'
        shape :gcpicon_generic_block                                       , "#{gcpIcon}placeholder", 'GCPIconGenericBlock'
        shape :gcpicon_prediction_apiblock                                 , "#{gcpIcon}prediction_api", 'GCPIconPredictionAPIBlock'
        shape :gcpauto_scaling_modifier                                    , 'shape=mxgraph.gcp2.modifiers_autoscaling;fillColor=#757575;strokeColor=none;', 'GCPAutoScalingModifier'
        shape :gcpcustom_virtual_machine_modifier                          , 'shape=mxgraph.gcp2.modifiers_custom_virtual_machine;fillColor=#757575;strokeColor=none;',
              'GCPCustomVirtualMachineModifier'
        shape :gcphigh_cpumachine_modifier                                 , 'shape=mxgraph.gcp2.modifiers_high_cpu_machine;fillColor=#757575;strokeColor=none;', 'GCPHighCPUMachineModifier'
        shape :gcphigh_memory_machine_modifier                             , 'shape=mxgraph.gcp2.modifiers_high_memory_machine;fillColor=#757575;strokeColor=none;', 'GCPHighMemoryMachineModifier'
        shape :gcppreemptable_vsmodifier                                   , 'shape=mxgraph.gcp2.modifiers_preemptable_vm;fillColor=#757575;strokeColor=none;', 'GCPPreemptableVSModifier'
        shape :gcpshared_core_machine_f1modifier                           , 'shape=mxgraph.gcp2.modifiers_shared_core_machine_f1;fillColor=#757575;strokeColor=none;', 'GCPSharedCoreMachineF1Modifier'
        shape :gcpshared_core_machine_g1modifier                           , 'shape=mxgraph.gcp2.modifiers_shared_core_machine_g1;fillColor=#757575;strokeColor=none;', 'GCPSharedCoreMachineG1Modifier'
        shape :gcpstandard_machine_modifier                                , 'shape=mxgraph.gcp2.modifiers_standard_machine;fillColor=#757575;strokeColor=none;', 'GCPStandardMachineModifier'
        shape :gcpstorage_modifier                                         , 'shape=mxgraph.gcp2.modifiers_storage;fillColor=#757575;strokeColor=none;', 'GCPStorageModifier'
        shape :gcpapp_engine_product_card                                  , cs.to_s, 'GCPAppEngineProductCard'
        shape :gcpcloud_dataflow_product_card                              , cs.to_s, 'GCPCloudDataflowProductCard'
        shape :gcpcloud_dataproc_product_card                              , cs.to_s, 'GCPCloudDataprocProductCard'
        shape :gcpcompute_engine_product_card                              , cs.to_s, 'GCPComputeEngineProductCard'
        shape :gcpcontainer_engine_product_card                            , cs.to_s, 'GCPContainerEngineProductCard'
      end
      section :kubernetes_icons do
        shape :cronjob_labeled_kub19                                       , "#{kupIcon}cronjob", 'CronjobLabeledKub19'
        shape :cronjob_kub19                                               , "#{kupIcon}cronjob", 'CronjobKub19'
        shape :deploy_labeled_kub19                                        , "#{kupIcon}deploy", 'DeployLabeledKub19'
        shape :deploy_kub19                                                , "#{kupIcon}deploy", 'DeployKub19'
        shape :ds_labeled_kub19                                            , "#{kupIcon}ds", 'DsLabeledKub19'
        shape :ds_kub19                                                    , "#{kupIcon}ds", 'DsKub19'
        shape :job_labeled_kub19                                           , "#{kupIcon}job", 'JobLabeledKub19'
        shape :job_kub19                                                   , "#{kupIcon}job", 'JobKub19'
        shape :pod_labeled_kub19                                           , "#{kupIcon}pod", 'PodLabeledKub19'
        shape :pod_kub19                                                   , "#{kupIcon}pod", 'PodKub19'
        shape :rs_labeled_kub19                                            , "#{kupIcon}rs", 'RsLabeledKub19'
        shape :rs_kub19                                                    , "#{kupIcon}rs", 'RsKub19'
        shape :sts_labeled_kub19                                           , "#{kupIcon}sts", 'StsLabeledKub19'
        shape :sts_kub19                                                   , "#{kupIcon}sts", 'StsKub19'
        shape :pv_labeled_kub19                                            , "#{kupIcon}pv", 'PvLabeledKub19'
        shape :pv_kub19                                                    , "#{kupIcon}pv", 'PvKub19'
        shape :pvc_labeled_kub19                                           , "#{kupIcon}pvc", 'PvcLabeledKub19'
        shape :pvc_kub19                                                   , "#{kupIcon}pvc", 'PvcKub19'
        shape :sc_labeled_kub19                                            , "#{kupIcon}sc", 'ScLabeledKub19'
        shape :sc_kub19                                                    , "#{kupIcon}sc", 'ScKub19'
        shape :vol_labeled_kub19                                           , "#{kupIcon}vol", 'VolLabeledKub19'
        shape :vol_kub19                                                   , "#{kupIcon}vol", 'VolKub19'
        shape :ep_labeled_kub19                                            , "#{kupIcon}ep", 'EpLabeledKub19'
        shape :ep_kub19                                                    , "#{kupIcon}ep", 'EpKub19'
        shape :ing_labeled_kub19                                           , "#{kupIcon}ing", 'IngLabeledKub19'
        shape :ing_kub19                                                   , "#{kupIcon}ing", 'IngKub19'
        shape :netpol_labeled_kub19                                        , "#{kupIcon}netpol", 'NetpolLabeledKub19'
        shape :netpol_kub19                                                , "#{kupIcon}netpol", 'NetpolKub19'
        shape :svc_labeled_kub19                                           , "#{kupIcon}svc", 'SvcLabeledKub19'
        shape :svc_kub19                                                   , "#{kupIcon}svc", 'SvcKub19'
        shape :crd_labeled_kub19                                           , "#{kupIcon}crd", 'CrdLabeledKub19'
        shape :crd_kub19                                                   , "#{kupIcon}crd", 'CrdKub19'
        shape :crole_labeled_kub19                                         , "#{kupIcon}c_role", 'CroleLabeledKub19'
        shape :crole_kub19                                                 , "#{kupIcon}c_role", 'CroleKub19'
        shape :group_labeled_kub19                                         , "#{kupIcon}group", 'GroupLabeledKub19'
        shape :group_kub19                                                 , "#{kupIcon}group", 'GroupKub19'
        shape :rb_labeled_kub19                                            , "#{kupIcon}rb", 'RbLabeledKub19'
        shape :rb_kub19                                                    , "#{kupIcon}rb", 'RbKub19'
        shape :role_labeled_kub19                                          , "#{kupIcon}role", 'RoleLabeledKub19'
        shape :role_kub19                                                  , "#{kupIcon}role", 'RoleKub19'
        shape :sa_labeled_kub19                                            , "#{kupIcon}sa", 'SaLabeledKub19'
        shape :sa_kub19                                                    , "#{kupIcon}sa", 'SaKub19'
        shape :user_labeled_kub19                                          , "#{kupIcon}user", 'UserLabeledKub19'
        shape :user_kub19                                                  , "#{kupIcon}user", 'UserKub19'
        shape :cm_resource_labeled_kub19                                   , "#{kupIcon}cm", 'CmResourceLabeledKub19'
        shape :cm_kub19                                                    , "#{kupIcon}cm", 'CmKub19'
        shape :secret_labeled_kub19                                        , "#{kupIcon}secret", 'SecretLabeledKub19'
        shape :secret_kub19                                                , "#{kupIcon}secret", 'SecretKub19'
        shape :hpa_labeled_kub19                                           , "#{kupIcon}hpa", 'HpaLabeledKub19'
        shape :hpa_kub19                                                   , "#{kupIcon}hpa", 'HpaKub19'
        shape :limits_labeled_kub19                                        , "#{kupIcon}limits", 'LimitsLabeledKub19'
        shape :limits_kub19                                                , "#{kupIcon}limits", 'LimitsKub19'
        shape :quota_labeled_kub19                                         , "#{kupIcon}quota", 'QuotaLabeledKub19'
        shape :quota_kub19                                                 , "#{kupIcon}quota", 'QuotaKub19'
        shape :crb_labeled_kub19                                           , "#{kupIcon}crb", 'CrbLabeledKub19'
        shape :crb_kub19                                                   , "#{kupIcon}crb", 'CrbKub19'
        shape :logo_kub19                                                  , 'aspect=fixed;html=1;align=center;image;image=img/lib/mscae/Kubernetes.svg', 'LogoKub19'
        shape :ns_labeled_kub19                                            , "#{kupIcon}ns", 'NsLabeledKub19'
        shape :ns_kub19                                                    , "#{kupIcon}ns", 'NsKub19'
        shape :psp_labeled_kub19                                           , "#{kupIcon}psp", 'PspLabeledKub19'
        shape :psp_kub19                                                   , "#{kupIcon}psp", 'PspKub19'
        shape :etcd_labeled_kub19                                          , "#{kupIcon}etcd", 'EtcdLabeledKub19'
        shape :etcd_kub19                                                  , "#{kupIcon}etcd", 'EtcdKub19'
        shape :master_labeled_kub19                                        , "#{kupIcon}master", 'MasterLabeledKub19'
        shape :master_kub19                                                , "#{kupIcon}master", 'MasterKub19'
        shape :node_labeled_kub19                                          , "#{kupIcon}node", 'NodeLabeledKub19'
        shape :node_kub19                                                  , "#{kupIcon}node", 'NodeKub19'
        shape :api_labeled_kub19                                           , "#{kupIcon}api", 'ApiLabeledKub19'
        shape :ccm_labeled_kub19                                           , "#{kupIcon}c_c_m", 'CcmLabeledKub19'
        shape :cm_labeled_kub19                                            , "#{kupIcon}c_m", 'CmLabeledKub19'
        shape :kproxy_labeled_kub19                                        , "#{kupIcon}node", 'KproxyLabeledKub19'
        shape :kubelet_labeled_kub19                                       , "#{kupIcon}kubelet", 'KubeletLabeledKub19'
        shape :sched_labeled_kub19                                         , "#{kupIcon}sched", 'SchedLabeledKub19'
      end
      section :equation do
        shape :equation                                                    , cs.to_s, 'Equation'
      end
      section :walls do
        shape :fp_wall                                                     , cs.to_s, 'fpWall'
      end
      section :doors_windows do
        shape :fp_window                                                   , "#{s}floorplan.window;strokeWidth=3", 'fpWindow'
        shape :fp_opening                                                  , 'shape=rect', 'fpOpening'
        shape :fp_door                                                     , cs.to_s, 'fpDoor'
        shape :fp_double_door                                              , cs.to_s, 'fpDoubleDoor'
      end
      section :stairs do
        shape :fp_stairs                                                   , "#{s}floorplan.stairs;direction=north", 'fpStairs'
        shape :fp_stairs_directional                                       , "#{s}floorplan.stairs;direction=north;verticalAlign=bottom", 'fpStairsDirectional'
      end
      section :desks do
        shape :fp_desk_long_segment                                        , '', 'fpDeskLongSegment'
        shape :fp_desk_short_segment                                       , '', 'fpDeskShortSegment'
        shape :fp_desk_large_corner_segment                                , "#{s}floorplan.desk_corner", 'fpDeskLargeCornerSegment'
      end
      section :cubicle_walls do
        shape :fp_cubicle_panel                                            , "#{s}floorplan.wall;wallThickness=3", 'fpCubiclePanel'
        shape :fp_cubicle_workstation                                      , "#{s}floorplan.wallU;wallThickness=3", 'fpCubicleWorkstation'
        shape :fp_cubicle_corner5x5                                        , "#{s}floorplan.wallCorner;wallThickness=3", 'fpCubicleCorner5x5'
        shape :fp_cubicle_corner6x6                                        , "#{s}floorplan.wallCorner;wallThickness=3", 'fpCubicleCorner6x6'
        shape :fp_cubicle_corner8x8                                        , "#{s}floorplan.wallCorner;wallThickness=3", 'fpCubicleCorner8x8'
        shape :fp_cubicle_corner8x6                                        , "#{s}floorplan.wallCorner;wallThickness=3", 'fpCubicleCorner8x6'
        shape :fp_cubicle_corner_open6x4                                   , "#{s}floorplan.wallCorner;wallThickness=3", 'fpCubicleCornerOpen6x4'
        shape :fp_cubicle_double14x8                                       , "#{s}floorplan.wallU;wallThickness=3", 'fpCubicleDouble14x8'
        shape :fp_cubicle_enclosed11x9                                     , "#{s}floorplan.wallU;wallThickness=3", 'fpCubicleEnclosed11x9'
      end
      section :tables_chairs do
        shape :fp_table_conference_oval                                    , 'ellipse', 'fpTableConferenceOval'
        shape :fp_table_conference_boat                                    , '', 'fpTableConferenceBoat'
        shape :fp_table_conference_rectangle                               , '', 'fpTableConferenceRectangle'
        shape :fp_table_dining_round                                       , 'ellipse', 'fpTableDiningRound'
        shape :fp_table_dining_square                                      , '', 'fpTableDiningSquare'
        shape :fp_chair_office                                             , "#{s}floorplan.office_chair", 'fpChairOffice'
        shape :fp_chair_executive                                          , "#{s}floorplan.office_chair", 'fpChairExecutive'
        shape :fp_chair_lobby                                              , "#{s}floorplan.office_chair", 'fpChairLobby'
        shape :fp_chair_dining                                             , "#{s}floorplan.chair", 'fpChairDining'
        shape :fp_chair_barstool                                           , 'ellipse', 'fpChairBarstool'
      end
      section :cabinets___we_do_not_have_corresponding_stencils_just_rounded_rectangles do
        shape :fp_cabinet_basic                                            , '', 'fpCabinetBasic'
        shape :fp_cabinet_double_wide                                      , '', 'fpCabinetDoubleWide'
        shape :fp_cabinet_double_with_shelves                              , '', 'fpCabinetDoubleWithShelves'
        shape :fp_cabinet_shelves_basic                                    , '', 'fpCabinetShelvesBasic'
        shape :fp_cabinet_shelves_double                                   , '', 'fpCabinetShelvesDouble'
        shape :fp_cabinet_basic_with_shelves                               , '', 'fpCabinetBasicWithShelves'
        shape :fp_cabinets_above_desk_shelves                              , '', 'fpCabinetsAboveDeskShelves'
      end
      section :restroom do
        shape :fp_restroom_toilet_private                                  , "#{s}floorplan.toilet", 'fpRestroomToiletPrivate'
        shape :fp_restroom_toilet_public                                   , "#{s}floorplan.toilet", 'fpRestroomToiletPublic'
        shape :fp_restroom_lights                                          , cs.to_s, 'fpRestroomLights'
        shape :fp_restroom_sinks                                           , cs.to_s, 'fpRestroomSinks'
        shape :fp_restroom_bathtub                                         , "#{s}floorplan.bathtub;direction=south", 'fpRestroomBathtub'
        shape :fp_restroom_shower                                          , "#{s}floorplan.shower;flipH=1", 'fpRestroomShower'
        shape :fp_restroom_pedastal_sink                                   , "#{s}floorplan.sink_1", 'fpRestroomPedastalSink'
        shape :fp_restroom_countertop                                      , '', 'fpRestroomCountertop'
        shape :fp_restroom_mirror                                          , 'shape=line;strokeWidth=3', 'fpRestroomMirror'
        shape :fp_restroom_stalls                                          , cs.to_s, 'fpRestroomStalls'
      end
      section :beds do
        shape :fp_bed_double                                               , "#{s}floorplan.bed_double", 'fpBedDouble'
        shape :fp_bed_single                                               , "#{s}floorplan.bed_single", 'fpBedSingle'
        shape :fp_bed_queen                                                , "#{s}floorplan.bed_double", 'fpBedQueen'
        shape :fp_bed_king                                                 , "#{s}floorplan.bed_double", 'fpBedKing'
        shape :fp_bed_double_with_trundle                                  , "#{s}floorplan.bed_double", 'fpBedDoubleWithTrundle'
        shape :fp_bed_bunk                                                 , "#{s}floorplan.bed_double", 'fpBedBunk'
        shape :fp_bed_bassinet                                             , "#{s}pid.fittings.compensator", 'fpBedBassinet'
      end
      section :appliances do
        shape :fp_appliance_washer                                         , '', 'fpApplianceWasher'
        shape :fp_appliance_dryer                                          , '', 'fpApplianceDryer'
        shape :fp_appliance_water_heater                                   , 'ellipse', 'fpApplianceWaterHeater'
        shape :fp_appliance_stove_oven                                     , "#{s}floorplan.range_1", 'fpApplianceStoveOven'
        shape :fp_stove_oven_six_burner                                    , "#{s}floorplan.range_2", 'fpStoveOvenSixBurner'
        shape :fp_appliance_dishwasher                                     , '', 'fpApplianceDishwasher'
      end
      section :kitchen do
        shape :fp_kitchen_sink                                             , "#{s}floorplan.sink_2", 'fpKitchenSink'
        shape :fp_kitchen_double_sink                                      , "#{s}floorplan.sink_double", 'fpKitchenDoubleSink'
        shape :fp_kitchen_countertop                                       , '', 'fpKitchenCountertop'
        shape :fp_kitchen_countertop_corner                                , "#{s}floorplan.desk_corner", 'fpKitchenCountertopCorner'
      end
      section :couches do
        shape :fp_couch_love_seat                                          , "#{s}floorplan.couch", 'fpCouchLoveSeat'
        shape :fp_couch_sofa                                               , "#{s}floorplan.couch", 'fpCouchSofa'
        shape :fp_couch_ottoman                                            , '', 'fpCouchOttoman'
      end
      section :technology do
        shape :fp_misc_desktop_computer                                    , "#{s}floorplan.workstation", 'fpMiscDesktopComputer'
        shape :fp_misc_laptop_computer                                     , "#{s}floorplan.laptop", 'fpMiscLaptopComputer'
        shape :fp_computer_monitor                                         , "#{s}floorplan.flat_tv", 'fpComputerMonitor'
        shape :fp_crttelevision                                            , "#{s}floorplan.flat_tv", 'fpCRTTelevision'
      end
      section :misc_floorplan do
        shape :fp_misc_indoor_plant                                        , "#{s}floorplan.plant", 'fpMiscIndoorPlant'
        shape :fp_piano                                                    , "#{s}floorplan.piano", 'fpPiano'
      end
      section :equipment do
        shape :peaxial_compressor                                          , "#{s}pid.compressors.centrifugal_compressor_-_turbine_driven;verticalLabelPosition=bottom;verticalAlign=top",
              'PEAxialCompressor'
        shape :pecentrifugal_compressor                                    , "#{s}pid.compressors.centrifugal_compressor;verticalLabelPosition=bottom;verticalAlign=top", 'PECentrifugalCompressor'
        shape :pecentrifugal_compressor2                                   , "#{s}pid.compressors.centrifugal_compressor_-_turbine_driven;verticalLabelPosition=bottom;verticalAlign=top",
              'PECentrifugalCompressor2'
        shape :pereciprocation_compressor                                  , "#{s}pid.compressors.reciprocating_compressor;verticalLabelPosition=bottom;verticalAlign=top", 'PEReciprocationCompressor'
        shape :perotary_compressor_block                                   , "#{s}pid.compressors.rotary_compressor;verticalLabelPosition=bottom;verticalAlign=top", 'PERotaryCompressorBlock'
        shape :perotary_compressor2block                                   , "#{s}pid.compressors.compressor_and_silencers;verticalLabelPosition=bottom;verticalAlign=top", 'PERotaryCompressor2Block'
        shape :peconveyor_block                                            , "#{s}pid2misc.conveyor;verticalLabelPosition=bottom;verticalAlign=top", 'PEConveyorBlock'
        shape :peelevator1block                                            , "#{s}pid.misc.bucket_elevator;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'PEElevator1Block'
        shape :peagitator_mixer_block                                      , "#{s}pid.agitators.agitator_(propeller);verticalLabelPosition=bottom;verticalAlign=top", 'PEAgitatorMixerBlock'
        shape :pedrum_block                                                , "#{s}pid.vessels.drum_or_condenser;verticalLabelPosition=bottom;verticalAlign=top", 'PEDrumBlock'
        shape :petank_equipment_block                                      , "#{s}pid.vessels.tank;verticalLabelPosition=bottom;verticalAlign=top", 'PETankEquipmentBlock'
        shape :pemixing_reactor_block                                      , "#{s}pid.vessels.mixing_reactor;verticalLabelPosition=bottom;verticalAlign=top", 'PEMixingReactorBlock'
        shape :peplate_tower_block                                         , "#{s}pid2misc.column;columnType=baffle;verticalLabelPosition=bottom;verticalAlign=top", 'PEPlateTowerBlock'
        shape :pepacked_tower_block                                        , "#{s}pid2misc.column;columnType=fixed;verticalLabelPosition=bottom;verticalAlign=top", 'PEPackedTowerBlock'
        shape :pefurnace_block                                             , "#{s}pid.vessels.furnace;verticalLabelPosition=bottom;verticalAlign=top", 'PEFurnaceBlock'
      end
      section :piping do
        shape :peone_to_many                                               , cs.to_s, 'PEOneToMany'
        shape :pemultilines                                                , cs.to_s, 'PEMultilines'
        shape :pemid_arrow                                                 , 'shape=triangle;anchorPointDirection=0', 'PEMidArrow'
        shape :pebutt_weld                                                 , "#{s}sysml.x", 'PEButtWeld'
        shape :petop_to_top                                                , "#{s}pid.vessels.container,_tank,_cistern", 'PETopToTop'
        shape :penuclear                                                   , "#{s}electrical.waveforms.sine_wave", 'PENuclear'
        shape :pemechanical_link                                           , 'ellipse', 'PEMechanicalLink'
        shape :pesoldered_solvent                                          , 'ellipse', 'PESolderedSolvent'
        shape :pedouble_containment                                        , 'shape=hexagon;perimeter=hexagonPerimeter2', 'PEDoubleContainment'
        shape :peflange                                                    , "#{s}pid.piping.double_flange", 'PEFlange'
        shape :peflange2                                                   , "#{s}pid.piping.flange_in;flipH=1", 'PEFlange2'
        shape :peend_cap                                                   , "#{s}pid.piping.cap", 'PEEndCap'
        shape :peend_cap2                                                  , "#{s}pid.vessels.container,_tank,_cistern;direction=north", 'PEEndCap2'
        shape :pebreather                                                  , "#{s}pid.piping.breather", 'PEBreather'
        shape :peelectronically_insulated                                  , "#{s}pid.piping.double_flange", 'PEElectronicallyInsulated'
        shape :pereducer                                                   , "#{s}pid.piping.concentric_reducer", 'PEReducer'
        shape :peinline_mixer                                              , "#{s}pid.piping.in-line_mixer", 'PEInlineMixer'
        shape :peflame_arrester                                            , "#{s}pid.piping.flame_arrestor", 'PEFlameArrester'
        shape :pedetonation_arrester                                       , "#{s}pid.piping.detonation_arrestor", 'PEDetonationArrester'
        shape :petriangle_separator                                        , 'shape=triangle;direction=west;anchorPointDirection=0', 'PETriangleSeparator'
        shape :petundish                                                   , "#{s}ios7.misc.left", 'PETundish'
        shape :peopen_vent                                                 , "#{s}pid.vessels.vent_(bent)", 'PEOpenVent'
        shape :peremovable_spool                                           , "#{s}pid.piping.removable_spool", 'PERemovableSpool'
        shape :peytype_strainer                                            , "#{s}pid.piping.y-type_strainer", 'PEYTypeStrainer'
        shape :pediverter_valve                                            , "#{s}pid.piping.diverter_valve", 'PEDiverterValve'
        shape :pepulsation_dampener                                        , "#{s}pid.piping.pulsation_dampener", 'PEPulsationDampener'
        shape :peduplex_strainer                                           , "#{s}pid.piping.duplex_strainer", 'PEDuplexStrainer'
        shape :pebasket_strainer                                           , "#{s}pid.piping.basket_strainer", 'PEBasketStrainer'
        shape :pevent_silencer                                             , "#{s}pid.piping.vent_silencer", 'PEVentSilencer'
        shape :peinline_silencer                                           , "#{s}pid.piping.in-line_silencer", 'PEInlineSilencer'
        shape :pesteam_trap                                                , "#{s}pid.piping.steam_trap", 'PESteamTrap'
        shape :pedesuperheater                                             , "#{s}pid.piping.desuper_heater", 'PEDesuperheater'
        shape :peejector_or_eductor                                        , "#{s}pid.fittings.injector", 'PEEjectorOrEductor'
        shape :peexhaust_head                                              , "#{s}pid.piping.exhaust_head", 'PEExhaustHead'
        shape :perotary_valve                                              , "#{s}pid.piping.rotary_valve", 'PERotaryValve'
        shape :peexpansion_joint                                           , "#{s}pid.piping.expansion_joint", 'PEExpansionJoint'
      end
      section :vessels do
        shape :pevessel_block                                              , cs.to_s, 'PEVesselBlock'
        shape :peopen_tank_block                                           , "#{s}pid.vessels.container,_tank,_cistern;verticalLabelPosition=bottom;verticalAlign=top", 'PEOpenTankBlock'
        shape :peopen_top_tank                                             , "#{s}pid.vessels.container,_tank,_cistern;verticalLabelPosition=bottom;verticalAlign=top", 'PEOpenTopTank'
        shape :peclosed_tank_block                                         , cs.to_s, 'PEClosedTankBlock'
        shape :pestorage_sphere_block                                      , "#{s}pid.vessels.storage_sphere;verticalLabelPosition=bottom;verticalAlign=top", 'PEStorageSphereBlock'
        shape :pecolumn_block                                              , cs.to_s, 'PEColumnBlock'
        shape :pebag_block                                                 , "#{s}pid.vessels.bag;verticalLabelPosition=bottom;verticalAlign=top", 'PEBagBlock'
        shape :pegas_cylinder_block                                        , "#{s}pid.vessels.gas_bottle;verticalLabelPosition=bottom;verticalAlign=top", 'PEGasCylinderBlock'
        shape :pegas_holder_block                                          , "#{s}pid.vessels.gas_holder;verticalLabelPosition=bottom;verticalAlign=top", 'PEGasHolderBlock'
        shape :peclarifier_block                                           , "#{s}pid.vessels.bunker_(conical_bottom);verticalLabelPosition=bottom;verticalAlign=top", 'PEClarifierBlock'
        shape :petank_block                                                , "#{s}pid.vessels.tank_(conical_roof);verticalLabelPosition=bottom;verticalAlign=top", 'PETankBlock'
        shape :petray_column_block                                         , "#{s}pid2misc.column;columnType=tray;verticalLabelPosition=bottom;verticalAlign=top", 'PETrayColumnBlock'
        shape :pereaction_vessel_block                                     , "#{s}pid.vessels.reactor;verticalLabelPosition=bottom;verticalAlign=top", 'PEReactionVesselBlock'
        shape :pebin                                                       , "#{s}pid.vessels.tank_(conical_bottom)", 'PEBin'
        shape :pedome_roof_tank                                            , "#{s}pid.vessels.tank_(dished_roof)", 'PEDomeRoofTank'
        shape :pecone_roof_tank                                            , "#{s}pid.vessels.tank_(conical_roof)", 'PEConeRoofTank'
      end
      section :heat_exchangers do
        shape :peboiler_block                                              , "#{s}pid.misc.boiler_(dome);verticalLabelPosition=bottom;verticalAlign=top", 'PEBoilerBlock'
        shape :peequipment_boiler_block                                    , "#{s}pid.misc.boiler_(dome);verticalLabelPosition=bottom;verticalAlign=top", 'PEEquipmentBoilerBlock'
        shape :pereboiler_block                                            , "#{s}pid.heat_exchangers.reboiler;verticalLabelPosition=bottom;verticalAlign=top", 'PEReboilerBlock'
        shape :pecondenser_block                                           , "#{s}pid.heat_exchangers.heat_exchanger_(straight_tubes);verticalLabelPosition=bottom;verticalAlign=top",
              'PECondenserBlock'
        shape :peequipment_condenser_block                                 , "#{s}pid.heat_exchangers.condenser;verticalLabelPosition=bottom;verticalAlign=top", 'PEEquipmentCondenserBlock'
        shape :pecooling_tower_block                                       , "#{s}pid.misc.cooling_tower;verticalLabelPosition=bottom;verticalAlign=top", 'PECoolingTowerBlock'
        shape :peheat_exchanger_block                                      , "#{s}pid.heat_exchangers.shell_and_tube_heat_exchanger_1;verticalLabelPosition=bottom;verticalAlign=top",
              'PEHeatExchangerBlock'
        shape :pehairpin_exchanger_block                                   , "#{s}pid.heat_exchangers.hairpin_exchanger;verticalLabelPosition=bottom;verticalAlign=top", 'PEHairpinExchangerBlock'
        shape :peplate_and_frame_heat_exchanger_block                      , "#{s}pid.heat_exchangers.plate_and_frame_heat_exchanger;verticalLabelPosition=bottom;verticalAlign=top",
              'PEPlateAndFrameHeatExchangerBlock'
        shape :pespiral_heat_exchanger                                     , "#{s}pid.heat_exchangers.spiral_heat_exchanger;verticalLabelPosition=bottom;verticalAlign=top", 'PESpiralHeatExchanger'
        shape :peutube_heat_exchanger_block                                , "#{s}pid.heat_exchangers.u-tube_heat_exchanger;verticalLabelPosition=bottom;verticalAlign=top", 'PEUTubeHeatExchangerBlock'
        shape :pedouble_pipe_heat_block                                    , "#{s}pid.heat_exchangers.double_pipe_heat_exchanger;verticalLabelPosition=bottom;verticalAlign=top",
              'PEDoublePipeHeatBlock'
        shape :peshell_and_tube_heat1block                                 , "#{s}pid.heat_exchangers.shell_and_tube_heat_exchanger_1;verticalLabelPosition=bottom;verticalAlign=top",
              'PEShellAndTubeHeat1Block'
        shape :peshell_and_tube_heat2block                                 , "#{s}pid.heat_exchangers.shell_and_tube_heat_exchanger_2;verticalLabelPosition=bottom;verticalAlign=top",
              'PEShellAndTubeHeat2Block'
        shape :peshell_and_tube_heat3block                                 , "#{s}pid.heat_exchangers.shell_and_tube_heat_exchanger_1;direction=north;verticalLabelPosition=bottom;verticalAlign=top",
              'PEShellAndTubeHeat3Block'
        shape :pesingle_pass_heat_block                                    , "#{s}pid.heat_exchangers.single_pass_heat_exchanger;verticalLabelPosition=bottom;verticalAlign=top",
              'PESinglePassHeatBlock'
        shape :peheater_block                                              , "#{s}pid.heat_exchangers.heater;verticalLabelPosition=bottom;verticalAlign=top", 'PEHeaterBlock'
      end
      section :pumps do
        shape :peejector_injector_block                                    , "#{s}pid.fittings.injector;verticalLabelPosition=bottom;verticalAlign=top", 'PEEjectorInjectorBlock'
        shape :pecompressor_turbine_block                                  , cs.to_s, 'PECompressorTurbineBlock'
        shape :pemotor_driven_turbine_block                                , cs.to_s, 'PEMotorDrivenTurbineBlock'
        shape :pecentrifugal_pump_block                                    , "#{s}pid.pumps.gas_blower;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'PECentrifugalPumpBlock'
        shape :pecentrifugal_pump                                          , "#{s}pid.pumps.centrifugal_pump_1;verticalLabelPosition=bottom;verticalAlign=top", 'PECentrifugalPump'
        shape :pecentrifugal_pump2                                         , "#{s}pid.pumps.centrifugal_pump_2;verticalLabelPosition=bottom;verticalAlign=top", 'PECentrifugalPump2'
        shape :pecentrifugal_pump3                                         , "#{s}pid.pumps.centrifugal_pump_1;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'PECentrifugalPump3'
        shape :pegear_pump_block                                           , "#{s}pid.pumps.gear_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PEGearPumpBlock'
        shape :pehorizontal_pump                                           , "#{s}pid.pumps.horizontal_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PEHorizontalPump'
        shape :peprogressive_cavity_pump                                   , "#{s}pid.pumps.cavity_pump;flipH=1;flipV=1;verticalLabelPosition=bottom;verticalAlign=top", 'PEProgressiveCavityPump'
        shape :pescrew_pump                                                , "#{s}pid.pumps.screw_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PEScrewPump'
        shape :pescrew_pump2                                               , "#{s}pid.pumps.screw_pump_2;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'PEScrewPump2'
        shape :pesump_pump                                                 , "#{s}pid.pumps.sump_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PESumpPump'
        shape :pevacuum_pump                                               , "#{s}pid.pumps.vacuum_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PEVacuumPump'
        shape :pevertical_pump                                             , "#{s}pid.pumps.vertical_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PEVerticalPump'
        shape :pevertical_pump2                                            , "#{s}pid.pumps.vertical_pump;verticalLabelPosition=bottom;verticalAlign=top", 'PEVerticalPump2'
      end
      section :instruments do
        shape :peindicator_block                                           , cs.to_s, 'PEIndicatorBlock'
        shape :peindicator2block                                           , cs.to_s, 'PEIndicator2Block'
        shape :peindicator3block                                           , "#{s}pid2inst.discInst;mounting=field", 'PEIndicator3Block'
        shape :peindicator4block                                           , "#{s}pid2inst.indicator;mounting=field;indType=inst", 'PEIndicator4Block'
        shape :peshared_indicator_block                                    , cs.to_s, 'PESharedIndicatorBlock'
        shape :peshared_indicator2block                                    , cs.to_s, 'PESharedIndicator2Block'
        shape :pecomputer_indicator_block                                  , cs.to_s, 'PEComputerIndicatorBlock'
        shape :peprogrammable_indicator_block                              , cs.to_s, 'PEProgrammableIndicatorBlock'
      end
      section :valves do
        shape :pegate_valve_block                                          , cs.to_s, 'PEGateValveBlock'
        shape :peglobe_valve_block                                         , cs.to_s, 'PEGlobeValveBlock'
        shape :pecontrol_valve_block                                       , "#{s}pid2valves.valve;valveType=gate;actuator=diaph;verticalLabelPosition=bottom;verticalAlign=top", 'PEControlValveBlock'
        shape :peneedle_valve_block                                        , "#{s}pid2valves.valve;valveType=needle;verticalLabelPosition=bottom;verticalAlign=top", 'PENeedleValveBlock'
        shape :pebutterfly_valve2block                                     , "#{s}pid2valves.valve;flipH=1;valveType=butterfly;verticalLabelPosition=bottom;verticalAlign=top", 'PEButterflyValve2Block'
        shape :peball_valve_block                                          , "#{s}pid2valves.valve;valveType=ball;verticalLabelPosition=bottom;verticalAlign=top", 'PEBallValveBlock'
        shape :pediaphragm_block                                           , "#{s}pid2valves.valve;valveType=ball;verticalLabelPosition=bottom;verticalAlign=top", 'PEDiaphragmBlock'
        shape :peplug_valve_block                                          , "#{s}pid2valves.valve;valveType=ball;verticalLabelPosition=bottom;verticalAlign=top", 'PEPlugValveBlock'
        shape :pecheck_valve_block                                         , "#{s}pid2valves.valve;valveType=check;verticalLabelPosition=bottom;verticalAlign=top", 'PECheckValveBlock'
        shape :pecheck_valve2block                                         , "#{s}pid2valves.valve;valveType=check;verticalLabelPosition=bottom;verticalAlign=top", 'PECheckValve2Block'
        shape :peangle_valve_block                                         , cs.to_s, 'PEAngleValveBlock'
        shape :peangle_globe_valve_block                                   , cs.to_s, 'PEAngleGlobeValveBlock'
        shape :pepowered_valve_block                                       , cs.to_s, 'PEPoweredValveBlock'
        shape :pefloat_operated_valve_block                                , "#{s}pid2valves.valve;valveType=gate;actuator=singActing;verticalLabelPosition=bottom;verticalAlign=top",
              'PEFloatOperatedValveBlock'
        shape :peneedle_valve2block                                        , "#{s}pid2valves.valve;valveType=needle;verticalLabelPosition=bottom;verticalAlign=top", 'PENeedleValve2Block'
        shape :pethree_way_valve_block                                     , "#{s}pid2valves.valve;valveType=threeWay;actuator=none;verticalLabelPosition=bottom;verticalAlign=top",
              'PEThreeWayValveBlock'
        shape :pebleeder_valve_block                                       , "#{s}pid2valves.blockBleedValve;actuator=none;verticalLabelPosition=bottom;verticalAlign=top", 'PEBleederValveBlock'
        shape :perotameter_block                                           , "#{s}pid.flow_sensors.rotameter;flipH=1;verticalLabelPosition=bottom;verticalAlign=top", 'PERotameterBlock'
      end
      section :venn_gradient do
        shape :venn_gradient_color1                                        , 'ellipse;fillOpacity=35', 'VennGradientColor1'
        shape :venn_gradient_color2                                        , 'ellipse;fillOpacity=35', 'VennGradientColor2'
        shape :venn_gradient_color3                                        , 'ellipse;fillOpacity=35', 'VennGradientColor3'
        shape :venn_gradient_color4                                        , 'ellipse;fillOpacity=35', 'VennGradientColor4'
        shape :venn_gradient_color5                                        , 'ellipse;fillOpacity=35', 'VennGradientColor5'
        shape :venn_gradient_color6                                        , 'ellipse;fillOpacity=35', 'VennGradientColor6'
        shape :venn_gradient_color7                                        , 'ellipse;fillOpacity=35', 'VennGradientColor7'
        shape :venn_gradient_color8                                        , 'ellipse;fillOpacity=35', 'VennGradientColor8'
      end
      section :venn_plain do
        shape :venn_plain_color1                                           , 'ellipse;fillOpacity=35', 'VennPlainColor1'
        shape :venn_plain_color2                                           , 'ellipse;fillOpacity=35', 'VennPlainColor2'
        shape :venn_plain_color3                                           , 'ellipse;fillOpacity=35', 'VennPlainColor3'
        shape :venn_plain_color4                                           , 'ellipse;fillOpacity=35', 'VennPlainColor4'
        shape :venn_plain_color5                                           , 'ellipse;fillOpacity=35', 'VennPlainColor5'
        shape :venn_plain_color6                                           , 'ellipse;fillOpacity=35', 'VennPlainColor6'
        shape :venn_plain_color7                                           , 'ellipse;fillOpacity=35', 'VennPlainColor7'
        shape :venn_plain_color8                                           , 'ellipse;fillOpacity=35', 'VennPlainColor8'
      end
      section :i_os_devices do
        shape :i_os7devicei_phone5portrait                                 , "#{s}ios.iPhone;bgStyle=bgGreen", 'iOS7DeviceiPhone5Portrait'
        shape :i_os7devicei_phone5landscape                                , "#{s}ios.iPhone;bgStyle=bgGreen", 'iOS7DeviceiPhone5Landscape'
        shape :i_os7devicei_pad_portrait                                   , "#{s}ios.iPad;bgStyle=bgGreen", 'iOS7DeviceiPadPortrait'
        shape :i_os7devicei_pad_landscape                                  , "#{s}ios.iPad;bgStyle=bgGreen", 'iOS7DeviceiPadLandscape'
        shape :i_os7devicei_phone6portrait                                 , "#{s}ios.iPhone;bgStyle=bgGreen", 'iOS7DeviceiPhone6Portrait'
        shape :i_os7devicei_phone6landscape                                , "#{s}ios.iPhone;bgStyle=bgGreen", 'iOS7DeviceiPhone6Landscape'
        shape :i_os7devicei_phone6plus_portrait                            , "#{s}ios.iPhone;bgStyle=bgGreen", 'iOS7DeviceiPhone6PlusPortrait'
        shape :i_os7devicei_phone6plus_landscape                           , "#{s}ios.iPhone;bgStyle=bgGreen", 'iOS7DeviceiPhone6PlusLandscape'
      end
      section :i_phone_elements do
        shape :i_os7status_bari_phone                                      , "#{s}ios7ui.appBar", 'iOS7StatusBariPhone'
        shape :i_os7i_phone_keyboard                                       , "#{s}ios7.misc.keyboard_(letters)", 'iOS7iPhoneKeyboard'
      end
      section :i_pad_elements do
        shape :i_os7status_bari_pad                                        , "#{s}ios7ui.appBar", 'iOS7StatusBariPad'
        shape :i_os7i_pad_keyboard                                         , "#{s}ios7.misc.keyboard_(letters)", 'iOS7iPadKeyboard'
      end
      section :common_elements do
        shape :i_os7progress_bar                                           , "#{s}ios7ui.downloadBar", 'iOS7ProgressBar'
        shape :i_os7slider                                                 , "#{s}ios7ui.searchBox", 'iOS7Slider'
        shape :i_os7search_bar                                             , "#{s}ios7ui.searchBox", 'iOS7SearchBar'
        shape :i_os7button                                                 , '', 'iOS7Button'
        shape :i_os7text_field                                             , '', 'iOS7TextField'
        shape :i_os7text_view                                              , '', 'iOS7TextView'
        shape :i_os7toggle                                                 , "#{s}ios7ui.onOffButton;buttonState=on;strokeColor=#38D145;strokeColor2=#aaaaaa;fillColor=#38D145;fillColor2=#ffffff",
              'iOS7Toggle'
        shape :i_os7stepper                                                , "#{s}ios7.misc.adjust;fillColor=#ffffff;gradientColor=none", 'iOS7Stepper'
        shape :i_os7page_controls                                          , "#{s}ios7ui.pageControl;fillColor=#666666;strokeColor=#bbbbbb", 'iOS7PageControls'
        shape :i_os7block                                                  , '', 'iOS7Block'
      end
      section :i_os_icons do
        shape :i_os7icon_arrow_left                                        , "#{s}ios7.misc.left", 'iOS7IconArrow left'
        shape :i_os7icon_arrow                                             , "#{s}ios7.misc.right", 'iOS7IconArrow'
        shape :i_os7icon_arrow_up                                          , "#{s}ios7.misc.up", 'iOS7IconArrow up'
        shape :i_os7icon_arrow_down                                        , "#{s}ios7.misc.down", 'iOS7IconArrow down'
        shape :i_os7icon_wifi                                              , "#{s}ios7.icons.wifi", 'iOS7IconWifi'
        shape :i_os7icon_bluetooth                                         , "#{s}ios7.icons.bluetooth", 'iOS7IconBluetooth'
        shape :i_os7icon_battery                                           , "#{s}ios7.icons.battery", 'iOS7IconBattery'
        shape :i_os7icon_siri                                              , "#{s}ios7.icons.microphone", 'iOS7IconSiri'
        shape :i_os7icon_check                                             , "#{s}ios7.icons.select", 'iOS7IconCheck'
        shape :i_os7icon_create                                            , "#{s}ios7.icons.add", 'iOS7IconCreate'
        shape :i_os7icon_info                                              , "#{s}ios7.icons.info", 'iOS7IconInfo'
        shape :i_os7icon_location                                          , "#{s}ios7.icons.location_2", 'iOS7IconLocation'
        shape :i_os7icon_question                                          , "#{s}ios7.icons.help", 'iOS7IconQuestion'
        shape :i_os7icon_search                                            , "#{s}ios7.icons.looking_glass", 'iOS7IconSearch'
        shape :i_os7icon_toolbox                                           , "#{s}ios7.icons.briefcase", 'iOS7IconToolbox'
        shape :i_os7icon_options                                           , "#{s}ios7.icons.options", 'iOS7IconOptions'
        shape :i_os7icon_share                                             , "#{s}ios7.icons.share", 'iOS7IconShare'
        shape :i_os7icon_typing                                            , "#{s}ios7.icons.message", 'iOS7IconTyping'
        shape :i_os7icon_copy                                              , "#{s}ios7.icons.folders_2", 'iOS7IconCopy'
        shape :i_os7icon_chat                                              , "#{s}ios7.icons.messages", 'iOS7IconChat'
        shape :i_os7icon_organize                                          , "#{s}ios7.icons.folder", 'iOS7IconOrganize'
        shape :i_os7icon_trash                                             , "#{s}ios7.icons.trashcan", 'iOS7IconTrash'
        shape :i_os7icon_reply                                             , "#{s}ios7.icons.back", 'iOS7IconReply'
        shape :i_os7icon_archive                                           , "#{s}ios7.icons.box", 'iOS7IconArchive'
        shape :i_os7icon_compose                                           , "#{s}ios7.icons.compose", 'iOS7IconCompose'
        shape :i_os7icon_send                                              , "#{s}ios7.icons.pointer", 'iOS7IconSend'
        shape :i_os7icon_drawer                                            , "#{s}ios7.icons.storage", 'iOS7IconDrawer'
        shape :i_os7icon_mail                                              , "#{s}ios7.icons.mail", 'iOS7IconMail'
        shape :i_os7icon_document                                          , "#{s}ios7.icons.document", 'iOS7IconDocument'
        shape :i_os7icon_flag                                              , "#{s}ios7.icons.flag", 'iOS7IconFlag'
        shape :i_os7icon_bookmarks                                         , "#{s}ios7.icons.book", 'iOS7IconBookmarks'
        shape :i_os7icon_glasses                                           , "#{s}ios7.icons.glasses", 'iOS7IconGlasses'
        shape :i_os7icon_files                                             , "#{s}ios7.icons.folders", 'iOS7IconFiles'
        shape :i_os7icon_downloads                                         , "#{s}ios7.icons.down", 'iOS7IconDownloads'
        shape :i_os7icon_lock                                              , "#{s}ios7.icons.locked", 'iOS7IconLock'
        shape :i_os7icon_cloud                                             , "#{s}ios7.icons.cloud", 'iOS7IconCloud'
        shape :i_os7icon_orientation_lock                                  , "#{s}ios7.icons.orientation_lock", 'iOS7IconOrientation Lock'
        shape :i_os7icon_contacts                                          , "#{s}ios7.icons.user", 'iOS7IconContacts'
        shape :i_os7icon_global                                            , "#{s}ios7.icons.globe", 'iOS7IconGlobal'
        shape :i_os7icon_settings                                          , "#{s}ios7.icons.settings", 'iOS7IconSettings'
        shape :i_os7icon_airplay                                           , "#{s}ios7.icons.move_to_folder", 'iOS7IconAirplay'
        shape :i_os7icon_camera                                            , "#{s}ios7.icons.camera", 'iOS7IconCamera'
        shape :i_os7icon_airplane                                          , "#{s}signs.transportation.airplane_6;direction=south", 'iOS7IconAirplane'
        shape :i_os7icon_calculator                                        , "#{s}ios7.icons.calculator", 'iOS7IconCalculator'
        shape :i_os7icon_preferences                                       , "#{s}ios7.icons.most_viewed", 'iOS7IconPreferences'
        shape :i_os7icon_phone                                             , "#{s}signs.tech.telephone_3", 'iOS7IconPhone'
        shape :i_os7icon_keypad                                            , "#{s}ios7.icons.keypad", 'iOS7IconKeypad'
        shape :i_os7icon_voicemail                                         , "#{s}ios7.icons.tape", 'iOS7IconVoicemail'
        shape :i_os7icon_star                                              , "#{s}ios7.icons.star", 'iOS7IconStar'
        shape :i_os7icon_most_viewed                                       , "#{s}ios7.icons.most_viewed", 'iOS7IconMost Viewed'
        shape :i_os7icon_video                                             , "#{s}ios7.icons.video_conversation", 'iOS7IconVideo'
        shape :i_os7icon_volumne_controls                                  , "#{s}ios7.icons.volume", 'iOS7IconVolumne Controls'
        shape :i_os7icon_location_pin                                      , "#{s}ios7.icons.location", 'iOS7IconLocation pin'
        shape :i_os7icon_calendar                                          , "#{s}ios7.icons.calendar", 'iOS7IconCalendar'
        shape :i_os7icon_alarm                                             , "#{s}ios7.icons.alarm_clock", 'iOS7IconAlarm'
        shape :i_os7icon_clock                                             , "#{s}ios7.icons.clock", 'iOS7IconClock'
        shape :i_os7icon_timer                                             , "#{s}ios7.icons.gauge", 'iOS7IconTimer'
        shape :i_os7icon_volume_down                                       , "#{s}ios7.icons.silent", 'iOS7IconVolume down'
        shape :i_os7icon_volume                                            , "#{s}ios7.icons.volume_2", 'iOS7IconVolume'
        shape :i_os7icon_volume_up                                         , "#{s}ios7.icons.loud", 'iOS7IconVolume up'
        shape :i_os7icon_repeat                                            , "#{s}ios7.icons.reload", 'iOS7IconRepeat'
        shape :i_os7icon_rewind                                            , "#{s}ios7.icons.backward", 'iOS7IconRewind'
        shape :i_os7icon_play                                              , "#{s}ios7.icons.play", 'iOS7IconPlay'
        shape :i_os7icon_pause                                             , "#{s}ios7.icons.pause", 'iOS7IconPause'
        shape :i_os7icon_fast_forward                                      , "#{s}ios7.icons.forward", 'iOS7IconFast forward'
        shape :i_os7icon_controls                                          , "#{s}ios7.icons.controls", 'iOS7IconControls'
        shape :i_os7icon_privacy                                           , "#{s}ios7.icons.privacy", 'iOS7IconPrivacy'
        shape :i_os7icon_link                                              , "#{s}ios7.icons.link", 'iOS7IconLink'
        shape :i_os7icon_light                                             , "#{s}ios7.icons.flashlight", 'iOS7IconLight'
        shape :i_os7icon_brightness                                        , "#{s}ios7.icons.sun", 'iOS7IconBrightness'
        shape :i_os7icon_heart                                             , "#{s}ios7.icons.heart", 'iOS7IconHeart'
        shape :i_os7icon_java                                              , "#{s}ios7.icons.cup", 'iOS7IconJava'
        shape :i_os7icon_box                                               , "#{s}ios7.icons.bag", 'iOS7IconBox'
        shape :i_os7icon_eye                                               , "#{s}ios7.icons.eye", 'iOS7IconEye'
        shape :i_os7icon_do_not_disturb                                    , "#{s}ios7.icons.moon", 'iOS7IconDo not disturb'
      end
      section :ui_containers do
        shape :ui2browser_block                                            , cs.to_s, 'UI2BrowserBlock'
        shape :ui2window_block                                             , cs.to_s, 'UI2WindowBlock'
        shape :ui2dialog_block                                             , cs.to_s, 'UI2DialogBlock'
        shape :ui2area_block                                               , 'rounded=1;arcSize=3', 'UI2AreaBlock'
        shape :uiarea_block                                                , 'rounded=1;arcSize=3;fillColor=none', 'UIAreaBlock'
        shape :ui2element_block                                            , '', 'UI2ElementBlock'
        shape :ui2accordion_block                                          , cs.to_s, 'UI2AccordionBlock'
        shape :ui2tab_bar_container_block                                  , cs.to_s, 'UI2TabBarContainerBlock'
        shape :ui2tab_bar2container_block                                  , cs.to_s, 'UI2TabBar2ContainerBlock'
        shape :ui2vtab_bar_container_block                                 , cs.to_s, 'UI2VTabBarContainerBlock'
        shape :ui2vscroll_block                                            , "#{s}mockup.navigation.scrollBar;direction=north", 'UI2VScrollBlock'
        shape :ui2hscroll_block                                            , "#{s}mockup.navigation.scrollBar", 'UI2HScrollBlock'
        shape :ui2vertical_splitter_block                                  , "#{s}mockup.forms.splitter;direction=north", 'UI2VerticalSplitterBlock'
        shape :ui2horizontal_splitter_block                                , "#{s}mockup.forms.splitter", 'UI2HorizontalSplitterBlock'
      end
      section :ui_widgets do
        shape :ui2image_block                                              , "#{s}mockup.graphics.simpleIcon", 'UI2ImageBlock'
        shape :ui2video_block                                              , "#{s}mockup.containers.videoPlayer;barHeight=30", 'UI2VideoBlock'
        shape :ui2audio_block                                              , "#{s}mockup.misc.playbackControls", 'UI2AudioBlock'
        shape :ui2map_block                                                , "#{s}mockup.misc.map", 'UI2MapBlock'
        shape :ui2bar_chart_block                                          , "#{s}mockup.graphics.barChart;strokeColor=none;strokeColor2=none", 'UI2BarChartBlock'
        shape :ui2column_chart_block                                       , "#{s}mockup.graphics.columnChart;strokeColor=none;strokeColor2=none", 'UI2ColumnChartBlock'
        shape :ui2line_chart_block                                         , "#{s}mockup.graphics.lineChart;strokeColor=none", 'UI2LineChartBlock'
        shape :ui2pie_chart_block                                          , "#{s}mockup.graphics.pieChart;parts=10,20,35", 'UI2PieChartBlock'
        shape :ui2webcam_block                                             , "#{s}mockup.containers.userMale", 'UI2WebcamBlock'
        shape :ui2captcha_block                                            , "#{s}mockup.text.captcha;mainText=", 'UI2CaptchaBlock'
      end
      section :ui_input do
        shape :ui2button_block                                             , 'rounded=1;arcSize=25;', 'UI2ButtonBlock'
        shape :ui2check_box_block                                          , cs.to_s, 'UI2CheckBoxBlock'
        shape :ui2horizontal_check_box_block                               , cs.to_s, 'UI2HorizontalCheckBoxBlock'
        shape :ui2radio_block                                              , cs.to_s, 'UI2RadioBlock'
        shape :ui2horizontal_radio_block                                   , cs.to_s, 'UI2HorizontalRadioBlock'
        shape :ui2color_picker_block                                       , "#{s}mockup.forms.colorPicker;chosenColor=#aaddff", 'UI2ColorPickerBlock'
        shape :ui2text_input_block                                         , '', 'UI2TextInputBlock'
        shape :ui2select_block                                             , cs.to_s, 'UI2SelectBlock'
        shape :ui2vslider_block                                            , cs.to_s, 'UI2VSliderBlock'
        shape :ui2hslider_block                                            , cs.to_s, 'UI2HSliderBlock'
        shape :ui2date_picker_block                                        , cs.to_s, 'UI2DatePickerBlock'
        shape :ui2search_block                                             , cs.to_s, 'UI2SearchBlock'
        shape :ui2numeric_stepper_block                                    , cs.to_s, 'UI2NumericStepperBlock'
        shape :ui2table_block                                              , cs.to_s, 'UI2TableBlock'
      end
      section :ui_menus do
        shape :ui2button_bar_block                                         , cs.to_s, 'UI2ButtonBarBlock'
        shape :ui2vertical_button_bar_block                                , cs.to_s, 'UI2VerticalButtonBarBlock'
        shape :ui2link_bar_block                                           , cs.to_s, 'UI2LinkBarBlock'
        shape :ui2bread_crumbs_block                                       , cs.to_s, 'UI2BreadCrumbsBlock'
        shape :ui2menu_bar_block                                           , cs.to_s, 'UI2MenuBarBlock'
        shape :ui2ato_zblock                                               , cs.to_s, 'UI2AtoZBlock'
        shape :ui2pagination_block                                         , cs.to_s, 'UI2PaginationBlock'
        shape :ui2context_menu_block                                       , cs.to_s, 'UI2ContextMenuBlock'
        shape :ui2playback_controls_block                                  ,
              "#{s}mockup.misc.playbackControls;fillColor=#ffffff;strokeColor=#999999;fillColor2=#99ddff;strokeColor2=none;fillColor3=#ffffff;strokeColor3=none", 'UI2PlaybackControlsBlock'
        shape :image_ui_formatting_toolbar                                 , "#{s}mockup.menus_and_buttons.font_style_selector_2", 'Image_ui_formatting_toolbar'
      end
      section :ui_misc do
        shape :ui2progress_bar_block                                       , cs.to_s, 'UI2ProgressBarBlock'
        shape :ui2help_icon_block                                          , "#{s}mockup.misc.help_icon", 'UI2HelpIconBlock'
        shape :ui2brace_note_block                                         , cs.to_s, 'UI2BraceNoteBlock'
        shape :ui2tooltip_block                                            , "#{s}basic.rectangular_callout;flipV=1", 'UI2TooltipBlock'
        shape :ui2tooltip_square_block                                     , cs.to_s, 'UI2TooltipSquareBlock'
        shape :ui2callout_block                                            , cs.to_s, 'UI2CalloutBlock'
        shape :ui2alert_block                                              , cs.to_s, 'UI2AlertBlock'
      end
      section :i_os_6_i_pad_elements do
        shape :image_ipad_ipad                                             , "#{s}ios.iPad;bgStyle=bgGreen", 'Image_ipad_ipad'
        shape :i_pad_gray_background_block                                 , '', 'iPadGrayBackgroundBlock'
        shape :image_ipad_top_bar                                          , "#{s}ios.iTopBar2;opacity=50;fillColor=#999999;strokeColor=#cccccc", 'Image_ipad_top_bar'
        shape :image_ipad_search                                           , "#{s}mockup.forms.searchBox;mainText=;flipH=1", 'Image_ipad_search'
        shape :image_ipad_popover                                          , "#{s}ios.iOption;barPos=50;pointerPos=top;buttonText=", 'Image_ipad_popover'
      end
      section :i_os_6_i_pad_controls do
        shape :image_ipad_button_black                                     , '', 'Image_ipad_button_black'
        shape :image_ipad_button_blue                                      , '', 'Image_ipad_button_blue'
        shape :image_ipad_button_grayblue                                  , '', 'Image_ipad_button_grayblue'
        shape :image_ipad_button_red                                       , '', 'Image_ipad_button_red'
        shape :image_ipad_back_button_gray                                 , "#{s}ios.iButtonBack;buttonText=;fillColor=#eeeeee;fillColor2=#aaaaaa", 'Image_ipad_back_button_gray'
        shape :image_ipad_back_button_black                                , "#{s}ios.iButtonBack;buttonText=;fillColor=#888888;fillColor2=#000000", 'Image_ipad_back_button_black'
        shape :image_ipad_sort_handle                                      , "#{s}ios7.icons.options", 'Image_ipad_sort_handle'
        shape :image_ipad_dropdown                                         , "#{s}ios.iComboBox;buttonText=;fillColor=#dddddd;fillColor2=#3D5565", 'Image_ipad_dropdown'
        shape :image_ipad_email_name                                       , '', 'Image_ipad_email_name'
        shape :image_ipad_prev_next                                        , "#{s}ios.iPrevNext;strokeColor=#444444;fillColor=#dddddd;fillColor2=#3D5565;fillColor3=#ffffff", 'Image_ipad_prev_next'
        shape :image_ipad_keyboard_portrait                                , "#{s}ios.iKeybLett", 'Image_ipad_keyboard_portrait'
        shape :image_ipad_keyboard_landscape                               , "#{s}ios.iKeybLett", 'Image_ipad_keyboard_landscape'
        shape :image_ipad_slider                                           , "#{s}ios.iSlider;barPos=20", 'Image_ipad_slider'
      end
      section :i_os_6_i_pad_icons do
        shape :image_ipad_add_icon_blue                                    , "#{s}ios.iAddIcon;fillColor=#8BbEff;fillColor2=#135Ec8;strokeColor=#ffffff", 'Image_ipad_add_icon_blue'
        shape :image_ipad_add_icon_green                                   , "#{s}ios.iAddIcon;fillColor=#7AdF78;fillColor2=#1A9917;strokeColor=#ffffff", 'Image_ipad_add_icon_green'
        shape :image_ipad_remove_icon                                      , "#{s}ios.iDeleteIcon;fillColor=#e8878E;fillColor2=#BD1421;strokeColor=#ffffff", 'Image_ipad_remove_icon'
        shape :image_ipad_arrow_icon                                       , "#{s}ios.iArrowIcon;fillColor=#8BbEff;fillColor2=#135Ec8;strokeColor=#ffffff", 'Image_ipad_arrow_icon'
        shape :image_ipad_arrow                                            , "#{s}ios7.misc.more", 'Image_ipad_arrow'
        shape :image_ipad_checkmark                                        , "#{s}ios7.misc.check", 'Image_ipad_checkmark'
        shape :image_ipad_check_off                                        , 'ellipse', 'Image_ipad_check_off'
        shape :image_ipad_location_dot                                     , 'ellipse', 'Image_ipad_location_dot'
        shape :image_ipad_mark_as_read                                     , 'ellipse', 'Image_ipad_mark_as_read'
        shape :image_ipad_pin_green                                        , "#{s}ios.iPin;fillColor2=#00dd00;fillColor3=#004400;strokeColor=#006600", 'Image_ipad_pin_green'
        shape :image_ipad_pin_red                                          , "#{s}ios.iPin;fillColor2=#dd0000;fillColor3=#440000;strokeColor=#660000", 'Image_ipad_pin_red'
        shape :image_ipad_radio_off                                        , 'ellipse', 'Image_ipad_radio_off'
        shape :image_ipad_checkbox_off                                     , "absoluteArcSize=1;arcSize=#{arcSize};rounded=1", 'Image_ipad_checkbox_off'
        shape :image_ipad_indicator                                        , "absoluteArcSize=1;arcSize=#{arcSize};rounded=1;fillColor=#e8878E;gradientColor=#BD1421;strokeColor=#ffffff",
              'Image_ipad_indicator'
      end
      section :i_os_6_i_phone_elements do
        shape :image_iphone_iphone_4                                       , "#{s}ios.iPhone;bg=bgGreen", 'Image_iphone_iphone_4'
        shape :image_iphone_bg_black                                       , '', 'Image_iphone_bg_black'
        shape :image_iphone_bg_gray                                        , '', 'Image_iphone_bg_gray'
        shape :image_iphone_bg_stripe_drk                                  , "#{s}ios.iBgStriped;strokeColor=#18211b;fillColor=#5D7585;strokeColor2=#657E8F", 'Image_iphone_bg_stripe_drk'
        shape :image_iphone_bg_stripe_lt                                   , "#{s}ios.iBgStriped;strokeColor=#18211b;fillColor=#5D7585;strokeColor2=#657E8F", 'Image_iphone_bg_stripe_lt'
        shape :image_iphone_bg_white                                       , '', 'Image_iphone_bg_white'
        shape :image_iphone_top_bar_app                                    , "#{s}ios.iAppBar", 'Image_iphone_top_bar_app'
        shape :image_iphone_top_bar_home                                   , "#{s}ios.iTopBar2;opacity=50;fillColor=#999999;strokeColor=#cccccc;strokeWidth=1", 'Image_iphone_top_bar_home'
        shape :image_iphone_bar_top                                        , '', 'Image_iphone_bar_top'
        shape :image_iphone_bar_semi_trans_black                           , '', 'Image_iphone_bar_semi_trans_black'
        shape :image_iphone_bar_semi_trans_blue                            , '', 'Image_iphone_bar_semi_trans_blue'
        shape :image_iphone_search                                         , "#{s}mockup.forms.searchBox;mainText=;flipH=1", 'Image_iphone_search'
        shape :image_iphone_alpha_list                                     , "#{s}ios.iAlphaList", 'Image_iphone_alpha_list'
      end
      section :i_os_6_i_phone_controls do
        shape :image_iphone_button_black                                   , '', 'Image_iphone_button_black'
        shape :image_iphone_button_blue                                    , '', 'Image_iphone_button_blue'
        shape :image_iphone_button_grayblue                                , '', 'Image_iphone_button_grayblue'
        shape :image_iphone_button_red                                     , '', 'Image_iphone_button_red'
        shape :image_iphone_button_lg_light                                , '', 'Image_iphone_button_lg_light'
        shape :image_iphone_button_lg_dark                                 , '', 'Image_iphone_button_lg_dark'
        shape :image_iphone_button_lg_green                                , '', 'Image_iphone_button_lg_green'
        shape :image_iphone_button_lg_red                                  , '', 'Image_iphone_button_lg_red'
        shape :image_iphone_button_lg_yellow                               , '', 'Image_iphone_button_lg_yellow'
        shape :image_iphone_button_xl_green                                , '', 'Image_iphone_button_xl_green'
        shape :image_iphone_back_button                                    , "#{s}ios.iButtonBack;strokeColor=#444444;buttonText=;fillColor=#dddddd;fillColor2=#3D5565", 'Image_iphone_back_button'
        shape :image_iphone_prev_next                                      , "#{s}ios.iPrevNext;strokeColor=#444444;fillColor=#dddddd;fillColor2=#3D5565;fillColor3=#ffffff", 'Image_iphone_prev_next'
        shape :image_iphone_sort_handle                                    , "#{s}ios7.icons.options", 'Image_iphone_sort_handle'
        shape :image_iphone_slider                                         , "#{s}ios.iSlider;barPos=60", 'Image_iphone_slider'
        shape :image_iphone_dropdown                                       , "#{s}ios.iComboBox;buttonText=;fillColor=#dddddd;fillColor2=#3D5565", 'Image_iphone_dropdown'
        shape :image_iphone_email_name                                     , '', 'Image_iphone_email_name'
        shape :image_iphone_switch_off                                     , "#{s}android.switch_off;fillColor=#666666", 'Image_iphone_switch_off'
        shape :image_iphone_keyboard_button_blue                           , '', 'Image_iphone_keyboard_button_blue'
        shape :image_iphone_keyboard_letters                               , "#{s}ios.iKeybLett", 'Image_iphone_keyboard_letters'
        shape :image_iphone_keyboard_landscape                             , "#{s}ios.iKeybLett", 'Image_iphone_keyboard_landscape'
      end
      section :i_os_6_i_phone_icons do
        shape :image_iphone_add_icon_blue                                  , "#{s}ios.iAddIcon;fillColor=#8BbEff;fillColor2=#135Ec8;strokeColor=#ffffff", 'Image_iphone_add_icon_blue'
        shape :image_iphone_add_icon_green                                 , "#{s}ios.iAddIcon;fillColor=#7AdF78;fillColor2=#1A9917;strokeColor=#ffffff", 'Image_iphone_add_icon_green'
        shape :image_iphone_remove_icon                                    , "#{s}ios.iDeleteIcon;fillColor=#e8878E;fillColor2=#BD1421;strokeColor=#ffffff", 'Image_iphone_remove_icon'
        shape :image_iphone_arrow_icon                                     , "#{s}ios.iArrowIcon;fillColor=#8BbEff;fillColor2=#135Ec8;strokeColor=#ffffff", 'Image_iphone_arrow_icon'
        shape :image_iphone_arrow                                          , "#{s}ios7.misc.more", 'Image_iphone_arrow'
        shape :image_iphone_checkmark                                      , "#{s}ios7.misc.check", 'Image_iphone_checkmark'
        shape :image_iphone_check_off                                      , 'ellipse', 'Image_iphone_check_off'
        shape :image_iphone_location_dot                                   , 'ellipse', 'Image_iphone_location_dot'
        shape :image_iphone_mark_as_read                                   , 'ellipse', 'Image_iphone_mark_as_read'
        shape :image_iphone_pin_green                                      , "#{s}ios.iPin;fillColor2=#00dd00;fillColor3=#004400;strokeColor=#006600", 'Image_iphone_pin_green'
        shape :image_iphone_pin_red                                        , "#{s}ios.iPin;fillColor2=#dd0000;fillColor3=#440000;strokeColor=#660000", 'Image_iphone_pin_red'
        shape :image_iphone_radio_off                                      , 'ellipse', 'Image_iphone_radio_off'
        shape :image_iphone_indicator                                      , 'fillColor=#e8878E;gradientColor=#BD1421;strokeColor=#ffffff', 'Image_iphone_indicator'
        shape :image_iphone_thread_count                                   , '', 'Image_iphone_thread_count'
      end
      section :aws_17___analyti_cs do
        shape :amazon_athena2017                                           ,
              'shape=mxgraph.aws3.athena;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1;pointerEvents=1', 'AmazonAthena2017'
        shape :amazon_cloud_search2017                                     ,
              'shape=mxgraph.aws3.cloudsearch;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1;pointerEvents=1', 'AmazonCloudSearch2017'
        shape :amazon_cloud_searchsearchdocuments2017                      ,
              'shape=mxgraph.aws3.search_documents;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudSearchsearchdocuments2017'
        shape :amazon_emr2017                                              , 'shape=mxgraph.aws3.emr;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonEMR2017'
        shape :amazon_emrcluster2017                                       ,
              'shape=mxgraph.aws3.emr_cluster;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEMRcluster2017'
        shape :amazon_emremrengine2017                                     ,
              'shape=mxgraph.aws3.emr_engine;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEMREMRengine2017'
        shape :amazon_emremrengine_map_rm32017                             ,
              'shape=mxgraph.aws3.emr_engine_mapr_m3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEMREMRengineMapRM32017'
        shape :amazon_emremrengine_map_rm52017                             ,
              'shape=mxgraph.aws3.emr_engine_mapr_m5;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEMREMRengineMapRM52017'
        shape :amazon_emremrengine_map_rm72017                             ,
              'shape=mxgraph.aws3.emr_engine_mapr_m7;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEMREMRengineMapRM72017'
        shape :amazon_emrhdfscluster2017                                   ,
              'shape=mxgraph.aws3.hdfs_cluster;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEMRHDFScluster2017'
        shape :amazon_es2017                                               ,
              'shape=mxgraph.aws3.elasticsearch_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonES2017'
        shape :amazon_kinesis2017                                          ,
              'shape=mxgraph.aws3.kinesis;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonKinesis2017'
        shape :amazon_kinesis_amazon_kinesis_analytics2017                 ,
              'shape=mxgraph.aws3.kinesis_analytics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonKinesisAmazonKinesisAnalytics2017'
        shape :amazon_kinesis_amazon_kinesisenabledapp2017                 ,
              'shape=mxgraph.aws3.kinesis_enabled_app;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonKinesisAmazonKinesisenabledapp2017'
        shape :amazon_kinesis_amazon_kinesis_firehose2017                  ,
              'shape=mxgraph.aws3.kinesis_firehose;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonKinesisAmazonKinesisFirehose2017'
        shape :amazon_kinesis_amazon_kinesis_streams2017                   ,
              'shape=mxgraph.aws3.kinesis_streams;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonKinesisAmazonKinesisStreams2017'
        shape :amazon_quick_sight2017                                      ,
              'shape=mxgraph.aws3.quicksight;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonQuickSight2017'
        shape :amazon_redshift2017                                         ,
              'shape=mxgraph.aws3.redshift;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRedshift2017'
        shape :amazon_redshiftdensecomputenode2017                         ,
              'shape=mxgraph.aws3.dense_compute_node;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRedshiftdensecomputenode2017'
        shape :amazon_redshiftdensestoragenode2017                         ,
              'shape=mxgraph.aws3.dense_storage_node;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRedshiftdensestoragenode2017'
        shape :awsdata_pipeline2017                                        ,
              'shape=mxgraph.aws3.data_pipeline;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSDataPipeline2017'
        shape :awsglue2017                                                 ,
              'shape=mxgraph.aws3.glue;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSGlue2017'
      end
      section :aws_17___application_services do
        shape :amazon_apigateway2017                                       ,
              'shape=mxgraph.aws3.api_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonAPIGateway2017'
        shape :amazon_app_stream22017                                      ,
              'shape=mxgraph.aws3.appstream;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonAppStream22017'
        shape :amazon_elastic_transcoder2017                               ,
              'shape=mxgraph.aws3.elastic_transcoder;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonElasticTranscoder2017'
        shape :amazon_swf2017                                              , 'shape=mxgraph.aws3.swf;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonSWF2017'
        shape :amazon_swfdecider2017                                       ,
              'shape=mxgraph.aws3.decider;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSWFdecider2017'
        shape :amazon_swfworker2017                                        ,
              'shape=mxgraph.aws3.worker;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSWFworker2017'
        shape :awsstep_functions2017                                       ,
              'shape=mxgraph.aws3.step_functions;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSStepFunctions2017'
      end
      section :aws_17___artificial_intelligence do
        shape :amazon_lex2017                                              , 'shape=mxgraph.aws3.lex;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonLex2017'
        shape :amazon_machine_learning2017                                 ,
              'shape=mxgraph.aws3.machine_learning;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMachineLearning2017'
        shape :amazon_polly2017                                            ,
              'shape=mxgraph.aws3.polly;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonPolly2017'
        shape :amazon_rekognition2017                                      ,
              'shape=mxgraph.aws3.rekognition;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRekognition2017'
      end
      section :aws_17___business_productivity do
        shape :amazon_chime2017                                            ,
              'shape=mxgraph.aws3.chime;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonChime2017'
        shape :amazon_work_mail2017                                        ,
              'shape=mxgraph.aws3.workmail;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonWorkMail2017'
        shape :amazon_work_docs2017                                        ,
              'shape=mxgraph.aws3.workdocs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonWorkDocs2017'
      end
      section :aws_17___compute do
        shape :amazon_ec22017                                              , 'shape=mxgraph.aws3.ec2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonEC22017'
        shape :amazon_ec2ami2017                                           , 'shape=mxgraph.aws3.ami;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonEC2AMI2017'
        shape :amazon_ec2auto_scaling2017                                  ,
              'shape=mxgraph.aws3.auto_scaling;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2AutoScaling2017'
        shape :amazon_ec2dboninstance2017                                  ,
              'shape=mxgraph.aws3.db_on_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2DBoninstance2017'
        shape :amazon_ec2ec2rescue2017                                     ,
              'shape=mxgraph.aws3.rescue;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2EC2rescue2017'
        shape :amazon_ec2elastic_ipaddress2017                             ,
              'shape=mxgraph.aws3.elastic_ip;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2ElasticIPaddress2017'
        shape :amazon_ec2instance2017                                      ,
              'shape=mxgraph.aws3.instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2instance2017'
        shape :amazon_ec2instances2017                                     ,
              'shape=mxgraph.aws3.instances;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2instances2017'
        shape :amazon_ec2instancewith_cloud_watch2017                      ,
              'shape=mxgraph.aws3.instance_with_cloudwatch;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2instancewithCloudWatch2017'
        shape :amazon_ec2optimizedinstance2017                             ,
              'shape=mxgraph.aws3.optimized_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2optimizedinstance2017'
        shape :amazon_ec2spot_instance2017                                 ,
              'shape=mxgraph.aws3.spot_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SpotInstance2017'
        shape :amazon_ec2x1instance2017                                    ,
              'shape=mxgraph.aws3.x1_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2X1instance2017'
        shape :amazon_ecr2017                                              , 'shape=mxgraph.aws3.ecr;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonECR2017'
        shape :amazon_ecrecrregistry2017                                   ,
              'shape=mxgraph.aws3.ecr_registry;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonECRECRRegistry2017'
        shape :amazon_ecs2017                                              , 'shape=mxgraph.aws3.ecs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonECS2017'
        shape :amazon_ecsecscontainer2017                                  ,
              'shape=mxgraph.aws3.ec2_compute_container;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonECSECScontainer2017'
        shape :amazon_ecsecscontainer_alt12017                             ,
              'shape=mxgraph.aws3.ec2_compute_container_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonECSECScontainerAlt12017'
        shape :amazon_ecsecscontainer_alt22017                             ,
              'shape=mxgraph.aws3.ec2_compute_container_3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonECSECScontainerAlt22017'
        shape :amazon_lightsail2017                                        ,
              'shape=mxgraph.aws3.lightsail;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonLightsail2017'
        shape :amazon_vpc2017                                              , 'shape=mxgraph.aws3.vpc;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonVPC2017'
        shape :amazon_vpccustomergateway2017                               ,
              'shape=mxgraph.aws3.customer_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCcustomergateway2017'
        shape :amazon_vpcelasticnetworkadapter2017                         ,
              'shape=mxgraph.aws3.elastic_network_adapter;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCelasticnetworkadapter2017'
        shape :amazon_vpcelasticnetworkinterface2017                       ,
              'shape=mxgraph.aws3.elastic_network_interface;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCelasticnetworkinterface2017'
        shape :amazon_vpcendpoints2017                                     ,
              'shape=mxgraph.aws3.endpoints;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCendpoints2017'
        shape :amazon_vpcflowlogs2017                                      ,
              'shape=mxgraph.aws3.flow_logs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCflowlogs2017'
        shape :amazon_vpcinternetgateway2017                               ,
              'shape=mxgraph.aws3.internet_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCInternetgateway2017'
        shape :amazon_vpcnetworkaccesscontrollist2017                      ,
              'shape=mxgraph.aws3.network_access_controllist;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCnetworkaccesscontrollist2017'
        shape :amazon_vpcrouter2017                                        ,
              'shape=mxgraph.aws3.router;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCrouter2017'
        shape :amazon_vpcvpcnatgateway2017                                 ,
              'shape=mxgraph.aws3.vpc_nat_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCVPCNATgateway2017'
        shape :amazon_vpcvpcpeering2017                                    ,
              'shape=mxgraph.aws3.vpc_peering;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCVPCpeering2017'
        shape :amazon_vpcvpnconnection2017                                 ,
              'shape=mxgraph.aws3.vpn_connection;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCVPNconnection2017'
        shape :amazon_vpcvpngateway2017                                    ,
              'shape=mxgraph.aws3.vpn_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCVPNgateway2017'
        shape :awsbatch2017                                                ,
              'shape=mxgraph.aws3.batch;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSBatch2017'
        shape :awselastic_beanstalk2017                                    ,
              'shape=mxgraph.aws3.elastic_beanstalk;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSElasticBeanstalk2017'
        shape :awselastic_beanstalkapplication2017                         ,
              'shape=mxgraph.aws3.application;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSElasticBeanstalkapplication2017'
        shape :awselastic_beanstalkdeployment2017                          ,
              'shape=mxgraph.aws3.deployment;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSElasticBeanstalkdeployment2017'
        shape :awslambda2017                                               ,
              'shape=mxgraph.aws3.lambda;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSLambda2017'
        shape :awslambda_lambda_function2017                               ,
              'shape=mxgraph.aws3.lambda_function;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSLambdaLambdaFunction2017'
        shape :elastic_load_balancing2017                                  ,
              'shape=mxgraph.aws3.elastic_load_balancing;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ElasticLoadBalancing2017'
        shape :elastic_load_balancing_application_load_balancer2017        ,
              'shape=mxgraph.aws3.application_load_balancer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ElasticLoadBalancingApplicationLoadBalancer2017'
        shape :elastic_load_balancing_elload_balancer2017                  ,
              'shape=mxgraph.aws3.classic_load_balancer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ElasticLoadBalancingELLoadBalancer2017'
      end
      section :aws_17___contact_center do
        shape :amazon_connect2017                                          ,
              'shape=mxgraph.aws3.connect;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonConnect2017'
      end
      section :aws_17___containers do
        shape :auto_scaling_group2017                                      , 'rounded=1;arcSize=10;dashed=1;dashPattern=8 3 1 3;verticalAlign=bottom', 'AutoScalingGroup2017'
        shape :availability_zone2017                                       , 'rounded=1;arcSize=10;dashed=1;dashPattern=8 4;verticalAlign=bottom', 'AvailabilityZone2017'
        shape :region2017                                                  , 'rounded=1;arcSize=10;dashed=1;dashPattern=1 1;verticalAlign=bottom', 'Region2017'
        shape :security_group2017                                          , 'verticalAlign=bottom', 'SecurityGroup2017'
        shape :elastic_bean_stalk_container2017                            , cs.to_s, 'ElasticBeanStalkContainer2017'
        shape :ec2instance_contents2017                                    , cs.to_s, 'EC2InstanceContents2017'
        shape :vpcsubnet2017                                               , cs.to_s, 'VPCSubnet2017'
        shape :server_contents2017                                         , 'rounded=1;arcSize=10;dashed=0;fillColor=#DBDBDB;gradientColor=none;verticalAlign=bottom', 'ServerContents2017'
        shape :virtual_private_cloud_container2017                         , cs.to_s, 'VirtualPrivateCloudContainer2017'
        shape :awscloud_container2017                                      , cs.to_s, 'AWSCloudContainer2017'
        shape :corporate_data_center_container2017                         , cs.to_s, 'CorporateDataCenterContainer2017'
      end
      section :aws_17___database do
        shape :amazon_dynamo_db2017                                        ,
              'shape=mxgraph.aws3.dynamo_db;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDB2017'
        shape :amazon_dynamo_dbaccelerator2017                             ,
              'shape=mxgraph.aws3.db_accelerator;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBAccelerator2017'
        shape :amazon_dynamo_dbattribute2017                               ,
              'shape=mxgraph.aws3.attribute;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBattribute2017'
        shape :amazon_dynamo_dbattributes2017                              ,
              'shape=mxgraph.aws3.attributes;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBattributes2017'
        shape :amazon_dynamo_dbglobalsecondaryindex2017                    ,
              'shape=mxgraph.aws3.global_secondary_index;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBglobalsecondaryindex2017'
        shape :amazon_dynamo_dbitem2017                                    ,
              'shape=mxgraph.aws3.item;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBitem2017'
        shape :amazon_dynamo_dbitems2017                                   ,
              'shape=mxgraph.aws3.items;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBitems2017'
        shape :amazon_dynamo_dbtable2017                                   ,
              'shape=mxgraph.aws3.table;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonDynamoDBtable2017'
        shape :amazon_elastic_cache2017                                    ,
              'shape=mxgraph.aws3.elasticache;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonElasticCache2017'
        shape :amazon_elastic_cachecachenode2017                           ,
              'shape=mxgraph.aws3.cache_node;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonElasticCachecachenode2017'
        shape :amazon_elastic_cache_memcached2017                          ,
              'shape=mxgraph.aws3.memcached;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonElasticCacheMemcached2017'
        shape :amazon_elastic_cache_redis2017                              ,
              'shape=mxgraph.aws3.redis;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonElasticCacheRedis2017'
        shape :amazon_rds2017                                              , 'shape=mxgraph.aws3.rds;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonRDS2017'
        shape :amazon_rdsdbinstance2017                                    ,
              'shape=mxgraph.aws3.rds_db_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSDBinstance2017'
        shape :amazon_rdsinstancereadreplica2017                           ,
              'shape=mxgraph.aws3.rds_db_instance_read_replica;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSinstancereadreplica2017'
        shape :amazon_rdsinstancestandby2017                               ,
              'shape=mxgraph.aws3.rds_db_instance_standby_multi_az;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSinstancestandby2017'
        shape :amazon_rdsmssqlinstance2017                                 ,
              'shape=mxgraph.aws3.ms_sql_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSMSSQLinstance2017'
        shape :amazon_rdsmssqlinstancealternate2017                        ,
              'shape=mxgraph.aws3.ms_sql_instance_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSMSSQLinstancealternate2017'
        shape :amazon_rdsmy_sqldbinstance2017                              ,
              'shape=mxgraph.aws3.ms_sql_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSMySQLDBinstance2017'
        shape :amazon_rdsmy_sqlinstancealternate2017                       ,
              'shape=mxgraph.aws3.mysql_db_instance_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSMySQLinstancealternate2017'
        shape :amazon_rdsoracle_dbinstance2017                             ,
              'shape=mxgraph.aws3.oracle_db_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSoracleDBinstance2017'
        shape :amazon_rdsoracle_dbinstancealternate2017                    ,
              'shape=mxgraph.aws3.oracle_db_instance_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSOracleDBinstancealternate2017'
        shape :amazon_rdspiop2017                                          ,
              'shape=mxgraph.aws3.piop;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSPIOP2017'
        shape :amazon_rdspostgre_sqlinstance2017                           ,
              'shape=mxgraph.aws3.postgre_sql_instance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSPostgreSQLinstance2017'
        shape :amazon_rdssqlmaster2017                                     ,
              'shape=mxgraph.aws3.sql_master;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSSQLmaster2017'
        shape :amazon_rdssqlslave2017                                      ,
              'shape=mxgraph.aws3.sql_slave;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRDSSQLslave2017'
        shape :awsdms2017                                                  ,
              'shape=mxgraph.aws3.database_migration_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSDMS2017'
        shape :awsdmsdatabasemigrationworkflowjob2017                      ,
              'shape=mxgraph.aws3.database_migration_workflow_job;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSDMSdatabasemigrationworkflowjob2017'
      end
      section :aws_17___desktop_app_straning do
        shape :amazon_work_spaces2017                                      ,
              'shape=mxgraph.aws3.workspaces;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonWorkSpaces2017'
      end
      section :aws_17___developer_tools do
        shape :awscode_build2017                                           ,
              'shape=mxgraph.aws3.codebuild;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCodeBuild2017'
        shape :awscode_commit2017                                          ,
              'shape=mxgraph.aws3.codecommit;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCodeCommit2017'
        shape :awscode_deploy2017                                          ,
              'shape=mxgraph.aws3.codedeploy;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCodeDeploy2017'
        shape :awscode_pipeline2017                                        ,
              'shape=mxgraph.aws3.codepipeline;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCodePipeline2017'
        shape :awscode_star2017                                            ,
              'shape=mxgraph.aws3.codestar;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCodeStar2017'
        shape :awsxray2017                                                 ,
              'shape=mxgraph.aws3.x_ray;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSXRay2017'
      end
      section :aws_17___game_development do
        shape :amazon_game_lift2017                                        ,
              'shape=mxgraph.aws3.gamelift;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonGameLift2017'
      end
      section :aws_17___general do
        shape :awscloud2017                                                ,
              'shape=mxgraph.aws3.cloud;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWScloud2017'
        shape :awsmanagement_console2017                                   ,
              'shape=mxgraph.aws3.management_console;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSManagementConsole2017'
        shape :client2017                                                  ,
              'shape=mxgraph.aws3.management_console;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'client2017'
        shape :corporatedatacenter2017                                     ,
              'shape=mxgraph.aws3.corporate_data_center;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'corporatedatacenter2017'
        shape :disk2017                                                    ,
              'shape=mxgraph.aws3.disk;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'disk2017'
        shape :forums2017                                                  ,
              'shape=mxgraph.aws3.forums;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'forums2017'
        shape :genericdatabase2017                                         ,
              'shape=mxgraph.aws3.generic_database;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'genericdatabase2017'
        shape :internet2017                                                ,
              'shape=mxgraph.aws3.internet;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Internet2017'
        shape :internetalternate12017                                      ,
              'shape=mxgraph.aws3.internet_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Internetalternate12017'
        shape :internetalternate22017                                      ,
              'shape=mxgraph.aws3.internet_3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Internetalternate22017'
        shape :mobileclient2017                                            ,
              'shape=mxgraph.aws3.mobile_client;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'mobileclient2017'
        shape :multimedia2017                                              ,
              'shape=mxgraph.aws3.multimedia;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'multimedia2017'
        shape :officebuilding2017                                          ,
              'shape=mxgraph.aws3.office_building;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'officebuilding2017'
        shape :samltoken2017                                               ,
              'shape=mxgraph.aws3.saml_token;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'SAMLtoken2017'
        shape :sslpadlock2017                                              ,
              'shape=mxgraph.aws3.ssl_padlock;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'SSLpadlock2017'
        shape :tapestorage2017                                             ,
              'shape=mxgraph.aws3.tape_storage;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'tapestorage2017'
        shape :traditionalserver2017                                       ,
              'shape=mxgraph.aws3.traditional_server;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'traditionalserver2017'
        shape :user2017                                                    ,
              'shape=mxgraph.aws3.user;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'user2017'
        shape :users2017                                                   ,
              'shape=mxgraph.aws3.users;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'users2017'
        shape :virtualprivatecloud2017                                     ,
              'shape=mxgraph.aws3.virtual_private_cloud;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'virtualprivatecloud2017'
      end
      section :aws_17___io_t do
        shape :awsio_tlambdafunction2017                                   ,
              'shape=mxgraph.aws3.lambda_function;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTlambdafunction2017'
        shape :awsio_tfire_tvstick2017                                     ,
              'shape=mxgraph.aws3.fire_tv_stick;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTfireTVstick2017'
        shape :awsio_tfire_tv2017                                          ,
              'shape=mxgraph.aws3.fire_tv;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTfireTV2017'
        shape :awsio_techo2017                                             ,
              'shape=mxgraph.aws3.echo;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTecho2017'
        shape :awsio_tavsenableddevice2017                                 ,
              'shape=mxgraph.aws3.alexa_enabled_device;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTAVSenableddevice2017'
        shape :awsio_talexavoiceservice2017                                ,
              'shape=mxgraph.aws3.alexa_voice_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTalexavoiceservice2017'
        shape :awsio_talexasmarthomeskill2017                              ,
              'shape=mxgraph.aws3.alexa_smart_home_skill;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTalexasmarthomeskill2017'
        shape :awsio_talexaskill2017                                       ,
              'shape=mxgraph.aws3.alexa_skill;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTalexaskill2017'
        shape :awsio_thttpprotocol2017                                     ,
              'shape=mxgraph.aws3.http_protocol;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTHTTPprotocol2017'
        shape :awsio_thttp2protocol2017                                    ,
              'shape=mxgraph.aws3.http_2_protocol;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTHTTP2protocol2017'
        shape :awsio_thardwareboard2017                                    ,
              'shape=mxgraph.aws3.hardware_board;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoThardwareboard2017'
        shape :awsio_trule2017                                             ,
              'shape=mxgraph.aws3.rule;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTrule2017'
        shape :awsio_tpolicy2017                                           ,
              'shape=mxgraph.aws3.policy;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTpolicy2017'
        shape :awsio_tmqttprotocol2017                                     ,
              'shape=mxgraph.aws3.mqtt_protocol;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTMQTTprotocol2017'
        shape :awsio_taction2017                                           ,
              'shape=mxgraph.aws3.action;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTaction2017'
        shape :awsio_ttopic2017                                            ,
              'shape=mxgraph.aws3.topic;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTtopic2017'
        shape :awsio_tshadow2017                                           ,
              'shape=mxgraph.aws3.shadow;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTshadow2017'
        shape :awsio_tdesiredstate2017                                     ,
              'shape=mxgraph.aws3.desired_state;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTdesiredstate2017'
        shape :awsio_tcertificate2017                                      ,
              'shape=mxgraph.aws3.certificate;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTcertificate2017'
        shape :awsio_treportedstate2017                                    ,
              'shape=mxgraph.aws3.reported_state;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTreportedstate2017'
        shape :awsio_tsimulator2017                                        ,
              'shape=mxgraph.aws3.simulator;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTsimulator2017'
        shape :awsio_tservo2017                                            ,
              'shape=mxgraph.aws3.servo;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTservo2017'
        shape :awsio_tsensor2017                                           ,
              'shape=mxgraph.aws3.sensor;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTsensor2017'
        shape :awsio_tactuator2017                                         ,
              'shape=mxgraph.aws3.actuator;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTactuator2017'
        shape :awsio_tthingthermostat2017                                  ,
              'shape=mxgraph.aws3.thermostat;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingthermostat2017'
        shape :awsio_tthingmedicalemergency2017                            ,
              'shape=mxgraph.aws3.medical_emergency;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingmedicalemergency2017'
        shape :awsio_tthingtravel2017                                      ,
              'shape=mxgraph.aws3.travel;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingtravel2017'
        shape :awsio_tthingcoffeepot2017                                   ,
              'shape=mxgraph.aws3.coffee_pot;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingcoffeepot2017'
        shape :awsio_tthingcart2017                                        ,
              'shape=mxgraph.aws3.cart;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingcart2017'
        shape :awsio_tthingcamera2017                                      ,
              'shape=mxgraph.aws3.camera;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingcamera2017'
        shape :awsio_tthingpoliceemergency2017                             ,
              'shape=mxgraph.aws3.police_emergency;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingpoliceemergency2017'
        shape :awsio_tthingdoorlock2017                                    ,
              'shape=mxgraph.aws3.door_lock;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingdoorlock2017'
        shape :awsio_tthingutility2017                                     ,
              'shape=mxgraph.aws3.utility;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingutility2017'
        shape :awsio_tthingcar2017                                         , 'shape=mxgraph.aws3.car;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AWSIoTthingcar2017'
        shape :awsio_tthingbank2017                                        ,
              'shape=mxgraph.aws3.bank;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingbank2017'
        shape :awsio_tthingwindfarm2017                                    ,
              'shape=mxgraph.aws3.windfarm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingwindfarm2017'
        shape :awsio_tthingbicycle2017                                     ,
              'shape=mxgraph.aws3.bicycle;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingbicycle2017'
        shape :awsio_tthinghouse2017                                       ,
              'shape=mxgraph.aws3.house;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthinghouse2017'
        shape :awsio_tthingfactory2017                                     ,
              'shape=mxgraph.aws3.factory;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthingfactory2017'
        shape :awsio_tthinglightbulb2017                                   ,
              'shape=mxgraph.aws3.lightbulb;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthinglightbulb2017'
        shape :awsio_tthinggeneric2017                                     ,
              'shape=mxgraph.aws3.generic;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTthinggeneric2017'
        shape :awsio_tawsgreengrass2017                                    ,
              'shape=mxgraph.aws3.greengrass;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoTAWSGreengrass2017'
        shape :awsio_t2017                                                 ,
              'shape=mxgraph.aws3.aws_iot;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSIoT2017'
      end
      section :aws_17___management do
        shape :amazon_cloud_watch2017                                      ,
              'shape=mxgraph.aws3.cloudwatch;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudWatch2017'
        shape :amazon_cloud_watchalarm2017                                 ,
              'shape=mxgraph.aws3.alarm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudWatchalarm2017'
        shape :amazon_cloud_watcheventeventbased2017                       ,
              'shape=mxgraph.aws3.event_event_based;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudWatcheventeventbased2017'
        shape :amazon_cloud_watcheventtimebased2017                        ,
              'shape=mxgraph.aws3.event_time_based;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudWatcheventtimebased2017'
        shape :amazon_cloud_watchrule2017                                  ,
              'shape=mxgraph.aws3.config_rule;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudWatchrule2017'
        shape :amazon_ec2systems_manager2017                               ,
              'shape=mxgraph.aws3.ec2_systems_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManager2017'
        shape :amazon_ec2systems_manager_automation2017                    ,
              'shape=mxgraph.aws3.automation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerAutomation2017'
        shape :amazon_ec2systems_managerdocuments2017                      ,
              'shape=mxgraph.aws3.documents;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerdocuments2017'
        shape :amazon_ec2systems_manager_inventory2017                     ,
              'shape=mxgraph.aws3.inventory;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerInventory2017'
        shape :amazon_ec2systems_manager_maintenance_window2017            ,
              'shape=mxgraph.aws3.maintenance_window;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerMaintenanceWindow2017'
        shape :amazon_ec2systems_manager_parameter_store2017               ,
              'shape=mxgraph.aws3.parameter_store;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerParameterStore2017'
        shape :amazon_ec2systems_manager_patch_manager2017                 ,
              'shape=mxgraph.aws3.patch_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerPatchManager2017'
        shape :amazon_ec2systems_manager_run_command2017                   ,
              'shape=mxgraph.aws3.run_command;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerRunCommand2017'
        shape :amazon_ec2systems_manager_state_manager2017                 ,
              'shape=mxgraph.aws3.state_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEC2SystemsManagerStateManager2017'
        shape :awscloud_formation2017                                      ,
              'shape=mxgraph.aws3.cloudformation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCloudFormation2017'
        shape :awscloud_formationchangeset2017                             ,
              'shape=mxgraph.aws3.change_set;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCloudFormationchangeset2017'
        shape :awscloud_formationstack2017                                 ,
              'shape=mxgraph.aws3.stack_aws_cloudformation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCloudFormationstack2017'
        shape :awscloud_formationtemplate2017                              ,
              'shape=mxgraph.aws3.template;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCloudFormationtemplate2017'
        shape :awscloud_trail2017                                          ,
              'shape=mxgraph.aws3.cloudtrail;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCloudTrail2017'
        shape :awsconfig2017                                               ,
              'shape=mxgraph.aws3.config;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSConfig2017'
        shape :awsmanaged_services2017                                     ,
              'shape=mxgraph.aws3.managed_services;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSManagedServices2017'
        shape :awsops_works2017                                            ,
              'shape=mxgraph.aws3.opsworks;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorks2017'
        shape :awsops_worksapps2017                                        ,
              'shape=mxgraph.aws3.apps;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorksapps2017'
        shape :awsops_worksdeployments2017                                 ,
              'shape=mxgraph.aws3.deployments;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorksdeployments2017'
        shape :awsops_worksinstances2017                                   ,
              'shape=mxgraph.aws3.instances_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorksinstances2017'
        shape :awsops_workslayers2017                                      ,
              'shape=mxgraph.aws3.layers;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorkslayers2017'
        shape :awsops_worksmonitoring2017                                  ,
              'shape=mxgraph.aws3.monitoring;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorksmonitoring2017'
        shape :awsops_workspermissions2017                                 ,
              'shape=mxgraph.aws3.permissions;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorkspermissions2017'
        shape :awsops_worksresources2017                                   ,
              'shape=mxgraph.aws3.resources;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorksresources2017'
        shape :awsops_worksstack2017                                       ,
              'shape=mxgraph.aws3.stack_aws_opsworks;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOpsWorksstack2017'
        shape :awsservice_catalog2017                                      ,
              'shape=mxgraph.aws3.service_catalog;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSServiceCatalog2017'
        shape :awstrusted_advisor2017                                      ,
              'shape=mxgraph.aws3.trusted_advisor;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSTrustedAdvisor2017'
        shape :awstrusted_advisorchecklist2017                             ,
              'shape=mxgraph.aws3.checklist;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSTrustedAdvisorchecklist2017'
        shape :awstrusted_advisorchecklistcost2017                         ,
              'shape=mxgraph.aws3.checklist_cost;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSTrustedAdvisorchecklistcost2017'
        shape :awstrusted_advisorchecklistfaulttolerance2017               ,
              'shape=mxgraph.aws3.checklist_fault_tolerance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSTrustedAdvisorchecklistfaulttolerance2017'
        shape :awstrusted_advisorchecklistperformance2017                  ,
              'shape=mxgraph.aws3.checklist_performance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSTrustedAdvisorchecklistperformance2017'
        shape :awstrusted_advisorchecklistsecurity2017                     ,
              'shape=mxgraph.aws3.checklist_security;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSTrustedAdvisorchecklistsecurity2017'
      end
      section :aws_17___messaging do
        shape :amazon_pinpoint2017                                         ,
              'shape=mxgraph.aws3.pinpoint;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonPinpoint2017'
        shape :amazon_ses2017                                              , 'shape=mxgraph.aws3.ses;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonSES2017'
        shape :amazon_sesemail2017                                         ,
              'shape=mxgraph.aws3.email;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSESemail2017'
        shape :amazon_sns2017                                              , 'shape=mxgraph.aws3.sns;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonSNS2017'
        shape :amazon_snsemailnotification2017                             ,
              'shape=mxgraph.aws3.email_notification;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSNSemailnotification2017'
        shape :amazon_snshttpnotification2017                              ,
              'shape=mxgraph.aws3.http_notification;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSNSHTTPnotification2017'
        shape :amazon_snstopic2017                                         ,
              'shape=mxgraph.aws3.topic_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSNStopic2017'
        shape :amazon_sqs2017                                              , 'shape=mxgraph.aws3.sqs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonSQS2017'
        shape :amazon_sqsmessage2017                                       ,
              'shape=mxgraph.aws3.message;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSQSmessage2017'
        shape :amazon_sqsqueue2017                                         ,
              'shape=mxgraph.aws3.queue;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonSQSqueue2017'
      end
      section :aws_17___migration do
        shape :awsapplication_discovery_service2017                        ,
              'shape=mxgraph.aws3.application_discovery_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSApplicationDiscoveryService2017'
        shape :awsmigration_hub2017                                        ,
              'shape=mxgraph.aws3.migration_hub_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSMigrationHub2017'
        shape :awssms2017                                                  ,
              'shape=mxgraph.aws3.server_migration_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSSMS2017'
        shape :awssnowball2017                                             ,
              'shape=mxgraph.aws3.snowball;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSSnowball2017'
        shape :awssnowballimportexport2017                                 ,
              'shape=mxgraph.aws3.import_export;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSSnowballimportexport2017'
      end
      section :aws_17___mobile_services do
        shape :amazon_cognito2017                                          ,
              'shape=mxgraph.aws3.cognito;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCognito2017'
        shape :amazon_mobile_analytics2017                                 ,
              'shape=mxgraph.aws3.mobile_analytics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMobileAnalytics2017'
        shape :awsdevice_farm2017                                          ,
              'shape=mxgraph.aws3.device_farm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSDeviceFarm2017'
        shape :awsmobile_hub2017                                           ,
              'shape=mxgraph.aws3.mobile_hub;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;fillColor=#AD688A;gradientColor=#F58435;gradientDirection=west;;pointerEvents=1', 'AWSMobileHub2017'
      end
      section :aws_17___networking_content_delivery do
        shape :amazon_cloud_front2017                                      ,
              'shape=mxgraph.aws3.cloudfront;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudFront2017'
        shape :amazon_cloud_frontdownloaddistribution2017                  ,
              'shape=mxgraph.aws3.download_distribution;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudFrontdownloaddistribution2017'
        shape :amazon_cloud_frontedgelocation2017                          ,
              'shape=mxgraph.aws3.edge_location;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudFrontedgelocation2017'
        shape :amazon_cloud_frontstreamingdistribution2017                 ,
              'shape=mxgraph.aws3.streaming_distribution;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudFrontstreamingdistribution2017'
        shape :amazon_route532017                                          ,
              'shape=mxgraph.aws3.route_53;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRoute532017'
        shape :amazon_route53hostedzone2017                                ,
              'shape=mxgraph.aws3.hosted_zone;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRoute53hostedzone2017'
        shape :amazon_route53routetable2017                                ,
              'shape=mxgraph.aws3.route_table;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonRoute53routetable2017'
        shape :amazon_vpcinternetgateway2017                               ,
              'shape=mxgraph.aws3.internet_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonVPCinternetgateway2017'
        shape :awsdirect_connect2017                                       ,
              'shape=mxgraph.aws3.direct_connect;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSDirectConnect2017'
        shape :elastic_load_balancing_classic_load_balancer2017            ,
              'shape=mxgraph.aws3.classic_load_balancer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ElasticLoadBalancingClassicLoadBalancer2017'
      end
      section :aws_17___on_demand_workforce do
        shape :amazon_mechanical_turk2017                                  ,
              'shape=mxgraph.aws3.mechanical_turk;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMechanicalTurk2017'
        shape :amazon_mechanical_turkassignmenttask2017                    ,
              'shape=mxgraph.aws3.assignment_task;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMechanicalTurkassignmenttask2017'
        shape :amazon_mechanical_turkhumanintelligencetasks2017            ,
              'shape=mxgraph.aws3.human_intelligence_tasks_hit;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMechanicalTurkhumanintelligencetasks2017'
        shape :amazon_mechanical_turkrequester2017                         ,
              'shape=mxgraph.aws3.requester;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMechanicalTurkrequester2017'
        shape :amazon_mechanical_turkworkers2017                           ,
              'shape=mxgraph.aws3.users;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMechanicalTurkworkers2017'
      end
      section :aws_17___sdks do
        shape :xamarin2017                                                 ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Xamarin2017'
        shape :ruby2017                                                    ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Ruby2017'
        shape :python2017                                                  ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Python2017'
        shape :php2017                                                     ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'PHP2017'
        shape :nodejs2017                                                  ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Nodejs2017'
        shape :net2017                                                     ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Net2017'
        shape :java_script2017                                             ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'JavaScript2017'
        shape :java2017                                                    ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Java2017'
        shape :i_os2017                                                    ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'iOS2017'
        shape :awstools_for_windows_power_shell2017                        ,
              'shape=mxgraph.aws3.toolkit_for_windows_powershell;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSToolsForWindowsPowerShell2017'
        shape :awstoolkit_for_visual_studio2017                            ,
              'shape=mxgraph.aws3.toolkit_for_visual_studio;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSToolkitForVisualStudio2017'
        shape :awstoolkit_for_eclipse2017                                  ,
              'shape=mxgraph.aws3.toolkit_for_eclipse;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSToolkitForEclipse2017'
        shape :awscli2017                                                  , 'shape=mxgraph.aws3.cli;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AWSCLI2017'
        shape :android2017                                                 ,
              'shape=mxgraph.aws3.android;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'Android2017'
      end
      section :aws_17___serurity_identity_and_compliance do
        shape :acmcertificatemanager2017                                   ,
              'shape=mxgraph.aws3.certificate_manager_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ACMcertificatemanager2017'
        shape :amazon_cloud_directory2017                                  ,
              'shape=mxgraph.aws3.clouddirectory;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonCloudDirectory2017'
        shape :amazon_inspector2017                                        ,
              'shape=mxgraph.aws3.inspector;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonInspector2017'
        shape :amazon_inspectoragent2017                                   ,
              'shape=mxgraph.aws3.agent;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonInspectoragent2017'
        shape :amazon_macie2017                                            ,
              'shape=mxgraph.aws3.macie;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonMacie2017'
        shape :awsartifact2017                                             ,
              'shape=mxgraph.aws3.artifact;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSArtifact2017'
        shape :awscertificate_manager2017                                  ,
              'shape=mxgraph.aws3.certificate_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCertificateManager2017'
        shape :awscloud_hsm2017                                            ,
              'shape=mxgraph.aws3.cloudhsm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCloudHSM2017'
        shape :awsdirectory_service2017                                    ,
              'shape=mxgraph.aws3.directory_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSDirectoryService2017'
        shape :awskms2017                                                  , 'shape=mxgraph.aws3.kms;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AWSKMS2017'
        shape :awsorganizations2017                                        ,
              'shape=mxgraph.aws3.organizations;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSOrganizations2017'
        shape :awsshield2017                                               ,
              'shape=mxgraph.aws3.shield;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSShield2017'
        shape :awswaf2017                                                  , 'shape=mxgraph.aws3.waf;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AWSWAF2017'
        shape :awswaffilteringrule2017                                     ,
              'shape=mxgraph.aws3.filtering_rule;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSWAFfilteringrule2017'
        shape :iam2017                                                     , 'shape=mxgraph.aws3.iam;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'IAM2017'
        shape :iamaddon2017                                                ,
              'shape=mxgraph.aws3.add_on;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMaddon2017'
        shape :iamawssts2017                                               , 'shape=mxgraph.aws3.sts;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'IAMAWSSTS2017'
        shape :iamawssts22017                                              ,
              'shape=mxgraph.aws3.sts_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMAWSSTS22017'
        shape :iamdataencryptionkey2017                                    ,
              'shape=mxgraph.aws3.data_encryption_key;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMdataencryptionkey2017'
        shape :iamencrypteddata2017                                        ,
              'shape=mxgraph.aws3.encrypted_data;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMencrypteddata2017'
        shape :iamlongtermsecuritycredential2017                           ,
              'shape=mxgraph.aws3.long_term_security_credential;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;fillColor=#ffffff;pointerEvents=1', 'IAMlongtermsecuritycredential2017'
        shape :iammfatoken2017                                             ,
              'shape=mxgraph.aws3.mfa_token;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMMFAtoken2017'
        shape :iampermissions2017                                          ,
              'shape=mxgraph.aws3.permissions_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMpermissions2017'
        shape :iamrole2017                                                 ,
              'shape=mxgraph.aws3.role;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'IAMrole2017'
        shape :iamtemporarysecuritycredential2017                          ,
              'shape=mxgraph.aws3.temporary_security_credential;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;fillColor=#ffffff;pointerEvents=1', 'IAMtemporarysecuritycredential2017'
      end
      section :aws_17___storage do
        shape :amazon_ebs2017                                              ,
              'shape=mxgraph.aws3.volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEBS2017'
        shape :amazon_efs2017                                              , 'shape=mxgraph.aws3.efs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonEFS2017'
        shape :amazon_efsefsfilesystem2017                                 ,
              'shape=mxgraph.aws3.efs_share;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonEFSEFSfilesystem2017'
        shape :amazon_glacier2017                                          ,
              'shape=mxgraph.aws3.glacier;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonGlacier2017'
        shape :amazon_glacierarchive2017                                   ,
              'shape=mxgraph.aws3.archive;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonGlacierarchive2017'
        shape :amazon_glaciervault2017                                     ,
              'shape=mxgraph.aws3.vault;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonGlaciervault2017'
        shape :amazon_s32017                                               , 'shape=mxgraph.aws3.s3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1',
              'AmazonS32017'
        shape :amazon_s3bucket2017                                         ,
              'shape=mxgraph.aws3.bucket;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonS3bucket2017'
        shape :amazon_s3bucketwithobjects2017                              ,
              'shape=mxgraph.aws3.bucket_with_objects;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonS3bucketwithobjects2017'
        shape :amazon_s3object2017                                         ,
              'shape=mxgraph.aws3.object;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AmazonS3object2017'
        shape :awsstorage_gateway2017                                      ,
              'shape=mxgraph.aws3.storage_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSStorageGateway2017'
        shape :awsstorage_gatewaycachedvolume2017                          ,
              'shape=mxgraph.aws3.cached_volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSStorageGatewaycachedvolume2017'
        shape :awsstorage_gatewaynoncachedvolume2017                       ,
              'shape=mxgraph.aws3.non_cached_volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSStorageGatewaynoncachedvolume2017'
        shape :awsstorage_gatewayvirtualtapelibrary2017                    ,
              'shape=mxgraph.aws3.virtual_tape_library;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSStorageGatewayvirtualtapelibrary2017'
        shape :snapshot2017                                                ,
              'shape=mxgraph.aws3.snapshot;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'snapshot2017'
        shape :volume2017                                                  ,
              'shape=mxgraph.aws3.volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'volume2017'
      end
      section :aws_19_analyti_cs do
        shape :analytics_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.analytics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AnalyticsAWS19'
        shape :amazon_athena_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.athena;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonAthenaAWS19'
        shape :amazon_cloud_search_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloudsearch;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonCloudSearchAWS19'
        shape :amazon_elasticsearch_service_aws19                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elasticsearch_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticsearchServiceAWS19'
        shape :amazon_emraws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.emr;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonEMRAWS19'
        shape :amazon_kinesis_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.kinesis;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonKinesisAWS19'
        shape :amazon_kinesis_data_analytics_aws19                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.kinesis_data_analytics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonKinesisDataAnalyticsAWS19'
        shape :amazon_kinesis_data_firehose_aws19                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.kinesis_data_firehose;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonKinesisDataFirehoseAWS19'
        shape :amazon_kinesis_data_streams_aws19                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.kinesis_data_streams;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonKinesisDataStreamsAWS19'
        shape :amazon_kinesis_video_streams_aws19                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.kinesis_video_streams;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonKinesisVideoStreamsAWS19'
        shape :amazon_managed_streamingfor_kafka_aws19                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.managed_streaming_for_kafka;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonManagedStreamingforKafkaAWS19'
        shape :amazon_quick_sight_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.quicksight;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonQuickSightAWS19'
        shape :amazon_redshift_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.redshift;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonRedshiftAWS19'
        shape :awsdata_pipeline_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.data_pipeline;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDataPipelineAWS19'
        shape :awsglue_aws19                                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.glue;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSGlueAWS19'
        shape :awslake_formation_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.lake_formation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSLakeFormationAWS19'
        shape :amazon_cloud_search_search_documents_aws19                  ,
              'shape=mxgraph.aws4.search_documents;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudSearch_SearchDocumentsAWS19'
        shape :amazon_emr_cluster_aws19                                    ,
              'shape=mxgraph.aws4.cluster;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEMR_ClusterAWS19'
        shape :amazon_emr_emrengine_aws19                                  ,
              'shape=mxgraph.aws4.emr_engine;;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEMR_EMREngineAWS19'
        shape :amazon_emr_emrengine_map_rm3aws19                           ,
              'shape=mxgraph.aws4.emr_engine_mapr_m3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEMR_EMREngineMapRM3AWS19'
        shape :amazon_emr_emrengine_map_rm5aws19                           ,
              'shape=mxgraph.aws4.emr_engine_mapr_m5;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEMR_EMREngineMapRM5AWS19'
        shape :amazon_emr_emrengine_map_rm7aws19                           ,
              'shape=mxgraph.aws4.emr_engine_mapr_m7;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEMR_EMREngineMapRM7AWS19'
        shape :amazon_redshift_dense_compute_node_aws19                    ,
              'shape=mxgraph.aws4.dense_compute_node;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRedshift_DenseComputeNodeAWS19'
        shape :amazon_redshift_dense_storage_node_aws19                    ,
              'shape=mxgraph.aws4.dense_storage_node;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRedshift_DenseStorageNodeAWS19'
        shape :awsglue_crawlers_aws19                                      ,
              'shape=mxgraph.aws4.glue_crawlers;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGlue_CrawlersAWS19'
        shape :awsglue_data_catalog_aws19                                  ,
              'shape=mxgraph.aws4.glue_data_catalog;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGlue_DataCatalogAWS19'
        shape :amazon_emr_hdfscluster_aws19                                ,
              'shape=mxgraph.aws4.cluster;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEMR_HDFSClusterAWS19'
        shape :awsdata_lake_resource_aws19                                 ,
              'shape=mxgraph.aws4.data_lake_resource_icon;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSDataLake_ResourceAWS19'
      end
      section :aws_19___application_integration do
        shape :application_integration_aws19                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.application_integration;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ApplicationIntegrationAWS19'
        shape :amazon_mqaws19                                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.mq;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonMQAWS19'
        shape :amazon_simple_notification_service_snsaws19                 ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sns;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSimpleNotificationServiceSNSAWS19'
        shape :amazon_simple_queue_service_sqsaws19                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sqs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSimpleQueueServiceSQSAWS19'
        shape :awsapp_sync_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sqs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSAppSyncAWS19'
        shape :awsstep_functions_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.step_functions;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSStepFunctionsAWS19'
        shape :amazon_simple_notification_service_sns_email_notification_aws19,
              'shape=mxgraph.aws4.email_notification;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleNotificationServiceSNS_EmailNotificationAWS19'
        shape :amazon_simple_notification_service_sns_httpnotification_aws19,
              'shape=mxgraph.aws4.http_notification;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleNotificationServiceSNS_HTTPNotificationAWS19'
        shape :amazon_simple_notification_service_sns_topic_aws19          ,
              'shape=mxgraph.aws4.topic;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleNotificationServiceSNS_TopicAWS19'
        shape :amazon_simple_queue_service_sqs_message_aws19               ,
              'shape=mxgraph.aws4.message;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleQueueServiceSQS_MessageAWS19'
        shape :amazon_simple_queue_service_sqs_queue_aws19                 ,
              'shape=mxgraph.aws4.queue;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleQueueServiceSQS_QueueAWS19'
        shape :amazon_apigateway_endpoint_aws19                            ,
              'shape=mxgraph.aws4.endpoint;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonAPIGateway_EndpointAWS19'
        shape :amazon_event_bridge_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.eventbridge;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonEventBridgeAWS19'
        shape :awselemental_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalAWS19'
      end
      section :aws_19___ar_vr do
        shape :arvraws19                                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.ar_vr;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ARVRAWS19'
        shape :amazon_sumerian_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sumerian;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSumerianAWS19'
      end
      section :aws_19___blockchain do
        shape :blockchain_aws19                                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.blockchain;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'BlockchainAWS19'
        shape :amazon_managed_blockchain_aws19                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.managed_blockchain;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonManagedBlockchainAWS19'
        shape :amazon_quantum_ledger_database_qldbaws19                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.quantum_ledger_database;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonQuantumLedgerDatabaseQLDBAWS19'
      end
      section :aws_19___business_applications do
        shape :business_application_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.business_application;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'BusinessApplicationAWS19'
        shape :alexa_for_business_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.alexa_for_business;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AlexaForBusinessAWS19'
        shape :amazon_chime_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.chime;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonChimeAWS19'
        shape :amazon_work_docs_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.workdocs;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonWorkDocsAWS19'
        shape :amazon_work_mail_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.workmail;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonWorkMailAWS19'
      end
      section :aws_19___compute do
        shape :compute_aws19                                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.compute;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ComputeAWS19'
        shape :amazon_ec2aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.ec2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonEC2AWS19'
        shape :amazon_ec2auto_scaling_aws19                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.auto_scaling2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonEC2AutoScalingAWS19'
        shape :amazon_ec2container_registry_aws19                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.ecr;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonEC2ContainerRegistryAWS19'
        shape :amazon_elastic_container_service_aws19                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.ecs;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticContainerServiceAWS19'
        shape :amazon_elastic_container_servicefor_kubernetes_aws19        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.eks;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticContainerServiceforKubernetesAWS19'
        shape :amazon_lightsail_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.lightsail;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonLightsailAWS19'
        shape :awsbatch_aws19                                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.batch;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSBatchAWS19'
        shape :awselastic_beanstalk_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_beanstalk;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElasticBeanstalkAWS19'
        shape :awsfargate_aws19                                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.fargate;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSFargateAWS19'
        shape :awslambda_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.lambda;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSLambdaAWS19'
        shape :awsoutposts_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.outposts;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSOutpostsAWS19'
        shape :awsserverless_application_repository_aws19                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.serverless_application_repository;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSServerlessApplicationRepositoryAWS19'
        shape :elastic_load_balancing_elbaws19                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_load_balancing;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'ElasticLoadBalancingELBAWS19'
        shape :vmware_cloud_on_awsaws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.vmware_cloud_on_aws;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'VMwareCloudOnAWSAWS19'
        shape :amazon_ec2_amiaws19                                         , 'shape=mxgraph.aws4.ami;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1',
              'AmazonEC2_AMIAWS19'
        shape :amazon_ec2_auto_scaling_aws19                               ,
              'shape=mxgraph.aws4.auto_scaling2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_AutoScalingAWS19'
        shape :amazon_ec2container_registry_image_aws19                    ,
              'shape=mxgraph.aws4.container_registry_image;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2ContainerRegistry_ImageAWS19'
        shape :amazon_ec2container_registry_registry_aws19                 ,
              'shape=mxgraph.aws4.registry;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2ContainerRegistry_RegistryAWS19'
        shape :amazon_ec2_elastic_ipaddress_aws19                          ,
              'shape=mxgraph.aws4.elastic_ip_address;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_ElasticIPAddressAWS19'
        shape :amazon_ec2_rescue_aws19                                     , 'shape=mxgraph.aws4.rescue;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1',
              'AmazonEC2_RescueAWS19'
        shape :amazon_elastic_container_service_container1aws19            ,
              'shape=mxgraph.aws4.container_1;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1;pointerEvents=1', 'AmazonElasticContainerService_Container1AWS19'
        shape :amazon_elastic_container_service_container2aws19            ,
              'shape=mxgraph.aws4.container_2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticContainerService_Container2AWS19'
        shape :amazon_elastic_container_service_container3aws19            ,
              'shape=mxgraph.aws4.container_3;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticContainerService_Container3AWS19'
        shape :amazon_elastic_container_service_service_aws19              ,
              'shape=mxgraph.aws4.ecs_service;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticContainerService_ServiceAWS19'
        shape :amazon_elastic_container_service_task_aws19                 ,
              'shape=mxgraph.aws4.ecs_task;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticContainerService_TaskAWS19'
        shape :awselastic_beanstalk_application_aws19                      ,
              'shape=mxgraph.aws4.application;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSElasticBeanstalk_ApplicationAWS19'
        shape :awselastic_beanstalk_deployment_aws19                       ,
              'shape=mxgraph.aws4.deployment;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSElasticBeanstalk_DeploymentAWS19'
        shape :awslambda_lambda_function_aws19                             ,
              'shape=mxgraph.aws4.lambda_function;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSLambda_LambdaFunctionAWS19'
        shape :awsthinkbox_deadline_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_deadline;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxDeadlineAWS19'
        shape :awsthinkbox_draft_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_draft;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxDraftAWS19'
        shape :awsthinkbox_frost_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_frost;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxFrostAWS19'
        shape :awsthinkbox_krakatoa_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_krakatoa;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxKrakatoaAWS19'
        shape :awsthinkbox_sequoia_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_sequoia;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxSequoiaAWS19'
        shape :awsthinkbox_stoke_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_stoke;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxStokeAWS19'
        shape :awsthinkbox_xmesh_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.thinkbox_xmesh;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;;pointerEvents=1', 'AWSThinkboxXMeshAWS19'
      end
      section :aws_19___cost_management do
        shape :awscost_management_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cost_management;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'AWSCostManagementAWS19'
        shape :awsbudgets_aws19                                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.budgets;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSBudgetsAWS19'
        shape :awscostand_usage_report_aws19                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cost_and_usage_report;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCostandUsageReportAWS19'
        shape :awscost_explorer_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cost_explorer;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCostExplorerAWS19'
        shape :reserved_instance_reporting_aws19                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.reserved_instance_reporting;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'ReservedInstanceReportingAWS19'
      end
      section :aws_19___customer_engagement do
        shape :customer_engagement_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.customer_engagement;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'CustomerEngagementAWS19'
        shape :amazon_connect_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.connect;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonConnectAWS19'
        shape :amazon_pinpoint_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.pinpoint;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonPinpointAWS19'
        shape :amazon_simple_email_service_sesaws19                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.simple_email_service;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSimpleEmailServiceSESAWS19'
        shape :amazon_simple_email_service_ses_email_aws19                 , 'shape=mxgraph.aws4.email;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1',
              'AmazonSimpleEmailServiceSES_EmailAWS19'
      end
      section :aws_19___database do
        shape :database_aws19                                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.database;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'DatabaseAWS19'
        shape :amazon_aurora_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.aurora;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonAuroraAWS19'
        shape :amazon_document_dbwith_mongo_dbcompatibility_aws19          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.documentdb_with_mongodb_compatibility;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonDocumentDBwithMongoDBcompatibilityAWS19'
        shape :amazon_dynamo_dbaws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.dynamodb;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonDynamoDBAWS19'
        shape :amazon_elasti_cache_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elasticache;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElastiCacheAWS19'
        shape :amazon_neptune_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.neptune;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonNeptuneAWS19'
        shape :amazon_quantum_ledger_database_qldbaws19                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.quantum_ledger_database;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonQuantumLedgerDatabase_QLDBAWS19'
        shape :amazon_rdsaws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.rds;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonRDSAWS19'
        shape :amazon_rdson_vmware_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.rds_on_vmware;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonRDSonVMwareAWS19'
        shape :amazon_redshift_blue_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.redshift;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonRedshift_blueAWS19'
        shape :amazon_timestream_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.timestream;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonTimestreamAWS19'
        shape :awsdatabase_migration_service_aws19                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.database_migration_service;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDatabaseMigrationServiceAWS19'
        shape :amazon_dynamo_db_attribute_aws19                            ,
              'shape=mxgraph.aws4.attribute;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonDynamoDB_AttributeAWS19'
        shape :amazon_dynamo_db_attributes_aws19                           ,
              'shape=mxgraph.aws4.attributes;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonDynamoDB_AttributesAWS19'
        shape :amazon_dynamo_db_global_secondary_index_aws19               ,
              'shape=mxgraph.aws4.global_secondary_index;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonDynamoDB_GlobalSecondaryIndexAWS19'
        shape :amazon_dynamo_db_item_aws19                                 , 'shape=mxgraph.aws4.item;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1',
              'AmazonDynamoDB_ItemAWS19'
        shape :amazon_dynamo_db_items_aws19                                , 'shape=mxgraph.aws4.items;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1',
              'AmazonDynamoDB_ItemsAWS19'
        shape :amazon_dynamo_db_table_aws19                                , 'shape=mxgraph.aws4.table;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1',
              'AmazonDynamoDB_TableAWS19'
        shape :amazon_elasti_cache_cache_node_aws19                        ,
              'shape=mxgraph.aws4.cache_node;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElastiCache_CacheNodeAWS19'
        shape :amazon_elasti_cache_for_memcached_aws19                     ,
              'shape=mxgraph.aws4.elasticache_for_memcached;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElastiCache_ForMemcachedAWS19'
        shape :amazon_elasti_cache_for_redis_aws19                         ,
              'shape=mxgraph.aws4.elasticache_for_redis;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElastiCache_ForRedisAWS19'
        shape :amazon_redshift_dense_compute_node_blue_aws19               ,
              'shape=mxgraph.aws4.dense_compute_node;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRedshift_DenseComputeNode_blueAWS19'
        shape :amazon_redshift_dense_storage_node_blue_aws19               ,
              'shape=mxgraph.aws4.dense_storage_node;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRedshift_DenseStorageNode_blueAWS19'
        shape :awsdatabase_migration_service_database_migration_workflow_aws19,
              'shape=mxgraph.aws4.database_migration_workflow_job;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSDatabaseMigrationService_DatabaseMigrationWorkflowAWS19'
        shape :amazon_dynamo_dbdaxaws19                                    ,
              'shape=mxgraph.aws4.dynamodb_dax;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonDynamoDBDAXAWS19'
      end
      section :aws_19___desktop_app_streaming do
        shape :desktopand_app_streaming_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.desktop_and_app_streaming;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'DesktopandAppStreamingAWS19'
        shape :amazon_appstream2aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.appstream_20;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonAppstream2AWS19'
        shape :amazon_workspaces_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.workspaces;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonWorkspacesAWS19'
      end
      section :aws_19___developer_tools do
        shape :developer_tools_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.developer_tools;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'DeveloperToolsAWS19'
        shape :awscloud9aws19                                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloud9;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCloud9AWS19'
        shape :awscode_build_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.codebuild;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCodeBuildAWS19'
        shape :awscode_commit_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.codecommit;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCodeCommitAWS19'
        shape :awscode_deploy_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.codedeploy;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCodeDeployAWS19'
        shape :awscode_pipeline_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.codepipeline;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCodePipelineAWS19'
        shape :awscode_star_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.codestar;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCodeStarAWS19'
        shape :awscommand_line_interface_aws19                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.command_line_interface;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCommandLineInterfaceAWS19'
        shape :awstools_and_sdks_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.tools_and_sdks;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSToolsAndSDKsAWS19'
        shape :awsxray_aws19                                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.xray;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSXRayAWS19'
        shape :awscloud_development_kit_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloud_development_kit;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCloudDevelopmentKitAWS19'
      end
      section :aws_19___ec2_instance_types do
        shape :amazon_ec2_instance_aws19                                   ,
              'shape=mxgraph.aws4.instance2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_InstanceAWS19'
        shape :amazon_ec2_instances_aws19                                  ,
              'shape=mxgraph.aws4.instances;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_InstancesAWS19'
        shape :amazon_ec2_instancewith_cloud_watch_aws19                   ,
              'shape=mxgraph.aws4.instance_with_cloudwatch2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_InstancewithCloudWatchAWS19'
        shape :amazon_ec2_dbon_instance_aws19                              ,
              'shape=mxgraph.aws4.db_on_instance2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_DBonInstanceAWS19'
        shape :amazon_ec2_spot_instance_aws19                              ,
              'shape=mxgraph.aws4.spot_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_SpotInstanceAWS19'
        shape :amazon_ec2_high_memory_instance_aws19                       ,
              'shape=mxgraph.aws4.high_memory_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_HighMemoryInstanceAWS19'
        shape :amazon_ec2_a1instance_aws19                                 ,
              'shape=mxgraph.aws4.a1_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_A1InstanceAWS19'
        shape :amazon_ec2_optimized_instance_aws19                         ,
              'shape=mxgraph.aws4.optimized_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_OptimizedInstanceAWS19'
        shape :amazon_ec2_c4instance_aws19                                 ,
              'shape=mxgraph.aws4.c4_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_C4InstanceAWS19'
        shape :amazon_ec2_c5instance_aws19                                 ,
              'shape=mxgraph.aws4.c5_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_C5InstanceAWS19'
        shape :amazon_ec2_c5n_instance_aws19                               ,
              'shape=mxgraph.aws4.c5n_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_C5nInstanceAWS19'
        shape :amazon_ec2_d2instance_aws19                                 ,
              'shape=mxgraph.aws4.d2_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_D2InstanceAWS19'
        shape :amazon_ec2_f1instance_aws19                                 ,
              'shape=mxgraph.aws4.f1_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_F1InstanceAWS19'
        shape :amazon_ec2_g3instance_aws19                                 ,
              'shape=mxgraph.aws4.g3_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_G3InstanceAWS19'
        shape :amazon_ec2_h1instance_aws19                                 ,
              'shape=mxgraph.aws4.h1_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_H1InstanceAWS19'
        shape :amazon_ec2_i3instance_aws19                                 ,
              'shape=mxgraph.aws4.i3_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_I3InstanceAWS19'
        shape :amazon_ec2_m4instance_aws19                                 ,
              'shape=mxgraph.aws4.m4_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_M4InstanceAWS19'
        shape :amazon_ec2_m5a_instance_aws19                               ,
              'shape=mxgraph.aws4.m5a_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_M5aInstanceAWS19'
        shape :amazon_ec2_m5instance_aws19                                 ,
              'shape=mxgraph.aws4.m5_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_M5InstanceAWS19'
        shape :amazon_ec2_p2instance_aws19                                 ,
              'shape=mxgraph.aws4.p2_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_P2InstanceAWS19'
        shape :amazon_ec2_p3instance_aws19                                 ,
              'shape=mxgraph.aws4.p3_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_P3InstanceAWS19'
        shape :amazon_ec2_r4instance_aws19                                 ,
              'shape=mxgraph.aws4.r4_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_R4InstanceAWS19'
        shape :amazon_ec2_r5a_instance_aws19                               ,
              'shape=mxgraph.aws4.r5a_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_R5aInstanceAWS19'
        shape :amazon_ec2_r5instance_aws19                                 ,
              'shape=mxgraph.aws4.r5_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_R5InstanceAWS19'
        shape :amazon_ec2_t2instance_aws19                                 ,
              'shape=mxgraph.aws4.t2_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_T2InstanceAWS19'
        shape :amazon_ec2_t3a_instance_aws19                               ,
              'shape=mxgraph.aws4.t3a_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_T3aInstanceAWS19'
        shape :amazon_ec2_t3instance_aws19                                 ,
              'shape=mxgraph.aws4.t3_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_T3InstanceAWS19'
        shape :amazon_ec2_x1e_instance_aws19                               ,
              'shape=mxgraph.aws4.x1e_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_X1eInstanceAWS19'
        shape :amazon_ec2_x1instance_aws19                                 ,
              'shape=mxgraph.aws4.x1_instance2;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_X1InstanceAWS19'
        shape :amazon_ec2_z1d_instance_aws19                               ,
              'shape=mxgraph.aws4.z1d_instance;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonEC2_z1dInstanceAWS19'
        shape :amazon_work_link_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.worklink;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonWorkLinkAWS19'
      end
      section :aws_19___game_tech do
        shape :game_tech_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.game_tech;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'GameTechAWS19'
        shape :amazon_game_lift_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.gamelift;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonGameLiftAWS19'
      end
      section :aws_19___general do
        shape :awsmarketplace_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.marketplace;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSMarketplaceAWS19'
        shape :awsgeneral_awscloud_aws19                                   ,
              'shape=mxgraph.aws4.aws_cloud;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_AWSCloudAWS19'
        shape :awsgeneral_corporate_data_center_aws19                      ,
              'shape=mxgraph.aws4.corporate_data_center;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_CorporateDataCenterAWS19'
        shape :awsgeneral_disk_aws19                                       ,
              'shape=mxgraph.aws4.disk;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_DiskAWS19'
        shape :awsgeneral_forums_aws19                                     ,
              'shape=mxgraph.aws4.forums;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_ForumsAWS19'
        shape :awsgeneral_generic_database_aws19                           ,
              'shape=mxgraph.aws4.generic_database;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_GenericDatabaseAWS19'
        shape :awsgeneral_internet_alt1aws19                               ,
              'shape=mxgraph.aws4.internet;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_InternetAlt1AWS19'
        shape :awsgeneral_internet_alt2aws19                               ,
              'shape=mxgraph.aws4.internet_alt1;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_InternetAlt2AWS19'
        shape :awsgeneral_internet_gateway_aws19                           ,
              'shape=mxgraph.aws4.internet_alt2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_InternetGatewayAWS19'
        shape :awsgeneral_mobile_client_aws19                              ,
              'shape=mxgraph.aws4.mobile_client;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_MobileClientAWS19'
        shape :awsgeneral_multimedia_aws19                                 ,
              'shape=mxgraph.aws4.multimedia;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_MultimediaAWS19'
        shape :awsgeneral_office_building_aws19                            ,
              'shape=mxgraph.aws4.office_building;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_OfficeBuildingAWS19'
        shape :awsgeneral_samltoken_aws19                                  ,
              'shape=mxgraph.aws4.saml_token;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_SAMLTokenAWS19'
        shape :awsgeneral_sdkaws19                                         ,
              'shape=mxgraph.aws4.external_sdk;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_SDKAWS19'
        shape :awsgeneral_sslpadlock_aws19                                 ,
              'shape=mxgraph.aws4.ssl_padlock;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_SSLPadlockAWS19'
        shape :awsgeneral_tape_storage_aws19                               ,
              'shape=mxgraph.aws4.tape_storage;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_TapeStorageAWS19'
        shape :awsgeneral_toolkit_aws19                                    ,
              'shape=mxgraph.aws4.external_toolkit;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_ToolkitAWS19'
        shape :awsgeneral_traditional_server_aws19                         ,
              'shape=mxgraph.aws4.traditional_server;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_TraditionalServerAWS19'
        shape :awsgeneral_user_aws19                                       ,
              'shape=mxgraph.aws4.user;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_UserAWS19'
        shape :awsgeneral_users_aws19                                      ,
              'shape=mxgraph.aws4.users;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_UsersAWS19'
        shape :awsgeneral_virtual_private_cloud_aws19                      ,
              'shape=mxgraph.aws4.virtual_private_cloud;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSGeneral_VirtualPrivateCloudAWS19'
        shape :client_aws19                                                ,
              'shape=mxgraph.aws4.client;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'ClientAWS19'
        shape :external_sdkaws19                                           ,
              'shape=mxgraph.aws4.external_sdk;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'External_SDKAWS19'
        shape :external_toolkit_aws19                                      ,
              'shape=mxgraph.aws4.external_toolkit;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'External_ToolkitAWS19'
      end
      section :aws_19___groups_note_repeated_below_without_v2 do
        shape :awscloud_aws19_v2                                           ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_cloud;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fillColor=none;#{containerStyle}", 'AWSCloudAWS19_v2'
        shape :awscloudalt_aws19_v2                                        ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_cloud_alt;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fillColor=none;#{containerStyle}", 'AWSCloudaltAWS19_v2'
        shape :region_aws19_v2                                             ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_region;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;dashed=1;fontColor=#0E82B8;fillColor=none;#{containerStyle}", 'RegionAWS19_v2'
        shape :availability_zone_aws19_v2                                  , "verticalAlign=top;fillColor=none;dashed=1;dashPattern=5 5;fontColor=#0E82B8;#{containerStyle}", 'AvailabilityZoneAWS19_v2'
        shape :securitygroup_aws19_v2                                      , "verticalAlign=top;fillColor=none;#{containerStyle}", 'SecuritygroupAWS19_v2'
        shape :auto_scaling_aws19_v2                                       ,
              "shape=mxgraph.aws4.groupCenter;grIcon=mxgraph.aws4.group_auto_scaling_group;grStroke=1;verticalAlign=top;fillColor=none;fontColor=#D75F17;spacingTop=25;fillColor=none;#{containerStyle}", 'AutoScalingAWS19_v2'
        shape :virtualprivatecloud_vpcaws19_v2                             ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_vpc;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#2C8723;fillColor=none;#{containerStyle}", 'VirtualprivatecloudVPCAWS19_v2'
        shape :private_subnet_aws19_v2                                     ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_security_group;grStroke=0;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;strokeColor=#0E82B8;fillColor=none;#{containerStyle}", 'PrivateSubnetAWS19_v2'
        shape :public_subnet_aws19_v2                                      ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_security_group;grStroke=0;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;strokeColor=#2C8723;fontColor=#2C8723;fillColor=none;#{containerStyle}", 'PublicSubnetAWS19_v2'
        shape :servercontents_aws19_v2                                     ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_on_premise;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#5A6C86;fillColor=none;#{containerStyle}", 'ServercontentsAWS19_v2'
        shape :corporatedatacenter_aws19_v2                                ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_corporate_data_center;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#5A6C86;fillColor=none;#{containerStyle}", 'CorporatedatacenterAWS19_v2'
        shape :elastic_beanstalkcontainer_aws19_v2                         ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_elastic_beanstalk;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#D75F17;fillColor=none;#{containerStyle}", 'ElasticBeanstalkcontainerAWS19_v2'
        shape :ec2instancecontents_aws19_v2                                ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_ec2_instance_contents;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#D75F17;fillColor=none;#{containerStyle}", 'EC2instancecontentsAWS19_v2'
        shape :spot_fleet_aws19_v2                                         ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_spot_fleet;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#D75F17;fillColor=none;#{containerStyle}", 'SpotFleetAWS19_v2'
        shape :awsstep_function_aws19_v2                                   ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_step_functions_workflow;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#CB1261;fillColor=none;#{containerStyle}", 'AWSStepFunctionAWS19_v2'
        shape :generic_group1aws19_v2                                      ,
              "verticalAlign=top;align=center;fillColor=none;dashed=1;dashPattern=5 5;strokeColor=#5A6C86;fontColor=#5A6C86;#{containerStyle}", 'GenericGroup1AWS19_v2'
        shape :generic_group2aws19_v2                                      , "verticalAlign=top;align=center;container=1;pointerEvents=0;collapsible=0;recursiveResize=0;#{containerStyle}",
              'GenericGroup2AWS19_v2'
      end
      section :repeated_from_the_above do
        shape :awscloud_aws19                                              ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_cloud;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fillColor=none;#{containerStyle}", 'AWSCloudAWS19'
        shape :awscloudalt_aws19                                           ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_cloud_alt;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fillColor=none;#{containerStyle}", 'AWSCloudaltAWS19'
        shape :region_aws19                                                ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_region;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;dashed=1;fontColor=#0E82B8;fillColor=none;#{containerStyle}", 'RegionAWS19'
        shape :availability_zone_aws19                                     ,
              "verticalAlign=top;fillColor=none;dashed=1;dashPattern=5 5;fontColor=#0E82B8;strokeOpacity=100;strokeColor=#147eba;#{containerStyle}", 'AvailabilityZoneAWS19'
        shape :securitygroup_aws19                                         , "verticalAlign=top;fillColor=none;fontColor=#DD3522;#{containerStyle}", 'SecuritygroupAWS19'
        shape :auto_scaling_aws19                                          ,
              "shape=mxgraph.aws4.groupCenter;grIcon=mxgraph.aws4.group_auto_scaling_group;grStroke=1;verticalAlign=top;fillColor=none;fontColor=#D75F17;spacingTop=25;fillColor=none;#{containerStyle}", 'AutoScalingAWS19'
        shape :virtualprivatecloud_vpcaws19                                ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_vpc;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#2C8723;fillColor=none;#{containerStyle}", 'VirtualprivatecloudVPCAWS19'
        shape :private_subnet_aws19                                        ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_security_group;grStroke=0;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;strokeColor=#0E82B8;fontColor=#0E82B8;fillOpacity=13;fillColor=#147eba;#{containerStyle}", 'PrivateSubnetAWS19'
        shape :public_subnet_aws19                                         ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_security_group;grStroke=0;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;strokeColor=#2C8723;fontColor=#2C8723;fillOpacity=13;fillColor=#248814;#{containerStyle}", 'PublicSubnetAWS19'
        shape :servercontents_aws19                                        ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_on_premise;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#5A6C86;fillColor=none;#{containerStyle}", 'ServercontentsAWS19'
        shape :corporatedatacenter_aws19                                   ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_corporate_data_center;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#5A6C86;fillColor=none;#{containerStyle}", 'CorporatedatacenterAWS19'
        shape :elastic_beanstalkcontainer_aws19                            ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_elastic_beanstalk;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#D75F17;fillColor=none;#{containerStyle}", 'ElasticBeanstalkcontainerAWS19'
        shape :ec2instancecontents_aws19                                   ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_ec2_instance_contents;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#D75F17;fillColor=none;#{containerStyle}", 'EC2instancecontentsAWS19'
        shape :spot_fleet_aws19                                            ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_spot_fleet;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#D75F17;fillColor=none;#{containerStyle}", 'SpotFleetAWS19'
        shape :awsstep_function_aws19                                      ,
              "shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_step_functions_workflow;verticalAlign=top;align=left;grIconSize=40;spacingLeft=45;spacingTop=5;fontColor=#CB1261;fillColor=none;#{containerStyle}", 'AWSStepFunctionAWS19'
        shape :generic_group1aws19                                         ,
              "verticalAlign=top;align=center;fillColor=none;dashed=1;dashPattern=5 5;strokeColor=#5A6C86;fontColor=#5A6C86;#{containerStyle}", 'GenericGroup1AWS19'
        shape :generic_group2aws19                                         , "verticalAlign=top;align=center;fillColor=#EAECEF;#{containerStyle}", 'GenericGroup2AWS19'
      end
      section :aws_19___internet_of_things do
        shape :internetof_things_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.internet_of_things;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'InternetofThingsAWS19'
        shape :amazon_free_rtoslightbg_aws19                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.freertos;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonFreeRTOSlightbgAWS19'
        shape :awsio_t1click_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_1click;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoT1ClickAWS19'
        shape :awsio_tbutton_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_button;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTButtonAWS19'
        shape :awsio_tcore_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_core;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTCoreAWS19'
        shape :awsio_tdevice_defender_aws19                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_device_defender;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTDeviceDefenderAWS19'
        shape :awsio_tdevice_management_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_device_management;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTDeviceManagementAWS19'
        shape :awsio_tevents_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_events;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTEventsAWS19'
        shape :awsio_tgreengrass_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.greengrass;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTGreengrassAWS19'
        shape :awsio_tsite_wise_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_sitewise;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTSiteWiseAWS19'
        shape :awsio_tthings_graph_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_things_graph;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTThingsGraphAWS19'
        shape :awsio_tanalytics_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.iot_analytics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIoTAnalyticsAWS19'
        shape :awsio_tanalytics_channel_aws19                              ,
              'shape=mxgraph.aws4.iot_analytics_channel;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIoTAnalytics_ChannelAWS19'
        shape :awsio_tanalytics_data_store_aws19                           ,
              'shape=mxgraph.aws4.iot_analytics_data_store;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIoTAnalytics_DataStoreAWS19'
        shape :awsio_tanalytics_pipeline_aws19                             ,
              'shape=mxgraph.aws4.iot_analytics_pipeline;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIoTAnalytics_PipelineAWS19'
        shape :io_t_action_aws19                                           ,
              'shape=mxgraph.aws4.action;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_ActionAWS19'
        shape :io_t_actuator_aws19                                         ,
              'shape=mxgraph.aws4.actuator;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_ActuatorAWS19'
        shape :io_t_alexa_enabled_device_aws19                             ,
              'shape=mxgraph.aws4.alexa_enabled_device;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_AlexaEnabledDeviceAWS19'
        shape :io_t_alexa_skill_aws19                                      ,
              'shape=mxgraph.aws4.alexa_skill;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_AlexaSkillAWS19'
        shape :io_t_alexa_voice_service_aws19                              ,
              'shape=mxgraph.aws4.alexa_skill;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_AlexaVoiceServiceAWS19'
        shape :io_t_bank_aws19                                             ,
              'shape=mxgraph.aws4.bank;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_BankAWS19'
        shape :io_t_bicycle_aws19                                          ,
              'shape=mxgraph.aws4.bycicle;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_BicycleAWS19'
        shape :io_t_camera_aws19                                           ,
              'shape=mxgraph.aws4.camera;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_CameraAWS19'
        shape :io_t_car_aws19                                              ,
              'shape=mxgraph.aws4.car;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_CarAWS19'
        shape :io_t_cart_aws19                                             ,
              'shape=mxgraph.aws4.cart;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_CartAWS19'
        shape :io_t_certificate_manager_aws19                              ,
              'shape=mxgraph.aws4.certificate_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_CertificateManagerAWS19'
        shape :io_t_coffee_pot_aws19                                       ,
              'shape=mxgraph.aws4.coffee_pot;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_CoffeePotAWS19'
        shape :io_t_desired_state_aws19                                    ,
              'shape=mxgraph.aws4.desired_state;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_DesiredStateAWS19'
        shape :io_t_device_gateway_aws19                                   ,
              'shape=mxgraph.aws4.iot_device_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_DeviceGatewayAWS19'
        shape :io_t_door_lock_aws19                                        ,
              'shape=mxgraph.aws4.door_lock;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_DoorLockAWS19'
        shape :io_t_echo_aws19                                             ,
              'shape=mxgraph.aws4.echo;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_EchoAWS19'
        shape :io_t_factory_aws19                                          ,
              'shape=mxgraph.aws4.factory;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_FactoryAWS19'
        shape :io_t_fire_tvaws19                                           ,
              'shape=mxgraph.aws4.firetv;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_FireTVAWS19'
        shape :io_t_fire_tvstick_aws19                                     ,
              'shape=mxgraph.aws4.firetv_stick;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_FireTVStickAWS19'
        shape :io_t_generic_aws19                                          ,
              'shape=mxgraph.aws4.generic;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_GenericAWS19'
        shape :io_t_hardware_board_aws19                                   ,
              'shape=mxgraph.aws4.hardware_board;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_HardwareBoardAWS19'
        shape :io_t_house_aws19                                            ,
              'shape=mxgraph.aws4.house;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_HouseAWS19'
        shape :io_t_http2protocol_aws19                                    ,
              'shape=mxgraph.aws4.http2_protocol;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_HTTP2ProtocolAWS19'
        shape :io_t_httpprotocol_aws19                                     ,
              'shape=mxgraph.aws4.http_protocol;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_HTTPProtocolAWS19'
        shape :io_t_lambda_function_aws19                                  ,
              'shape=mxgraph.aws4.lambda_function;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_LambdaFunctionAWS19'
        shape :io_t_lightbulb_aws19                                        ,
              'shape=mxgraph.aws4.lightbulb;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_LightbulbAWS19'
        shape :io_t_medical_emergency_aws19                                ,
              'shape=mxgraph.aws4.medical_emergency;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_MedicalEmergencyAWS19'
        shape :io_t_mqttprotocol_aws19                                     ,
              'shape=mxgraph.aws4.mqtt_protocol;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_MQTTProtocolAWS19'
        shape :io_t_over_the_air_update_aws19                              ,
              'shape=mxgraph.aws4.iot_over_the_air_update;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_OverTheAirUpdateAWS19'
        shape :io_t_police_emergency_aws19                                 ,
              'shape=mxgraph.aws4.police_emergency;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_PoliceEmergencyAWS19'
        shape :io_t_policy_aws19                                           ,
              'shape=mxgraph.aws4.policy;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_PolicyAWS19'
        shape :io_t_reported_state_aws19                                   ,
              'shape=mxgraph.aws4.reported_state;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_ReportedStateAWS19'
        shape :io_t_rule_aws19                                             ,
              'shape=mxgraph.aws4.rule;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_RuleAWS19'
        shape :io_t_sensor_aws19                                           ,
              'shape=mxgraph.aws4.sensor;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_SensorAWS19'
        shape :io_t_servo_aws19                                            ,
              'shape=mxgraph.aws4.servo;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_ServoAWS19'
        shape :io_t_shadow_aws19                                           ,
              'shape=mxgraph.aws4.shadow;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_ShadowAWS19'
        shape :io_t_simulator_aws19                                        ,
              'shape=mxgraph.aws4.simulator;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_SimulatorAWS19'
        shape :io_t_thermostat_aws19                                       ,
              'shape=mxgraph.aws4.thermostat;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_ThermostatAWS19'
        shape :io_t_topic_aws19                                            ,
              'shape=mxgraph.aws4.topic_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_TopicAWS19'
        shape :io_t_travel_aws19                                           ,
              'shape=mxgraph.aws4.travel;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_TravelAWS19'
        shape :io_t_utility_aws19                                          ,
              'shape=mxgraph.aws4.utility;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_UtilityAWS19'
        shape :io_t_windfarm_aws19                                         ,
              'shape=mxgraph.aws4.windfarm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'IoT_WindfarmAWS19'
        shape :awsio_tgreengrass_connector_aws19                           ,
              'shape=mxgraph.aws4.connector;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIoTGreengrass_ConnectorAWS19'
        shape :awsio_tanalytics_data_set_aws19                             ,
              'shape=mxgraph.aws4.data_set;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIoTAnalytics_DataSetAWS19'
        shape :awsio_tanalytics_notebook_aws19                             ,
              'shape=mxgraph.aws4.notebook;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIoTAnalytics_NotebookAWS19'
      end
      section :aws_19___machine_learning do
        shape :machine_learning_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.machine_learning;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'MachineLearningAWS19'
        shape :amazon_comprehend_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.comprehend;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonComprehendAWS19'
        shape :amazon_elastic_inference_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_inference;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticInferenceAWS19'
        shape :amazon_forecast_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.forecast;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonForecastAWS19'
        shape :amazon_lex_aws19                                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.lex;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonLexAWS19'
        shape :amazon_personalize_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.personalize;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonPersonalizeAWS19'
        shape :amazon_polly_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.polly;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonPollyAWS19'
        shape :amazon_rekognition_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.rekognition;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonRekognitionAWS19'
        shape :amazon_sage_maker_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sagemaker;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSageMakerAWS19'
        shape :amazon_sage_maker_ground_truth_aws19                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sagemaker_ground_truth;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSageMakerGroundTruthAWS19'
        shape :amazon_textract_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.textract;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonTextractAWS19'
        shape :amazon_transcribe_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.transcribe;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonTranscribeAWS19'
        shape :amazon_translate_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.translate;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonTranslateAWS19'
        shape :apache_mxneton_awsaws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.apache_mxnet_on_aws;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'ApacheMXNetonAWSAWS19'
        shape :awsdeep_learning_amis_aws19                                 ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.deep_learning_amis;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDeepLearningAMIsAWS19'
        shape :awsdeep_lens_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.deeplens;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDeepLensAWS19'
        shape :awsdeep_racer_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.deepracer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDeepRacerAWS19'
        shape :tensor_flowon_awsaws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.tensorflow_on_aws;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'TensorFlowonAWSAWS19'
        shape :amazon_sage_maker_model_aws19                               ,
              'shape=mxgraph.aws4.sagemaker_model;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSageMaker_ModelAWS19'
        shape :amazon_sage_maker_notebook_aws19                            ,
              'shape=mxgraph.aws4.sagemaker_notebook;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSageMaker_NotebookAWS19'
        shape :amazon_sage_maker_train_aws19                               ,
              'shape=mxgraph.aws4.sagemaker_train;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSageMaker_TrainAWS19'
        shape :amazon_rekognition_image_aws19                              ,
              'shape=mxgraph.aws4.rekognition_image;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRekognition_ImageAWS19'
        shape :amazon_rekognition_video_aws19                              ,
              'shape=mxgraph.aws4.rekognition_video;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRekognition_VideoAWS19'
        shape :awsdeep_learning_containers_aws19                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.deep_learning_containers;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDeepLearningContainersAWS19'
      end
      section :aws_19___management_governance do
        shape :managementand_governance_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.management_and_governance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'ManagementandGovernanceAWS19'
        shape :amazon_cloud_watch_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloudwatch;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonCloudWatchAWS19'
        shape :awsauto_scaling_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.autoscaling;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSAutoScalingAWS19'
        shape :awscloud_formation_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloudformation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCloudFormationAWS19'
        shape :awscloud_trail_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloudtrail;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCloudTrailAWS19'
        shape :awscommand_line_interface_pink_aws19                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.command_line_interface;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCommandLineInterface_pinkAWS19'
        shape :awsconfig_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.config;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSConfigAWS19'
        shape :awscontrol_tower_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.control_tower;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSControlTowerAWS19'
        shape :awslicense_manager_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.license_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSLicenseManagerAWS19'
        shape :awsmanaged_services_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.managed_services;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSManagedServicesAWS19'
        shape :awsmanagement_console_aws19                                 ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.management_console;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSManagementConsoleAWS19'
        shape :awsops_works_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.opsworks;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSOpsWorksAWS19'
        shape :awspersonal_health_dashboard_aws19                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.personal_health_dashboard;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSPersonalHealthDashboardAWS19'
        shape :awsservice_catalog_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.service_catalog;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSServiceCatalogAWS19'
        shape :awssystems_manager_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.systems_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSystemsManagerAWS19'
        shape :awstrusted_advisor_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.trusted_advisor;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSTrustedAdvisorAWS19'
        shape :awswell_architected_tool_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.well_architected_tool;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSWellArchitectedToolAWS19'
        shape :amazon_cloud_watch_alarm_aws19                              ,
              'shape=mxgraph.aws4.alarm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudWatch_AlarmAWS19'
        shape :amazon_cloud_watch_event_event_based_aws19                  ,
              'shape=mxgraph.aws4.event_event_based;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudWatch_EventEventBasedAWS19'
        shape :amazon_cloud_watch_event_time_based_aws19                   ,
              'shape=mxgraph.aws4.event_time_based;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudWatch_EventTimeBasedAWS19'
        shape :amazon_cloud_watch_rule_aws19                               ,
              'shape=mxgraph.aws4.rule_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudWatch_RuleAWS19'
        shape :awscloud_formation_change_set_aws19                         ,
              'shape=mxgraph.aws4.change_set;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSCloudFormation_ChangeSetAWS19'
        shape :awscloud_formation_stack_aws19                              ,
              'shape=mxgraph.aws4.stack;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSCloudFormation_StackAWS19'
        shape :awscloud_formation_template_aws19                           ,
              'shape=mxgraph.aws4.template;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSCloudFormation_TemplateAWS19'
        shape :awsops_works_apps_aws19                                     ,
              'shape=mxgraph.aws4.opsworks_apps;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_AppsAWS19'
        shape :awsops_works_deployments_aws19                              ,
              'shape=mxgraph.aws4.deployments;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_DeploymentsAWS19'
        shape :awsops_works_instances_aws19                                ,
              'shape=mxgraph.aws4.instances_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_InstancesAWS19'
        shape :awsops_works_layers_aws19                                   ,
              'shape=mxgraph.aws4.layers;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_LayersAWS19'
        shape :awsops_works_monitoring_aws19                               ,
              'shape=mxgraph.aws4.monitoring;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_MonitoringAWS19'
        shape :awsops_works_permissions_aws19                              ,
              'shape=mxgraph.aws4.opsworks_permissions;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_PermissionsAWS19'
        shape :awsops_works_resources_aws19                                ,
              'shape=mxgraph.aws4.resources;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_ResourcesAWS19'
        shape :awsops_works_stack2aws19                                    ,
              'shape=mxgraph.aws4.stack2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOpsWorks_Stack2AWS19'
        shape :awssystems_manager_automation_aws19                         ,
              'shape=mxgraph.aws4.automation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_AutomationAWS19'
        shape :awssystems_manager_documents_aws19                          ,
              'shape=mxgraph.aws4.documents;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_DocumentsAWS19'
        shape :awssystems_manager_inventory_aws19                          ,
              'shape=mxgraph.aws4.inventory;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_InventoryAWS19'
        shape :awssystems_manager_maintenance_windows_aws19                ,
              'shape=mxgraph.aws4.maintenance_windows;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_MaintenanceWindowsAWS19'
        shape :awssystems_manager_parameter_store_aws19                    ,
              'shape=mxgraph.aws4.parameter_store;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_ParameterStoreAWS19'
        shape :awssystems_manager_patch_manager_aws19                      ,
              'shape=mxgraph.aws4.patch_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_PatchManagerAWS19'
        shape :awssystems_manager_run_command_aws19                        ,
              'shape=mxgraph.aws4.run_command;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_RunCommandAWS19'
        shape :awssystems_manager_state_manager_aws19                      ,
              'shape=mxgraph.aws4.state_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManager_StateManagerAWS19'
        shape :awstrusted_advisor_checklist_aws19                          ,
              'shape=mxgraph.aws4.checklist;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSTrustedAdvisor_ChecklistAWS19'
        shape :awstrusted_advisor_checklist_cost_aws19                     ,
              'shape=mxgraph.aws4.checklist_cost;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSTrustedAdvisor_ChecklistCostAWS19'
        shape :awstrusted_advisor_checklist_fault_tolerant_aws19           ,
              'shape=mxgraph.aws4.checklist_fault_tolerant;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSTrustedAdvisor_ChecklistFaultTolerantAWS19'
        shape :awstrusted_advisor_checklist_performance_aws19              ,
              'shape=mxgraph.aws4.checklist_performance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSTrustedAdvisor_ChecklistPerformanceAWS19'
        shape :awstrusted_advisor_checklist_security_aws19                 ,
              'shape=mxgraph.aws4.checklist_security;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSTrustedAdvisor_ChecklistSecurityAWS19'
        shape :awsorganizations_aws19_v2                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.organizations;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSOrganizationsAWS19_v2'
        shape :awssystems_manager_ops_center_aws19                         ,
              'shape=mxgraph.aws4.systems_manager_opscenter;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSystemsManagerOpsCenterAWS19'
      end
      section :aws_19___media_services do
        shape :media_services_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.media_services;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'MediaServicesAWS19'
        shape :amazon_elastic_transcoder_aws19                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_transcoder;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticTranscoderAWS19'
        shape :amazon_kinesis_video_streams_orange_aws19                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.kinesis_video_streams;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonKinesisVideoStreams_orangeAWS19'
        shape :awselemental_media_connect_aws19                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental_mediaconnect;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalMediaConnectAWS19'
        shape :awselemental_media_convert_aws19                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental_mediaconvert;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalMediaConvertAWS19'
        shape :awselemental_media_live_aws19                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental_medialive;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalMediaLiveAWS19'
        shape :awselemental_media_package_aws19                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental_mediapackage;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalMediaPackageAWS19'
        shape :awselemental_media_store_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental_mediastore;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalMediaStoreAWS19'
        shape :awselemental_media_tailor_aws19                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elemental_mediatailor;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSElementalMediaTailorAWS19'
      end
      section :aws_19___migration_transfer do
        shape :migrationand_transfer_aws19                                 ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.migration_and_transfer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'MigrationandTransferAWS19'
        shape :awsapplication_discovery_service_aws19                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.application_discovery_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSApplicationDiscoveryServiceAWS19'
        shape :awsdatabase_migration_service_green_aws19                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.database_migration_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDatabaseMigrationService_greenAWS19'
        shape :awsdata_sync_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.datasync;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDataSyncAWS19'
        shape :awsmigration_hub_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.migration_hub;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSMigrationHubAWS19'
        shape :awsserver_migration_service_aws19                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.server_migration_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSServerMigrationServiceAWS19'
        shape :awssnowball_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.snowball;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSnowballAWS19'
        shape :awssnowball_edge_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.snowball_edge;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSnowballEdgeAWS19'
        shape :awssnowmobile_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.snowmobile;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSnowmobileAWS19'
        shape :awstransferfor_sftpaws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.transfer_for_sftp;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSTransferforSFTPAWS19'
        shape :awsdata_sync_agent_aws19                                    ,
              'shape=mxgraph.aws4.agent2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSDataSync_AgentAWS19'
      end
      section :aws_19___mobile do
        shape :mobile_aws19                                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.mobile;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'MobileAWS19'
        shape :amazon_apigateway_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.api_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonAPIGatewayAWS19'
        shape :amazon_pinpoint_red_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.pinpoint;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonPinpoint_redAWS19'
        shape :awsamplify_aws19                                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.amplify;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSAmplifyAWS19'
        shape :awsapp_sync_red_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.appsync;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSAppSync_redAWS19'
        shape :awsdevice_farm_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.device_farm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDeviceFarmAWS19'
      end
      section :aws_19___networking_content_delivery do
        shape :networkingand_content_delivery_aws19                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.networking_and_content_delivery;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'NetworkingandContentDeliveryAWS19'
        shape :amazon_apigateway_purple_aws19                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.api_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonAPIGateway_purpleAWS19'
        shape :amazon_cloud_front_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloudfront;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonCloudFrontAWS19'
        shape :amazon_route53aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.route_53;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonRoute53AWS19'
        shape :amazon_vpcaws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.vpc;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonVPCAWS19'
        shape :amazon_vpcprivate_link_aws19                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.vpc_privatelink;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonVPCPrivateLinkAWS19'
        shape :awsapp_mesh_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.app_mesh;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSAppMeshAWS19'
        shape :awsclient_vpnaws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.client_vpn;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSClientVPNAWS19'
        shape :awscloud_map_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloud_map;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCloudMapAWS19'
        shape :awsdirect_connect_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.direct_connect;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDirectConnectAWS19'
        shape :awsglobal_accelerator_aws19                                 ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.global_accelerator;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSGlobalAcceleratorAWS19'
        shape :awstransit_gateway_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.transit_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSTransitGatewayAWS19'
        shape :amazon_cloud_front_download_distribution_aws19              ,
              'shape=mxgraph.aws4.download_distribution;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudFront_DownloadDistributionAWS19'
        shape :amazon_cloud_front_edge_location_aws19                      ,
              'shape=mxgraph.aws4.edge_location;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudFront_EdgeLocationAWS19'
        shape :amazon_cloud_front_streaming_distribution_aws19             ,
              'shape=mxgraph.aws4.streaming_distribution;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonCloudFront_StreamingDistributionAWS19'
        shape :amazon_route53_hosted_zone_aws19                            ,
              'shape=mxgraph.aws4.hosted_zone;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRoute53_HostedZoneAWS19'
        shape :amazon_route53_route_table_aws19                            ,
              'shape=mxgraph.aws4.route_table;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonRoute53_RouteTableAWS19'
        shape :amazon_vpc_customer_gateway_aws19                           ,
              'shape=mxgraph.aws4.customer_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_CustomerGatewayAWS19'
        shape :amazon_vpc_elastic_network_adapter_aws19                    ,
              'shape=mxgraph.aws4.elastic_network_adapter;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_ElasticNetworkAdapterAWS19'
        shape :amazon_vpc_elastic_network_interface_aws19                  ,
              'shape=mxgraph.aws4.elastic_network_interface;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_ElasticNetworkInterfaceAWS19'
        shape :amazon_vpc_endpoints_aws19                                  ,
              'shape=mxgraph.aws4.endpoints;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_EndpointsAWS19'
        shape :amazon_vpc_flow_logs_aws19                                  ,
              'shape=mxgraph.aws4.flow_logs;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_FlowLogsAWS19'
        shape :amazon_vpc_internet_gateway_aws19                           ,
              'shape=mxgraph.aws4.internet_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_InternetGatewayAWS19'
        shape :amazon_vpc_natgateway_aws19                                 ,
              'shape=mxgraph.aws4.nat_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_NATGatewayAWS19'
        shape :amazon_vpc_network_access_control_list_aws19                ,
              'shape=mxgraph.aws4.network_access_control_list;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_NetworkAccessControlListAWS19'
        shape :amazon_vpc_peering_aws19                                    ,
              'shape=mxgraph.aws4.peering;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_PeeringAWS19'
        shape :amazon_vpc_router_aws19                                     ,
              'shape=mxgraph.aws4.router;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_RouterAWS19'
        shape :amazon_vpc_vpnconnection_aws19                              ,
              'shape=mxgraph.aws4.vpn_connection;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_VPNConnectionAWS19'
        shape :amazon_vpc_vpngateway_aws19                                 ,
              'shape=mxgraph.aws4.vpn_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPC_VPNGatewayAWS19'
        shape :amazon_networking_apigateway_endpoint_aws19                 ,
              'shape=mxgraph.aws4.endpoint;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonNetworkingAPIGateway_EndpointAWS19'
        shape :amazon_vpctraffic_mirroring_aws19                           ,
              'shape=mxgraph.aws4.vpc_traffic_mirroring;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonVPCTrafficMirroringAWS19'
        shape :awssiteto_site_vpnaws19                                     ,
              'shape=mxgraph.aws4.site_to_site_vpn;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSitetoSiteVPNAWS19'
        shape :elastic_load_balancing_applicationloadbalancer_aws19        ,
              'shape=mxgraph.aws4.application_load_balancer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'ElasticLoadBalancing_ApplicationloadbalancerAWS19'
        shape :elastic_load_balancing_elbaws19_v2                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_load_balancing;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'ElasticLoadBalancingELBAWS19_v2'
        shape :elastic_load_balancing_classicloadbalancer_aws19            ,
              'shape=mxgraph.aws4.classic_load_balancer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'ElasticLoadBalancing_ClassicloadbalancerAWS19'
        shape :elastic_load_balancing_networkloadbalancer_aws19            ,
              'shape=mxgraph.aws4.network_load_balancer;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'ElasticLoadBalancing_NetworkloadbalancerAWS19'
      end
      section :aws_19___roboti_cs do
        shape :robotics_aws19                                              ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.robotics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'RoboticsAWS19'
        shape :awsrobo_maker_aws19                                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.robotics;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSRoboMakerAWS19'
        shape :awsrobo_maker_cloud_extension_rosaws19                      ,
              'shape=mxgraph.aws4.cloud_extension_ros;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSRoboMaker_CloudExtensionROSAWS19'
        shape :awsrobo_maker_development_environment_aws19                 ,
              'shape=mxgraph.aws4.development_environment;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSRoboMaker_DevelopmentEnvironmentAWS19'
        shape :awsrobo_maker_fleet_management_aws19                        ,
              'shape=mxgraph.aws4.fleet_management;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSRoboMaker_FleetManagementAWS19'
        shape :awsrobo_maker_simulation_aws19                              ,
              'shape=mxgraph.aws4.simulation;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSRoboMaker_SimulationAWS19'
      end
      section :aws_19___satellite do
        shape :satellite_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.satellite;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'SatelliteAWS19'
        shape :awsground_station_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.ground_station;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSGroundStationAWS19'
      end
      section :aws_19___security_identity_compliance do
        shape :security_identityand_compliance_aws19                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.security_identity_and_compliance;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'SecurityIdentityandComplianceAWS19'
        shape :amazon_cloud_directory_aws19                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloud_directory;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonCloudDirectoryAWS19'
        shape :amazon_cognito_aws19                                        ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cognito;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonCognitoAWS19'
        shape :amazon_guard_duty_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.guardduty;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonGuardDutyAWS19'
        shape :amazon_inspector_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.inspector;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonInspectorAWS19'
        shape :amazon_macie_aws19                                          ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.macie;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonMacieAWS19'
        shape :awsartifact_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.artifact;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSArtifactAWS19'
        shape :awscertificate_manager_aws19                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.certificate_manager_3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCertificateManagerAWS19'
        shape :awscloud_hsmaws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.cloudhsm;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSCloudHSMAWS19'
        shape :awsdirectory_service_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.directory_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSDirectoryServiceAWS19'
        shape :awsfirewall_manager_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.firewall_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSFirewallManagerAWS19'
        shape :awsidentityand_access_management_iamaws19                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.identity_and_access_management;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSIdentityandAccessManagement_IAMAWS19'
        shape :awskey_management_service_aws19                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.key_management_service;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSKeyManagementServiceAWS19'
        shape :awsorganizations_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.organizations;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSOrganizationsAWS19'
        shape :awssecrets_manager_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.secrets_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSecretsManagerAWS19'
        shape :awssecurity_hub_aws19                                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.security_hub;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSecurityHubAWS19'
        shape :awsshield_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.shield;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSShieldAWS19'
        shape :awssingle_sign_on_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.single_sign_on;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSingleSignOnAWS19'
        shape :awswafaws19                                                 ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.waf;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSWAFAWS19'
        shape :amazon_inspector_agent_aws19                                ,
              'shape=mxgraph.aws4.agent;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonInspector_AgentAWS19'
        shape :awscertificate_manager_certificate_manager_aws19            ,
              'shape=mxgraph.aws4.certificate_manager_2;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSCertificateManager_CertificateManagerAWS19'
        shape :awsidentityand_access_management_iam_addon_aws19            ,
              'shape=mxgraph.aws4.addon;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_AddonAWS19'
        shape :awsidentityand_access_management_iam_awsstsaws19            ,
              'shape=mxgraph.aws4.sts;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_AWSSTSAWS19'
        shape :awsidentityand_access_management_iam_awsstsalternate_aws19  ,
              'shape=mxgraph.aws4.sts_alternate;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_AWSSTSAlternateAWS19'
        shape :awsidentityand_access_management_iam_data_encryption_key_aws19,
              'shape=mxgraph.aws4.data_encryption_key;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_DataEncryptionKeyAWS19'
        shape :awsidentityand_access_management_iam_encrypted_data_aws19 ,
              'shape=mxgraph.aws4.encrypted_data;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_EncryptedDataAWS19'
        shape :awsidentityand_access_management_iam_longterm_security_credential_aws19,
              'shape=mxgraph.aws4.long_term_security_credential;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_LongtermSecurityCredentialAWS19'
        shape :awsidentityand_access_management_iam_mfatoken_aws19         ,
              'shape=mxgraph.aws4.mfa_token;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_MFATokenAWS19'
        shape :awsidentityand_access_management_iam_permissions_aws19      ,
              'shape=mxgraph.aws4.permissions;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_PermissionsAWS19'
        shape :awsidentityand_access_management_iam_role_aws19             ,
              'shape=mxgraph.aws4.role;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_RoleAWS19'
        shape :awsidentityand_access_management_iam_temporary_security_credential_aws19,
              'shape=mxgraph.aws4.temporary_security_credential;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSIdentityandAccessManagementIAM_TemporarySecurityCredentialAWS19'
        shape :awsorganizations_account_aws19                              ,
              'shape=mxgraph.aws4.organizations_account;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOrganizations_AccountAWS19'
        shape :awsorganizations_organizational_unit_aws19                  ,
              'shape=mxgraph.aws4.organizations_organizational_unit;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSOrganizations_OrganizationalUnitAWS19'
        shape :awsshield_shield_advanced_aws19                             ,
              'shape=mxgraph.aws4.shield_shield_advanced;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSShield_ShieldAdvancedAWS19'
        shape :awswaf_filteringrule_aws19                                  ,
              'shape=mxgraph.aws4.filtering_rule;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSWAF_FilteringruleAWS19'
        shape :awsadconnector_aws19                                        ,
              'shape=mxgraph.aws4.ad_connector;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSADConnectorAWS19'
        shape :awssimple_adaws19                                           ,
              'shape=mxgraph.aws4.simple_ad;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSimpleADAWS19'
        shape :awsmanaged_microsoft_adaws19                                ,
              'shape=mxgraph.aws4.managed_ms_ad;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSManagedMicrosoftADAWS19'
        shape :awsresource_access_manager_aws19                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.resource_access_manager;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSResourceAccessManagerAWS19'
      end
      section :aws_19___storage do
        shape :storage_aws19                                               ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.storage;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;pointerEvents=1', 'StorageAWS19'
        shape :amazon_elastic_block_store_ebsaws19                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_block_store;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticBlockStoreEBSAWS19'
        shape :amazon_elastic_file_system_efsaws19                         ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.elastic_file_system;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonElasticFileSystem_EFSAWS19'
        shape :amazon_fsx_aws19                                            ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.fsx;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonFSxAWS19'
        shape :amazon_fsxfor_lustre_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.fsx_for_lustre;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonFSxforLustreAWS19'
        shape :amazon_fsxfor_windows_file_server_aws19                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.fsx_for_windows_file_server;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonFSxforWindowsFileServerAWS19'
        shape :amazon_s3glacier_aws19                                      ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.glacier;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonS3GlacierAWS19'
        shape :amazon_simple_storage_service_s3aws19                       ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.s3;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AmazonSimpleStorageServiceS3AWS19'
        shape :awsbackup_aws19                                             ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.backup;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSBackupAWS19'
        shape :awssnowball_green_aws19                                     ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.snowball;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSnowball_greenAWS19'
        shape :awssnowball_edge_green_aws19                                ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.snowball_edge;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSnowballEdge_greenAWS19'
        shape :awssnowmobile_green_aws19                                   ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.snowmobile;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSSnowmobile_greenAWS19'
        shape :awsstorage_gateway_aws19                                    ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.storage_gateway;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'AWSStorageGatewayAWS19'
        shape :amazon_elastic_block_store_ebs_snapshot_aws19               ,
              'shape=mxgraph.aws4.snapshot;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticBlockStoreEBS_SnapshotAWS19'
        shape :amazon_elastic_block_store_ebs_volume_aws19                 ,
              'shape=mxgraph.aws4.volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticBlockStoreEBS_VolumeAWS19'
        shape :amazon_s3glacier_archive_aws19                              ,
              'shape=mxgraph.aws4.archive;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonS3Glacier_ArchiveAWS19'
        shape :amazon_s3glacier_vault_aws19                                ,
              'shape=mxgraph.aws4.vault;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonS3Glacier_VaultAWS19'
        shape :amazon_simple_storage_service_s3_bucket_aws19               ,
              'shape=mxgraph.aws4.bucket;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleStorageServiceS3_BucketAWS19'
        shape :amazon_simple_storage_service_s3_bucketwith_objects_aws19   ,
              'shape=mxgraph.aws4.bucket_with_objects;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleStorageServiceS3_BucketwithObjectsAWS19'
        shape :amazon_simple_storage_service_s3_object_aws19               ,
              'shape=mxgraph.aws4.object;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonSimpleStorageServiceS3_ObjectAWS19'
        shape :awssnow_family_snowball_import_export_aws19                 ,
              'shape=mxgraph.aws4.import_export;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSSnowFamily_SnowballImportExportAWS19'
        shape :awsstorage_gateway_cached_volume_aws19                      ,
              'shape=mxgraph.aws4.cached_volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSStorageGateway_CachedVolumeAWS19'
        shape :awsstorage_gateway_non_cached_volume_aws19                  ,
              'shape=mxgraph.aws4.non_cached_volume;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSStorageGateway_NonCachedVolumeAWS19'
        shape :awsstorage_gateway_virtual_tape_library_aws19               ,
              'shape=mxgraph.aws4.virtual_tape_library;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AWSStorageGateway_VirtualTapeLibraryAWS19'
        shape :amazon_elastic_file_system_efs_filesystem_aws19             ,
              'shape=mxgraph.aws4.file_system;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;pointerEvents=1', 'AmazonElasticFileSystem_EFS_FilesystemAWS19'
        shape :efsinfrequent_access_aws19                                  ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.efs_infrequentaccess;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'EFSInfrequentAccessAWS19'
        shape :efsstandard_aws19                                           ,
              'shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.efs_standard;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=#ffffff;pointerEvents=1', 'EFSStandardAWS19'
      end
      section :gcp___service_cards do
        shape :gcpservice_card_application_system_block                    , cs.to_s, 'GCPServiceCardApplicationSystemBlock'
        shape :gcpservice_card_authorization_block                         , cs.to_s, 'GCPServiceCardAuthorizationBlock'
        shape :gcpservice_card_blank_block                                 , cs.to_s, 'GCPServiceCardBlankBlock'
        shape :gcpservice_card_really_blank_block                          , cs.to_s, 'GCPServiceCardReallyBlankBlock'
        shape :gcpservice_card_bucket_block                                , cs.to_s, 'GCPServiceCardBucketBlock'
        shape :gcpservice_card_cdninterconnect_block                       , cs.to_s, 'GCPServiceCardCDNInterconnectBlock'
        shape :gcpservice_card_cloud_dnsblock                              , cs.to_s, 'GCPServiceCardCloudDNSBlock'
        shape :gcpservice_card_cluster_block                               , cs.to_s, 'GCPServiceCardClusterBlock'
        shape :gcpservice_card_disk_snapshot_block                         , cs.to_s, 'GCPServiceCardDiskSnapshotBlock'
        shape :gcpservice_card_edge_pop_block                              , cs.to_s, 'GCPServiceCardEdgePopBlock'
        shape :gcpservice_card_front_end_platform_services_block           , cs.to_s, 'GCPServiceCardFrontEndPlatformServicesBlock'
        shape :gcpservice_card_gateway_block                               , cs.to_s, 'GCPServiceCardGatewayBlock'
        shape :gcpservice_card_google_network_block                        , cs.to_s, 'GCPServiceCardGoogleNetworkBlock'
        shape :gcpservice_card_image_services_block                        , cs.to_s, 'GCPServiceCardImageServicesBlock'
        shape :gcpservice_card_load_balancer_block                         , cs.to_s, 'GCPServiceCardLoadBalancerBlock'
        shape :gcpservice_card_local_compute_block                         , cs.to_s, 'GCPServiceCardLocalComputeBlock'
        shape :gcpservice_card_local_storage_block                         , cs.to_s, 'GCPServiceCardLocalStorageBlock'
        shape :gcpservice_card_logs_apiblock                               , cs.to_s, 'GCPServiceCardLogsAPIBlock'
        shape :gcpservice_card_memcache_block                              , cs.to_s, 'GCPServiceCardMemcacheBlock'
        shape :gcpservice_card_natblock                                    , cs.to_s, 'GCPServiceCardNATBlock'
        shape :gcpservice_card_payment_form_block                          , cs.to_s, 'GCPServiceCardPaymentFormBlock'
        shape :gcpservice_card_push_notifications_block                    , cs.to_s, 'GCPServiceCardPushNotificationsBlock'
        shape :gcpservice_card_scheduled_tasks_block                       , cs.to_s, 'GCPServiceCardScheduledTasksBlock'
        shape :gcpservice_card_service_discovery_block                     , cs.to_s, 'GCPServiceCardServiceDiscoveryBlock'
        shape :gcpservice_card_squid_proxy_block                           , cs.to_s, 'GCPServiceCardSquidProxyBlock'
        shape :gcpservice_card_task_queues_block                           , cs.to_s, 'GCPServiceCardTaskQueuesBlock'
        shape :gcpservice_card_virtual_file_system_block                   , cs.to_s, 'GCPServiceCardVirtualFileSystemBlock'
        shape :gcpservice_card_vpngateway_block                            , cs.to_s, 'GCPServiceCardVPNGatewayBlock'
      end
      section :gcp___device_cards do
        shape :gcpinput_database                                           , cs.to_s, 'GCPInputDatabase'
        shape :gcpinput_record                                             , cs.to_s, 'GCPInputRecord'
        shape :gcpinput_payment                                            , cs.to_s, 'GCPInputPayment'
        shape :gcpinput_gateway                                            , cs.to_s, 'GCPInputGateway'
        shape :gcpinput_local_compute                                      , cs.to_s, 'GCPInputLocalCompute'
        shape :gcpinput_beacon                                             , cs.to_s, 'GCPInputBeacon'
        shape :gcpinput_storage                                            , cs.to_s, 'GCPInputStorage'
        shape :gcpinput_list                                               , cs.to_s, 'GCPInputList'
        shape :gcpinput_stream                                             , cs.to_s, 'GCPInputStream'
        shape :gcpinput_mobile_devices                                     , cs.to_s, 'GCPInputMobileDevices'
        shape :gcpinput_circuit_board                                      , cs.to_s, 'GCPInputCircuitBoard'
        shape :gcpinput_live                                               , cs.to_s, 'GCPInputLive'
        shape :gcpinput_users                                              , cs.to_s, 'GCPInputUsers'
        shape :gcpinput_laptop                                             , cs.to_s, 'GCPInputLaptop'
        shape :gcpinput_application                                        , cs.to_s, 'GCPInputApplication'
        shape :gcpinput_lightbulb                                          , cs.to_s, 'GCPInputLightbulb'
        shape :gcpinput_game                                               , cs.to_s, 'GCPInputGame'
        shape :gcpinput_desktop                                            , cs.to_s, 'GCPInputDesktop'
        shape :gcpinput_desktop_and_mobile                                 , cs.to_s, 'GCPInputDesktopAndMobile'
        shape :gcpinput_webcam                                             , cs.to_s, 'GCPInputWebcam'
        shape :gcpinput_speaker                                            , cs.to_s, 'GCPInputSpeaker'
        shape :gcpinput_retail                                             , cs.to_s, 'GCPInputRetail'
        shape :gcpinput_report                                             , cs.to_s, 'GCPInputReport'
        shape :gcpinput_phone                                              , cs.to_s, 'GCPInputPhone'
        shape :gcpinput_blank                                              , cs.to_s, 'GCPInputBlank'
      end
      section :site_map do
        shape :smpage                                                      , cs.to_s, 'SMPage'
        shape :smhome                                                      , "#{s}sitemap.home;strokeColor=#000000;fillColor=#E6E6E6", 'SMHome'
        shape :smgallery                                                   , "#{s}sitemap.gallery;strokeColor=#000000;fillColor=#E6E6E6", 'SMGallery'
        shape :smshopping                                                  , "#{s}sitemap.shopping;strokeColor=#000000;fillColor=#E6E6E6", 'SMShopping'
        shape :smmap                                                       , "#{s}sitemap.map;strokeColor=#000000;fillColor=#E6E6E6", 'SMMap'
        shape :smathletics                                                 , "#{s}sitemap.sports;strokeColor=#000000;fillColor=#E6E6E6", 'SMAthletics'
        shape :smlogin                                                     , "#{s}sitemap.login;strokeColor=#000000;fillColor=#E6E6E6", 'SMLogin'
        shape :smprint                                                     , "#{s}sitemap.print;strokeColor=#000000;fillColor=#E6E6E6", 'SMPrint'
        shape :smscript                                                    , "#{s}sitemap.script;strokeColor=#000000;fillColor=#E6E6E6", 'SMScript'
        shape :smsearch                                                    , "#{s}sitemap.search;strokeColor=#000000;fillColor=#E6E6E6", 'SMSearch'
        shape :smsettings                                                  , "#{s}sitemap.settings;strokeColor=#000000;fillColor=#E6E6E6", 'SMSettings'
        shape :smsitemap                                                   , "#{s}sitemap.sitemap;strokeColor=#000000;fillColor=#E6E6E6", 'SMSitemap'
        shape :smsuccess                                                   , "#{s}sitemap.success;strokeColor=#000000;fillColor=#E6E6E6", 'SMSuccess'
        shape :smvideo                                                     , "#{s}sitemap.video;strokeColor=#000000;fillColor=#E6E6E6", 'SMVideo'
        shape :smaudio                                                     , "#{s}sitemap.audio;strokeColor=#000000;fillColor=#E6E6E6", 'SMAudio'
        shape :smblog                                                      , "#{s}sitemap.blog;strokeColor=#000000;fillColor=#E6E6E6", 'SMBlog'
        shape :smcalendar                                                  , "#{s}sitemap.calendar;strokeColor=#000000;fillColor=#E6E6E6", 'SMCalendar'
        shape :smchart                                                     , "#{s}sitemap.chart;strokeColor=#000000;fillColor=#E6E6E6", 'SMChart'
        shape :smcloud                                                     , "#{s}sitemap.cloud;strokeColor=#000000;fillColor=#E6E6E6", 'SMCloud'
        shape :smdocument                                                  , "#{s}sitemap.document;strokeColor=#000000;fillColor=#E6E6E6", 'SMDocument'
        shape :smdownload                                                  , "#{s}sitemap.download;strokeColor=#000000;fillColor=#E6E6E6", 'SMDownload'
        shape :smerror                                                     , "#{s}sitemap.error;strokeColor=#000000;fillColor=#E6E6E6", 'SMError'
        shape :smform                                                      , "#{s}sitemap.form;strokeColor=#000000;fillColor=#E6E6E6", 'SMForm'
        shape :smgame                                                      , "#{s}sitemap.game;strokeColor=#000000;fillColor=#E6E6E6", 'SMGame'
        shape :smjobs                                                      , "#{s}sitemap.jobs;strokeColor=#000000;fillColor=#E6E6E6", 'SMJobs'
        shape :smlucid                                                     , "#{s}sitemap.home;strokeColor=#000000;fillColor=#E6E6E6", 'SMLucid'
        shape :smnewspress                                                 , "#{s}sitemap.news;strokeColor=#000000;fillColor=#E6E6E6", 'SMNewspress'
        shape :smphoto                                                     , "#{s}sitemap.photo;strokeColor=#000000;fillColor=#E6E6E6", 'SMPhoto'
        shape :smportfolio                                                 , "#{s}sitemap.portfolio;strokeColor=#000000;fillColor=#E6E6E6", 'SMPortfolio'
        shape :smpricing                                                   , "#{s}sitemap.pricing;strokeColor=#000000;fillColor=#E6E6E6", 'SMPricing'
        shape :smprofile                                                   , "#{s}sitemap.profile;strokeColor=#000000;fillColor=#E6E6E6", 'SMProfile'
        shape :smslideshow                                                 , "#{s}sitemap.slideshow;strokeColor=#000000;fillColor=#E6E6E6", 'SMSlideshow'
        shape :smupload                                                    , "#{s}sitemap.upload;strokeColor=#000000;fillColor=#E6E6E6", 'SMUpload'
      end
      section :svg_shapes do
        shape :svgpath_block2                                              , cs.to_s, 'SVGPathBlock2'
      end
      section :special_cases do
        shape :presentation_frame_block                                    , cs.to_s, 'PresentationFrameBlock'
      end
      section :timeline do
        shape :timeline_block                                              , cs.to_s, 'TimelineBlock'
        shape :timeline_milestone_block                                    , cs.to_s, 'TimelineMilestoneBlock'
        shape :timeline_interval_block                                     , cs.to_s, 'TimelineIntervalBlock'
        shape :minimal_text_block                                          , 'strokeColor=none;fillColor=none', 'MinimalTextBlock'
      end
      section :freehand do
        shape :freehand_block                                              , cs.to_s, 'FreehandBlock'
      end
      section :ext_shapes do
        shape :ext_shape_laptop_block                                      , "#{ss}citrix.laptop_2;verticalLabelPosition=bottom;verticalAlign=top", 'ExtShapeLaptopBlock'
        shape :ext_shape_server_block                                      , "#{ss}citrix.tower_server;verticalLabelPosition=bottom;verticalAlign=top", 'ExtShapeServerBlock'
        shape :ext_shape_cloud_block                                       , "#{ss}citrix.cloud;verticalLabelPosition=bottom;verticalAlign=top", 'ExtShapeCloudBlock'
        shape :ext_shape_user_block                                        , "#{ss}aws3d.end_user;verticalLabelPosition=bottom;verticalAlign=top;fillColor=#073763", 'ExtShapeUserBlock'
        shape :ext_shape_workstation_lcdblock                              , "#{ss}veeam.3d.workstation;verticalLabelPosition=bottom;verticalAlign=top", 'ExtShapeWorkstationLCDBlock'
      end
      section :infographi_cs do
        shape :infographics_block                                          , cs.to_s, 'InfographicsBlock'
      end
      section :other do
        shape :flexible_polygon_block                                      , cs.to_s, 'FlexiblePolygonBlock'
        shape :person_role_block                                           , cs.to_s, 'PersonRoleBlock'
      end
    end
  end
  # :nocov:
end
