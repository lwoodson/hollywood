module Core
  class Actor < ActiveRecord::Base
    validates :first_name, :last_name, presence: true
    has_many :castings
    has_many :movies, through: :castings
  end
end
