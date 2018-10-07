class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number
  validates_presence_of :result


   default_scope { order(id: :asc) }

   scope :successful, -> { where(result: 'success') }
end
