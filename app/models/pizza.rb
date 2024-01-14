class Pizza < ApplicationRecord
    validates :name, presence: true
    validates :unitPrice, presence: true
end
