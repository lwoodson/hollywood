module Core
  class Movie < ActiveRecord::Base
    validates :title, :production_start, presence: true
  end
end
