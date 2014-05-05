module Admin
  ##
  # Details of a casting including the inverse object id and the role being
  # cast for.
  class CastingDetail
    include Virtus.value_object
    include ActiveModel::Validations

    values do
      attribute :id, Integer
      attribute :role, String
    end

    validates_numericality_of :id, only_integer: true
    validates_presence_of :role
  end
end
