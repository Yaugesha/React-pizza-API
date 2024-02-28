class Pizza < ApplicationRecord
  has_many :pizza_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_ingredients

  has_many :order_items
  has_many :orders, through: :order_items
end
