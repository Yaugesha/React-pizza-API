class Pizza < ApplicationRecord
  has_many :pizza_ingredients, dependent: :destroy
  has_many :ingredients, through: :pizza_ingredients

  has_many :order_items
  has_many :orders, through: :order_items

  has_one_attached :image

  def image_url # imageUrl
    Rails.application.routes.url.helpers.url_to(image) if image.attached?
  end
end
