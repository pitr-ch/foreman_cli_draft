module Kartit::Output
  class Output

    def adapter= adapter
      @adapter = adapter
    end

    def adapter
      @adapter ||= Kartit::Output::Adapter::Base.new
    end

    def definition= definition
      @definition = definition
    end

    def definition
      @definition ||= Kartit::Output::Definition.new
    end

    def interpreter= interpreter
      @interpreter = interpreter
    end

    def interpreter
      @interpreter ||= Kartit::Output::DefinitionInterpreter.new
    end

    def print_message msg
      adapter.print_message(msg.to_s)
    end

    def print_error msg
      adapter.print_error(msg.to_s)
    end

    def print_records records, heading=nil
      records = [records] unless records.kind_of?(Array)

      interpreter.definition = definition
      interpreter.records = records
      adapter.print_records(interpreter.fields, interpreter.data, heading)
    end

  end
end
