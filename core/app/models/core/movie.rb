module Core
  class Movie < ActiveRecord::Base
    validates :title, :production_start, presence: true
    has_many :castings
    has_many :actors, through: :castings
  end
end
