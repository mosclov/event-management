class Prospect < ApplicationRecord
  validates :name, presence: true
  has_many :notes, dependent: :destroy
end
