require_relative '../spec_helper'

describe Core::Movie do
  let(:movie) {Core::Movie.new title: 'test', production_start: Time.now}
  describe "#save!" do
    it "should not be able to be created without a title" do
      movie.title = nil
      proc {movie.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should not be able to be created without a production_start date" do
      movie.production_start = nil
      proc {movie.save!}.must_raise ActiveRecord::RecordInvalid
    end

    it "should be able to be created with both a title and production_start date" do
      movie.save!
      Core::Movie.find(movie.id).must_equal(movie)
    end
  end

  describe "relationships" do
    let(:actor) {Core::Actor.new first_name: 'bob', last_name: 'barker'}
    let(:casting) {Core::Casting.new movie_id: movie.id, actor_id: actor.id}

    before do
      movie.save!
      actor.save!
      casting.save!
      movie.reload
    end

    it "should have many castings" do
      movie.castings.must_equal([casting])
    end

    it "should have many actors" do
      movie.actors.must_equal([actor])
    end
  end
end
