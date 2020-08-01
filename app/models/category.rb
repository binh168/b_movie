class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name).freeze

  has_many :films, dependent: :destroy

  validates :name, presence: true

  scope :create_at_desc, -> {order created_at: :desc}
  scope :select_category, -> {select(:id, :name)}
end
