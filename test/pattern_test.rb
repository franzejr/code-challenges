require 'minitest/autorun'
require './pattern'

class TestPattern < MiniTest::Unit::TestCase
  describe "Testing matches" do

    it "returns assigned pattern type" do
      p = Pattern.new("glob is I")
      assert_equal p.name, :assigned
     end

    it "returns credits type" do
      p = Pattern.new("glob glob Silver is 34 Credits")
      assert_equal p.name,:credits
     end

    it "returns how_much type" do
      p = Pattern.new("how much is pish tegj glob glob ?")
      assert_equal p.name,:how_much
     end

    it "returns how_many type" do
      p = Pattern.new("how many Credits is glob prok Iron ?")
      assert_equal p.name,:how_many
     end

    it "returns nil" do
      p = Pattern.new("aadsadsad how many Caaaredits is glob prok Iron ?")
      assert_equal p.name, nil
      assert_equal p.pattern, nil
     end

  end
end
