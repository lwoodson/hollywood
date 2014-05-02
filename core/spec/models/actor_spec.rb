require_relative '../spec_helper'

describe Core::Actor do
  let(:actor) {Core::Actor.new first_name: 'Matt', last_name: 'Damon'}

  describe "#save!" do
    it "should not allow creation without a first name" do
      actor.first_name = nil
      proc {actor.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should not allow creation without a last name" do
      actor.last_name = nil
      proc {actor.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should allow creation with both a first and last name" do
      actor.save!
      Core::Actor.find(actor.id).must_equal(actor)
    end
  end

  describe "relationships" do
    let(:movie) {Core::Movie.new title: 'foo', production_start: Time.now}
    let(:casting) {Core::Casting.new movie_id: movie.id, actor_id: actor.id}

    before do
      movie.save!
      actor.save!
      casting.save!
      movie.reload
    end

    it "should have many castings" do
      actor.castings.must_equal([casting])
    end

    it "should have many movies" do
      actor.movies.must_equal([movie])
    end
  end
end
