module Core
  class Casting < ActiveRecord::Base
    validates :movie_id, :actor_id, presence: true
    belongs_to :movie
    belongs_to :actor
  end
end
