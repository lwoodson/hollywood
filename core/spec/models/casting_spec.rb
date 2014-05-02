require_relative '../spec_helper'

describe Core::Casting do
  let(:movie) {Core::Movie.create! title: 'test', production_start: Time.now}
  let(:actor) {Core::Actor.create! first_name: 'Bob', last_name: 'Barker'}
  let(:casting) {Core::Casting.new movie_id: movie.id, actor_id: actor.id}

  describe "#save!" do
    it "should not allow creation without a movie reference" do
      casting.movie_id = nil
      proc {casting.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should not allow creation without an actor reference" do
      casting.actor_id = nil
      proc {casting.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should allow creation with both a movie and actor reference" do
      casting.save!
      Core::Casting.find(casting.id).must_equal(casting)
    end
  end
end
