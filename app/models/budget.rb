class Budget < ApplicationRecord

  has_many :expenses, dependent: :destroy
  # The distinct option prevents budgets from saving multiple categories
  has_many :categories, -> { distinct }, through: :expenses
  
  belongs_to :user
  
  # Returns an array with a budgets categories OR 5 basic categories for 
  # Budgets without expenses ( like newly created ones )
  def get_categories
    !self.categories.empty? ? self.categories : Category.first(5) 
  end
  
end
