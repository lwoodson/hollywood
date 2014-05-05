module Admin
  ##
  # Transaction to create a batch of castings for a subject (movie or actor) to many
  # inverse objects (actor or movies).
  class CastingTransaction
    include Virtus.model
    include ActiveModel::Validations

    attribute :subject_type, String
    attribute :subject_id, Integer
    attribute :casting_details, Set[CastingDetail], default: Set.new

    validates_inclusion_of :subject_type, in: %w{Movie Actor}
    validates_presence_of :subject_id
    validates_length_of :casting_details, minimum: 1

    def valid?
      super && begin
        !casting_details.detect{|cd| !cd.valid?}
      end
    end

    def save!
      ActiveRecord::Base.transaction do
        raise ValidationFailed unless valid?
        casting_details.each do |casting_detail|
          create_casting_from(casting_detail)
        end
      end
    end

    private
    def create_casting_from(casting_detail)
      casting = Core::Casting.new
      if movie_subject?
        casting.movie_id = subject_id
        casting.actor_id = casting_detail.id
        casting.role = casting_detail.role
      else
        casting.actor_id = subject_id
        casting.movie_id = casting_detail.id
        casting.role = casting_detail.role
      end
      casting.save!
    end

    def movie_subject?
      subject_type == 'Movie'
    end

    def actor_subject?
      subject_type == 'Actor'
    end

    class ValidationFailed < StandardError
    end
  end
end
