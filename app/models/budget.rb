class Budget < ApplicationRecord

  has_many :expenses, dependent: :destroy
  # The distinct option prevents budgets from saving multiple categories
  has_many :categories, -> { distinct }, through: :expenses, validate: :false
  
  belongs_to :user
  
  def category_included?(id)
    # Checks if a category with the passed ID exists
    # And if it is included in the budgets categories collection
    Category.exists?(id) && self.categories.includes(Category.find(id))
  end
  
end
