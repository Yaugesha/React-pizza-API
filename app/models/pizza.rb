class Pizza < ApplicationRecord
  has_many :pizza_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_ingredients

  has_many :order_items
  has_many :orders, through: :order_items

  has_one_attached :image

  def imageUrl
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
