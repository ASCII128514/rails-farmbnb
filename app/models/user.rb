# frozen_string_literal: true

class User < ApplicationRecord
  has_many :products
  has_many :shopping_carts
end
