KManager.action :transform_drawio_js do

  action do
    director = KDirector::Dsls::BasicDsl
      .init(k_builder,
        on_exist:                   :write,                      # %i[skip write compare]
        on_action:                  :execute                    # %i[queue execute]
      )
      .blueprint do
        cd(:data)

        source_file = '/Users/davidcruwys/dev/tools/drawio-desktop/drawio/src/main/webapp/js/diagramly/Extensions.js'
        target_file = k_builder.target_folders.get_filename(:data, 'extensions.js')

        clean = CleanExtensionsJs.new(source_file, target_file)

        cd(:lib)

        clean.parse

        add_file('drawio_extensions.json', content: clean.build_json)
        add('drawio_extensions.rb', constants: clean.constants, sections: clean.sections)
      end
  end
end

class CleanExtensionsJs
  def initialize(source_file, target_file)
    @source_file = source_file
    @target_file = target_file
    @source = File.read(@source_file)
    @constants = []
    @builder = ExtensionJsBuilder.new
  end

  def parse
    split_source
  end

  def build_json
    @builder.build_json
  end

  def build_ruby
    @builder.build_ruby
  end

  def constants
    @builder.constants.join("\n")
  end

  def sections
    @builder.sections.select { |s| s[:shapes].length > 0 }
  end

  private

  def split_source
    source_lines = @source.split("\n")
    section = :unknown

    source_lines.each do |line|
      if line.include?('// Global import transformation')
        section = :constants
        next
      elsif line.include?('var styleMap = {') && !line.include?('var styleMap = {};')
        puts '-----------------------------------'
        section = :style_map
        next
      elsif line.include?('};') ||
            line.include?('//Instead of doing a massive code refactoring, thees ugly global variables are used')
        section = :unknown
      end

      if section == :constants
        @builder.process_constant(line)
      end

      if section == :style_map
        @builder.process_style_map(line)
      end
    end
  end

  def process_style_map(line)
    line
  end
end

class ExtensionJsBuilder
  attr_accessor :constants
  attr_accessor :shapes
  attr_accessor :sections
  attr_accessor :current_section

  def initialize
    @constants = []
    @shapes = []
    @sections = []
    @current_section = nil
  end

  def process_constant(line)
    line = line.gsub('	', '').gsub('var ', '').gsub(/;$/, '')
    @constants << "      #{line}"
  end

  def process_style_map(line)
    line = clean_line(line)
    
    return if kill_line(line)

    if line.start_with?('#')
      set_section(line)
      return
    end

    return unless current_section

    parts = process_line(line)

    if parts.length == 2
      name = parts[0]
      style = parts[1]
      current_section[:shapes] << { name: name, style: style }
      shapes << line
    else
      puts 'length not 2'
      puts line
    end
  end

  def process_line(line)
    line.split(':').map { |s| s.strip.gsub('"', '') }
  end

  def clean_line(line)
    line
      .strip
      .gsub('  ', ' ')
      .gsub('	', ' ')
      .gsub(' :', ':')
      .gsub("don't", 'do not')
      .gsub('//TODO', '')
      .gsub(/(\/\/)([^ ])/) do |_|
        match = Regexp.last_match
        "// #{match[2]}"
      end
      .gsub("'", '"')
      .gsub('not all variants covered', '')
      .gsub('Timeline shape', '')
      .gsub('# not all variants covered', '')
      .gsub('not all versions supported', '')
      .gsub('ss + "', '"#{ss}')
      .gsub('s + "', '"#{s}')
      .gsub('cs,', '#{cs}')
      .gsub(/cs$/, '#{cs}')
      .gsub('" + containerStyle', '#{containerStyle}"')
      .gsub('kupIcon + "', '"#{kupIcon}')
      .gsub('gcpIcon + "', '"#{gcpIcon}')
      .gsub('azur19 + "', '"#{azur19}')
      .gsub('ssAzure + "', '"#{ssAzure}')
      .gsub('" + arcSize + "', '#{arcSize}')
      .gsub('//', '#')
      .gsub('  ', ' ')
      .gsub(', #', '')
      .strip
      .gsub(/,$/, '')
      .strip
  end

  def kill_line(line)
    line.end_with?('NA') ||
    line.end_with?('not working properly, needs specific code)') ||
    line.start_with?('Timeline shapes are postponed, this code is a work-in-progress') ||
    line.start_with?('# *******') ||
    line.start_with?('# 2019 mapping') ||
    line.include?('#  "') ||
    line.include?('# "') ||
    line.empty?
  end

  def set_section(line)
    section = line.gsub('#', '').strip
    @current_section = {
      name: section,
      shapes: []
    }
    @sections << current_section
  end

  def build_json
    JSON.pretty_generate(@sections)
  end
end