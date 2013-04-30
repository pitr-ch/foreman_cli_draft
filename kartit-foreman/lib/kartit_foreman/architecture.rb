require 'kartit'
require 'awesome_print'
require 'foreman_api'

module KartitForeman

  class ArchitectureCommand < Kartit::AbstractCommand
    def architecture options={}
      ForemanApi::Resources::Architecture.new(:base_url => 'http://localhost:3000',
                                                        :username => 'admin',
                                                        :password => 'changeme')
    end
  end


  class Architecture < Kartit::AbstractCommand
    class ListCommand < ArchitectureCommand
      def execute
        ap architecture.index[0]
      end
    end

    subcommand "list", "List foreman's architectures.", KartitForeman::Architecture::ListCommand
  end

end

Kartit::MainCommand.subcommand 'architecture', "Manipulate Foreman's architectures.", KartitForeman::Architecture
