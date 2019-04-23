# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :price_histories
  belongs_to :user
  has_many :listing
  has_many :orders
end
