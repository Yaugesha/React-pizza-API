class Pizza < ApplicationRecord
    has_many :pizzasIngredient, dependent: :destroy
    has_many :ingredients, through: :pizzasIngredient
    
    validates :name, presence: true
    validates :unitPrice, presence: true
end
