require 'kartit/autocompletion'
require 'clamp'

module Kartit
  class AbstractCommand < Clamp::Command

    extend Autocompletion

    def run(arguments)
      load_settings
      exit_code = super(arguments)
      raise "exit code must be integer" unless exit_code.is_a? Integer
      return exit_code
    end

    def parse(arguments)
      super(arguments)
      validate_options
    end

    def execute
    end

    def validate_options
    end

    def load_settings
      Kartit::Settings.load(YAML::load(File.open('/root/foreman_cli_draft/kartit/config/cli_config.yml')))
      #Kartit::Settings.load(YAML::load(File.open('~/.foreman/cli_config.yml')))
      #Kartit::Settings.load(YAML::load(File.open('/etc/foreman/cli_config.yml')))
    end

    protected

    def all_options
      self.class.declared_options.inject({}) do |h, opt|
        h[opt.attribute_name] = send(opt.read_method)
        h
      end
    end

    def options
      all_options.reject {|key, value| value.nil? }
    end

  end
end
