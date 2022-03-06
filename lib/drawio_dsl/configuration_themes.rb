# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Configuration for each theme
  module ConfigurationThemes
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def add_themes
      @themes = {}

      add_theme(:style_01         , fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#333333')
      add_theme(:style_02         , fill_color: '#dae8fc', stroke_color: '#6c8ebf', font_color: '#333333')
      add_theme(:style_03         , fill_color: '#d5e8d4', stroke_color: '#82b366', font_color: '#333333')
      add_theme(:style_04         , fill_color: '#ffe6cc', stroke_color: '#d79b00', font_color: '#333333')
      add_theme(:style_05         , fill_color: '#fff2cc', stroke_color: '#d6b656', font_color: '#333333')
      add_theme(:style_06         , fill_color: '#f8cecc', stroke_color: '#b85450', font_color: '#333333')
      add_theme(:style_07         , fill_color: '#e1d5e7', stroke_color: '#9673a6', font_color: '#333333')
      add_theme(:style_08         , fill_color: '#60a917', stroke_color: '#2D7600', font_color: '#ffffff')
      add_theme(:style_09         , fill_color: '#008a00', stroke_color: '#005700', font_color: '#ffffff')
      add_theme(:style_10         , fill_color: '#1ba1e2', stroke_color: '#006EAF', font_color: '#ffffff')
      add_theme(:style_11         , fill_color: '#0050ef', stroke_color: '#001DBC', font_color: '#ffffff')
      add_theme(:style_12         , fill_color: '#6a00ff', stroke_color: '#3700CC', font_color: '#ffffff')
      add_theme(:style_13         , fill_color: '#aa00ff', stroke_color: '#7700CC', font_color: '#ffffff')
      add_theme(:style_14         , fill_color: '#d80073', stroke_color: '#A50040', font_color: '#ffffff')
      add_theme(:style_15         , fill_color: '#a20025', stroke_color: '#6F0000', font_color: '#ffffff')
      add_theme(:style_16         , fill_color: '#e51400', stroke_color: '#B20000', font_color: '#ffffff')
      add_theme(:style_17         , fill_color: '#fa6800', stroke_color: '#C73500', font_color: '#000000')
      add_theme(:style_18         , fill_color: '#f0a30a', stroke_color: '#BD7000', font_color: '#000000')
      add_theme(:style_19         , fill_color: '#e3c800', stroke_color: '#B09500', font_color: '#000000')
      add_theme(:style_20         , fill_color: '#6d8764', stroke_color: '#3A5431', font_color: '#ffffff')
      add_theme(:style_21         , fill_color: '#647687', stroke_color: '#314354', font_color: '#ffffff')
      add_theme(:style_22         , fill_color: '#76608a', stroke_color: '#432D57', font_color: '#ffffff')
      add_theme(:style_23         , fill_color: '#a0522d', stroke_color: '#6D1F00', font_color: '#ffffff')
      add_theme(:style_24         , fill_color: '#fad7ac', stroke_color: '#b46504', font_color: '#333333')
      add_theme(:style_25         , fill_color: '#fad9d5', stroke_color: '#ae4132', font_color: '#333333')
      add_theme(:style_26         , fill_color: '#b0e3e6', stroke_color: '#0e8088', font_color: '#000000')
      add_theme(:style_27         , fill_color: '#b1ddf0', stroke_color: '#10739e', font_color: '#000000')
      add_theme(:style_28         , fill_color: '#d0cee2', stroke_color: '#56517e', font_color: '#000000')
      add_theme(:style_29         , fill_color: '#bac8d3', stroke_color: '#23445d', font_color: '#000000')
      add_theme(:style_30         , fill_color: '#f5f5f5', stroke_color: '#666666', font_color: '#000000', gradient: '#b3b3b3')
      add_theme(:style_31         , fill_color: '#dae8fc', stroke_color: '#6c8ebf', font_color: '#000000', gradient: '#7ea6e0')
      add_theme(:style_32         , fill_color: '#d5e8d4', stroke_color: '#82b366', font_color: '#000000', gradient: '#97d077')
      add_theme(:style_33         , fill_color: '#ffcd28', stroke_color: '#d79b00', font_color: '#000000', gradient: '#ffa500')
      add_theme(:style_34         , fill_color: '#fff2cc', stroke_color: '#d6b656', font_color: '#000000', gradient: '#ffd966')
      add_theme(:style_35         , fill_color: '#f8cecc', stroke_color: '#b85450', font_color: '#000000', gradient: '#ea6b66')
      add_theme(:style_36         , fill_color: '#e6d0de', stroke_color: '#996185', font_color: '#000000', gradient: '#d5739d')
      add_theme(:style_37         , fill_color: '#eeeeee', stroke_color: '#36393d', font_color: '#000000')
      add_theme(:style_38         , fill_color: '#f9f7ed', stroke_color: '#36393d', font_color: '#000000')
      add_theme(:style_39         , fill_color: '#ffcc99', stroke_color: '#36393d', font_color: '#000000')
      add_theme(:style_40         , fill_color: '#cce5ff', stroke_color: '#36393d', font_color: '#000000')
      add_theme(:style_41         , fill_color: '#ffff88', stroke_color: '#36393d', font_color: '#000000')
      add_theme(:style_42         , fill_color: '#cdeb8b', stroke_color: '#36393d', font_color: '#000000')
      add_theme(:style_43         , fill_color: '#ffcccc', stroke_color: '#36393d', font_color: '#000000')
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
