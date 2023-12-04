class User < ApplicationRecord
    validates :product_name, presence: true
    validates :price, numericality: { message: "should be number" }
end