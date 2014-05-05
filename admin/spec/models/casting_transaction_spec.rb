require_relative "../spec_helper"

describe Admin::CastingTransaction do
  let(:casting_detail) {Admin::CastingDetail.new id: 1, role: 'hero'}
  let(:casting_transaction) {Admin::CastingTransaction.new}

  before do
    casting_transaction.subject_type = 'Movie'
    casting_transaction.subject_id = 1
    casting_transaction.casting_details.add(casting_detail)
  end

  describe "validations" do
    it "should accept Movie as a subject type" do
      casting_transaction.subject_type = "Movie"
      casting_transaction.valid?.must_equal(true)
    end

    it "should accept Actor as a subject type" do
      casting_transaction.subject_type = "Actor"
      casting_transaction.valid?.must_equal(true)
    end

    it "should not accept a subject type that is not one of Movie or Actor" do
      casting_transaction.subject_type = "Director"
      casting_transaction.valid?.must_equal(false)
    end

    it "should require provision of a subject_id" do
      casting_transaction.subject_id = nil
      casting_transaction.valid?.must_equal(false)
    end

    it "should not accept an empty set of casting details" do
      casting_transaction.casting_details = Set.new
      casting_transaction.valid?.must_equal(false)
    end

    it "should not be valid if one of its casting details is invalid" do
      casting_transaction.casting_details << Admin::CastingDetail.new
      casting_transaction.valid?.must_equal(false)
    end
  end

  describe "parameter coersion" do
    let(:params) {
      {
        'subject_type' => 'Movie',
        'subject_id' => 1,
        'casting_details' => [
          {id: 1, role: 'hero'}
        ]
      }
    }
    let(:transaction) {Admin::CastingTransaction.new(params)}

    it "should accept a subject_id specified as a string" do
      params['subject_id'] = '1'
      transaction.valid?.must_equal(true)
    end

    it "should correctly coerce the casting_details to a set" do
      transaction.casting_details.instance_of?(Set).must_equal(true)
    end
  end

  describe "#save!" do
    it "should raise ValidationFailed if the transaction is invalid" do
      proc {Admin::CastingTransaction.new.save!}
        .must_raise Admin::CastingTransaction::ValidationFailed
    end
  end

  describe "when operating on Movie subject" do
    let(:gravity) {Core::Movie.create! title: 'Gravity', production_start: Date.new}
    let(:sandra_bullock) {Core::Actor.create! first_name: 'Sandra', last_name: 'Bullock'}
    let(:george_clooney) {Core::Actor.create! first_name: 'George', last_name: 'Clooney'}
    let(:transaction) do
      Admin::CastingTransaction.new(subject_type: 'Movie', subject_id: gravity.id).tap do |t|
        t.casting_details << Admin::CastingDetail.new(id: sandra_bullock.id, role: 'Ryan Stone')
        t.casting_details << Admin::CastingDetail.new(id: george_clooney.id, role: 'Matt Kowalski')
      end
    end

    before do
      transaction.save!
      gravity.reload
    end

    describe "#save!" do
      it "should save Casting records between the Movie and the Actors specified in the transaction" do
        gravity.castings.map(&:actor).must_include(sandra_bullock)
        gravity.castings.map(&:actor).must_include(george_clooney)
        gravity.castings.map(&:role).must_include('Ryan Stone')
        gravity.castings.map(&:role).must_include('Matt Kowalski')
      end
    end
  end

  describe "when operating on Actor subject" do
    let(:clint_eastwood) {Core::Actor.create! first_name: 'Clint', last_name: 'Eastwood'}
    let(:dirty_harry) {Core::Movie.create! title: 'Dirty Harry', production_start: Date.new}
    let(:good_bad_ugly) {Core::Movie.create! title: 'The Good, The Bad & The Ugly', production_start: Date.new}
    let(:transaction) do
      Admin::CastingTransaction.new(subject_type: 'Actor', subject_id: clint_eastwood.id).tap do |t|
        t.casting_details << Admin::CastingDetail.new(id: dirty_harry.id, role: 'Harry Callaghan')
        t.casting_details << Admin::CastingDetail.new(id: good_bad_ugly.id, role: 'Blondie')
      end
    end

    before do
      transaction.save!
      clint_eastwood.reload
    end

    describe "#save!" do
      it "should save Casting records between the Actor and the movies specified in the transaction" do
        clint_eastwood.castings.map(&:movie).must_include(dirty_harry)
        clint_eastwood.castings.map(&:movie).must_include(good_bad_ugly)
        clint_eastwood.castings.map(&:role).must_include('Harry Callaghan')
        clint_eastwood.castings.map(&:role).must_include('Blondie')
      end
    end
  end
end
