# frozen_string_literal: true

class Category < ApplicationRecord
  include NameSearchable
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
