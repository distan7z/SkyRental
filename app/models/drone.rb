class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true }
    }
end
