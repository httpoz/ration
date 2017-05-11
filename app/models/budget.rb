class Budget < ApplicationRecord

  has_many :expenses, dependent: :destroy
  belongs_to :user

end
