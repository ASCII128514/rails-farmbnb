# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :price_histories, dependent: :destroy
  belongs_to :user
  has_many :listing, dependent: :destroy
  has_many :orders, dependent: :destroy
end
