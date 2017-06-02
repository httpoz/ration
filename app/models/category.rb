class Category < ApplicationRecord
  
  has_many :expenses, dependent: :destroy
  
  validates :name, presence: true
  
end
