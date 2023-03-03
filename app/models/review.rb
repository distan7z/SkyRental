class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)
  belongs_to :drone
  validates :content, presence: true
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
end
