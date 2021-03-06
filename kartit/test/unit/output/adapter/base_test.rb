require_relative '../../test_helper'

describe Kartit::Output::Adapter::Base do

  let(:adapter) { Kartit::Output::Adapter::Base.new }

  context "print_records" do

    let(:field_name) { Kartit::Output::Field.new(:name, "Name") }
    let(:fields) {
      [field_name]
    }
    let(:data) {[{
      :name => "John Doe"
    }]}

    it "should print header" do
      proc { adapter.print_records([], [], "HEADER") }.must_output(/.*HEADER.*/, "")
    end

    it "should print field name" do
      proc { adapter.print_records(fields, data) }.must_output(/.*Name[ ]*:.*/, "")
    end

    it "should print field value" do
      proc { adapter.print_records(fields, data) }.must_output(/.*John Doe.*/, "")
    end

  end

end
