# frozen_string_literal: true

class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :shopping_carts, dependent: :destroy
end
