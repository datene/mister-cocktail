class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, :cocktail_id, :ingredient_id, presence: true
  validates :ingredient_id, uniqueness:{ scope: :cocktail_id }
  validates :cocktail, presence: true
  validates :ingredient, presence: true
end
