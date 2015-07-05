require 'minitest/autorun'
require './line_processor'
require './line'

class TestLineProcessor < MiniTest::Unit::TestCase


  describe "Creating Roman Numbers" do

    before do
      @line_processor = LineProcessor.new
      @line1 = Line.new("blog is X")
      @line2 = Line.new("plog is X")
      @line_processor.add_line(@line1)
      @line_processor.add_line(@line2)
      @line_processor.process

      @variables_to_test = ["plog", "blog"]
      @variables = {"plog"=> "X", "blog"=> "L", "trek" => "I", "big"=> "I"}
    end

     it "should concatenate roman numbers" do
       @line_processor.send(:concatenate_roman_numbers,@variables_to_test).must_equal "XX"
    end

     it "should generated a formatted arabic number" do
       @line_processor.send(:generate_formatted_output,"XX", @variables_to_test).must_equal "plog blog is 20"
       @line_processor.send(:generate_formatted_output,"XL", @variables_to_test).must_equal "plog blog is 40"
       @line_processor.send(:generate_formatted_output,"XXX", @variables_to_test).must_equal "plog blog is 30"
       @line_processor.send(:generate_formatted_output,"C", @variables_to_test).must_equal "plog blog is 100"
       @line_processor.send(:generate_formatted_output,"CXLIV", @variables_to_test).must_equal "plog blog is 144"
     end

     it "get variables from a how much line" do
       @line_processor.send(:how_much_variables, "how much is plog blog?").must_equal ["plog", "blog"]
       @line_processor.send(:how_much_variables, "how much is pish blog?").must_equal ["pish", "blog"]
     end

     it "get variables from a how many line" do
       @line_processor.send(:how_many_variables, "how many credits is pish blog?").must_equal ["pish", "blog"]
     end

  end

end
