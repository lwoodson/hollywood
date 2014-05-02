require_relative '../spec_helper'

describe Core::Actor do
  subject {Core::Actor.new first_name: 'Matt', last_name: 'Damon'}

  describe "#save!" do
    it "should not allow creation without a first name" do
      subject.first_name = nil
      proc {subject.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should not allow creation without a last name" do
      subject.last_name = nil
      proc {subject.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should allow creation with both a first and last name" do
      subject.save!
      Core::Actor.find(subject.id).must_equal(subject)
    end
  end
end
