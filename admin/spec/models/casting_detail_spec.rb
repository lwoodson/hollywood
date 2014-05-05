require_relative '../spec_helper'

describe Admin::CastingDetail do
  describe "validations" do
    it "should accept unquestionably good data" do
      Admin::CastingDetail.new(id: 1, role: 'hero')
        .valid?.must_equal(true)
    end

    it "should accept a String integer id" do
      Admin::CastingDetail.new(id: "1", role: 'hero')
        .valid?.must_equal(true)
    end

    it "should not accept a non-integer id" do
      Admin::CastingDetail.new(id: "foo", role: 'hero')
        .valid?.must_equal(false)
    end

    it "should not accept a nil role" do
      Admin::CastingDetail.new(id: 1, role: nil)
        .valid?.must_equal(false)
    end

    it "should not accept an empty role" do
      Admin::CastingDetail.new(id: 1, role: '')
        .valid?.must_equal(false)
    end
  end

  describe "equality" do
    let(:cd1) {Admin::CastingDetail.new(id: 1, role: 'hero')}
    let(:cd2) {Admin::CastingDetail.new(id: 1, role: 'hero')}
    let(:cd3) {Admin::CastingDetail.new(id: 2, role: 'hero')}

    it "should indicate two casting details with the same attributes are equal" do
      cd1.must_equal(cd2)
    end

    it "should indicate two casting details with different attributes are not equal" do
      cd1.wont_equal(cd3)
    end

    it "should behave as expected in a Set" do
      s = Set.new([cd1, cd2, cd3])
      s.size.must_equal(2)
      s.include?(cd1).must_equal(true)
      s.include?(cd2).must_equal(true)
      s.include?(cd3).must_equal(true)
    end
  end
end
