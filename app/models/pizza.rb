class Pizza < ApplicationRecord
    has_many :pizzasIngredient, dependent: :destroy
    has_many :ingredients, through: :pizzasIngredient

    has_one_attached :imageUrl
    
    validates :name, presence: true
    validates :unitPrice, presence: true
    validates :soldOut, presence: true
    # validates :imageUrl, presence: true
end
