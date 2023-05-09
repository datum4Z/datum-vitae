class Experience < ApplicationRecord
  validates :position, presence: true

  has_many :experience_details, dependent: :destroy

  accepts_nested_attributes_for :experience_details, allow_destroy: true
end
