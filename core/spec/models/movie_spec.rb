require_relative '../spec_helper'

describe Core::Movie do
  subject {Core::Movie.new title: 'test', production_start: Time.now}
  describe "#save!" do
    it "should not be able to be created without a title" do
      subject.title = nil
      proc {subject.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should not be able to be created without a production_start date" do
      subject.production_start = nil
      proc {subject.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should be able to be created with both a title and production_start date" do
      subject.save!
      Core::Movie.find(subject.id).must_equal(subject)
    end
  end
end
