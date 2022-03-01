# frozen_string_literal: true

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

      it { is_expected.to be_a(DrawioDsl::Builder) }
    end
  end

  context 'scenarios' do
    let(:config_key) { :drawio_sample_spec }
    before do
      described_class
        .init(k_builder,
              on_exist: :write, # %i[skip write compare]
              on_action: :queue) # %i[queue execute]
        .page('Normal') do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Sketch') do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Shadow') do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Sketch+Shadow') do
          square
          rectangle
          rectangle(rounded: 1)
          circle
          process
          ellipse
        end
        .page('Klueless') do
          package('KCli') do
            p 'Create new KManager projects'
          end
          down
          package('KWatch') do
            p 'Watches a directory'
            br
            br
            p 'KManager.setup'
            p 'KManager.resource_changed(file, state)'
          end
          down
          package(:kmanager_package, title: 'KManager') do
            klass(:kmanager, title: 'KManager') do
              method('current_resource', type: :void, params: 'mutex_lock')

              notes do
                p 'setup'
                br
                section 'resource concurrency lock' do
                  p 'for_resource'
                  p 'for_current_resource'
                end
                section 'delegated to :manager' do
                  p '.areas'
                  p 'add_area'
                  p ':fire_actions'
                end
                section 'delegated to :document_factory' do
                  p '.model'
                  p '.csv'
                  p '.json'
                  p '.yaml'
                end
              end
            end
          end
          right
          box(w: 5000, h: 1000) do
            box do
              h3 'Some sample resources'
              p 'file://c/people.csv'
              p 'file://c/people.json'
              p 'file://c/list_people.rb'
              p 'https://gist.com/klueless-io/countries.json'
              p 'https://gist.com/klueless-io/site_definition.rb'
            end
            right
            box do
              h3 'Namespace / Unique key'
              p '[area][local namespace(s)][resource key][resource type]'
              p 'area namespace: default nil'
              p 'local namespaces: []'
              p 'resource key: default random_alpha_numeric(4)'
              p 'resource type: default(content_type)'
              br
              p 'example: people.csv (data)'
            end
            down

            klass(:kmanager_project, title: 'Manager (Project') do
              attribute '.areas'

              method('add_area', params: 'name, namespace: nil')
              method('fire_actions', params: '*actions')
              method('resource_changed', params: 'url, state')
              method('find_areas', params: 'url', type: 'area[]', private: true)
            end
            down
            klass(:area) do
              attribute '.name (reference)'
              attribute '.namespace'
              attribute '.configuration'
              attribute '.resource_manager'
            end
            right
            klass(:resource_manager) do
              method 'load_content'
              method 'register_documents'
              method 'execute_documents'
            end
            right
            box(w: 3000, h: 300) do
              klass(:resource_set) do
                attribute '.resources'
                method 'add_resource'
                method 'add_resources', params: '*resources'
              end
              klass(:resource_factory) do
                method 'instance', params: 'resource_rule', type: 'resource'
              end
              klass(:file_set) do
                attribute '.path_entries'
              end
              klass(:web_set) do
                attribute '.urls'
              end
            end
            down
            x_offset(-100)
            klass(:file_resource)
            right
            klass(:web_resource)
            right
            klass(:mem_resource)
            down
            x_offset(-100)
            klass(:base_resource) do
              attribute '.url'
              attribute '.schema'
              attribute '.status'
              attribute '.content_type [:csv, :json, :yaml, :ruby, :unknown]'
              attribute '.content'

              method 'load_content'
              method 'register_documents'
              method 'execute_documents'
            end
            down
            enum(:schema_values) do
              enum 'file'
              enum 'web', note: 'http:, https:'
              enum 'mem'
            end
            right
            enum(:status_values) do
              enum 'alive'
              enum 'content_loading'
              enum 'content_loaded'
              enum 'document_registering'
              enum 'document_registered'
              enum 'document_loading'
              enum 'document_loaded'
            end
            right
            y_offset(-100)
            klass(:resource_document_factory) do
              method 'create_documents(resource)'
            end
            condition(:is_content_type) do
              p '[Ruby, CSV, JSON, YAML, Other]'
              br
              p 'Is ContentType = Ruby'
            end
            klass(:document_factory, title: 'Document Factory (DSLs') do
              method 'for_resource', params: 'resource'
            end
            down
          end
          package(:kfile_set_package, title: 'KFileSet') do
            klass(:file_set) do
              attribute '.path', type: 'PathEntry[]'
              method 'add', params: 'glob', note: '**/*'
            end
            down
            box do
              klass(:white_list) do
                attribute '.paths'
                method 'add', params: 'glob', note: '**/*'
              end
              right
              klass(:glob_info)
              down
              klass(:glob_entry)
            end
            right
            klass(:path_entry, title: 'PathEntry(File URI)')
          end
          lines do
            line(:is_content_type, :document_factory, title: 'Yes (evaluate ruby file)')
            # line(:is_content_type, :document_factory, title: 'Yes (evaluate ruby file)')
          end
        end
        .create_diagram('x.xml')
        .create_diagram('x.drawio')
    end

    # it { director.builder.debug }
  end
end
